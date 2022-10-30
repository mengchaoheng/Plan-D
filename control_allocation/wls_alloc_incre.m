function [u] = wls_alloc_incre(v, u, p_limits, v_limits,incre)
% function [u] = wls_alloc_mch(v, u, umin, umax)
%  [u] = wls_alloc_mch(v,u,p_limits,v_limits)
% WLS_ALLOC - Control allocation using weighted least squares.
%  [u,W,iter] = wls_alloc(B,v,umin,umax,[Wv,Wu,ud,gamma,u0,W0,imax])
% Solves the weighted, bounded least-squares problem
%   min ||Wu(u-ud)||^2 + gamma ||Wv(Bu-v)||^2
%   subj. to  umin <= u <= umax
% using an active set method.
%  Inputs:
%  -------
% v     commanded virtual control (k x 1)
% u0    initial point (m x 1)
% W0    initial working set (m x 1) [empty]
% imax  max no. of iterations [100]
%  Outputs:
%  -------
% u     optimal control
% W     optimal active set
% iter  no. of iterations (= no. of changes in the working set + 1)
%                            0 if u_i not saturated
% Working set syntax: W_i = -1 if u_i = umin_i
%                           +1 if u_i = umax_i
% B         control effectiveness matrix (k x m).
% umin      lower position limits (m x 1).
% umax      upper position limits (m x 1).
% Wv        virtual control weighting matrix (k x k) [I].
% Wu        control weighting matrix (m x m) [I].
% gam       gamma weight (scalar) [1e6].
% ud        desired control (m x 1) [0].
% imax      maximum iterations.
% See also: WLSC_ALLOC, IP_ALLOC, FXP_ALLOC, QP_SIM.
% param of ducted fan
% 使用力矩单位
% ======================multi ducted fan param=========================
% kc=3.157;
% l_1=0.17078793-0.09;% roll,pitch
% l_2=0.175;% T
% l_3=0.06647954;% yaw1 yaw3
% l_4=0.06647954+0.175;% yaw4
% l_5=0.175-0.06647954;% yaw2
% I_x=0.054593;
% I_y=0.017045;
% I_z=0.049226;
% I=[I_x 0 0;0 I_y 0;0 0 I_z];
% =========================10 sureface=================================
% K=[-kc*l_1/5 0 kc*l_1/5 0 -kc*l_1/5 0 kc*l_1/5 0 2*l_2/5;
%     0 -kc*l_1/4 0 kc*l_1/4 0 -kc*l_1/4 0 kc*l_1/4 0;
%     kc*l_3/8 -kc*l_5/8 kc*l_3/8 kc*l_4/8 kc*l_3/8 kc*l_4/8 kc*l_3/8 -kc*l_5/8 0];
% B=I\K;
% umin=[[1;1;1;1;1;1;1;1]*-20*pi/180;-0.3*9.788];umax=[[1;1;1;1;1;1;1;1]*20*pi/180;0.3*9.788];
% Wu=eye(9);
% ud=zeros(9,1);
% % Number of variables.
% m = 9;
%===================================================
% =========================8 sureface=================================
% K=[-kc*l_1/4 0 kc*l_1/4 0 -kc*l_1/4 0 kc*l_1/4 0;
%     0 -kc*l_1/4 0 kc*l_1/4 0 -kc*l_1/4 0 kc*l_1/4;
%     kc*l_3/8 -kc*l_5/8 kc*l_3/8 kc*l_4/8 kc*l_3/8 kc*l_4/8 kc*l_3/8 -kc*l_5/8 ];
% B=I\K;
% umin=[1;1;1;1;1;1;1;1]*-20*pi/180;umax=[1;1;1;1;1;1;1;1]*20*pi/180;
% Wu=eye(8);
% ud=zeros(8,1);
% % Number of variables.
% m = 8;
%========================================
% K=[-kc*l_1/4    -kc*l_1/4   0           kc*l_1/4    kc*l_1/4    0;
%     0           0           -kc*l_1/2   0           0           kc*l_1/2;
%     kc*l_3/6    kc*l_3/6    kc*l_4/6    kc*l_3/6    kc*l_3/8    kc*l_4/6 ];
% B=I\K;
% umin=[1;1;1;1;1;1]*-20*pi/180;umax=[1;1;1;1;1;1]*20*pi/180;
% Wu=eye(6);
% ud=zeros(6,1);
% % Number of variables.
% m = 6;
% 弧度单位
%==============使用等价模型，弧度单位==============
B=[-0.5   0       0.5   0;
    0  -0.5    0       0.5;
    0.25   0.25   0.25   0.25];
B=[-0.5393   0       0.5393   0;
     0  -0.5393    0       0.5393;
    0.2099   0.2099   0.2099   0.2099];
% B=[-0.5393   0       0.5393   0;
%      0  -0.5393    0       0.5393;
%     0.2099   0.2099   0.2099   0.2099];
%====仅幅值约束================
last_u=u;
if(~v_limits)
    if(incre)
        last_v=B*last_u;
        umin=[1;1;1;1]*(-p_limits)*pi/180-last_u;
        umax=[1;1;1;1]*p_limits*pi/180-last_u;
        v=v-last_v;
        u=[0;0;0;0];
    else
        umin=[1;1;1;1]*(-p_limits)*pi/180;
        umax=[1;1;1;1]*p_limits*pi/180;
    end
%====幅值、速度约束================ 
else
    if(incre)
        last_v=B*last_u;
        umin=max([1;1;1;1]*(-p_limits)*pi/180-last_u,-0.01*500*pi/180);
        umax=min([1;1;1;1]*p_limits*pi/180-last_u,0.01*500*pi/180);
        v=v-last_v;
        u=[0;0;0;0];
    else
        umin=max([1;1;1;1]*(-p_limits)*pi/180,-0.01*500*pi/180+last_u);
        umax=min([1;1;1;1]*p_limits*pi/180,0.01*500*pi/180+last_u);
    end
end
%========计算当前有效集============
W=zeros(4,1);
infeasible1 = (u <= umin);
W(infeasible1)=-1;
infeasible2 = (u >= umax);
W(infeasible2)= 1;
%===============期望舵机位置========================
ud=[0;0;0;0];% 可作为输入

% Number of variables.
m = 4;
%================================
% 加权系数
gam=1e6;
% 加权矩阵
Wv=eye(3);
Wu=eye(4);
%Wv1=Wv*0.5*y;
% 迭代次数上限
imax=100;
% Set default values of optional arguments.
gam_sq = sqrt(gam);
A = [gam_sq*Wv*B ;Wu];
b = [gam_sq*Wv*v ;Wu*ud];

% Initial residual.
d = b - A*u;
% Determine indeces of free variables.
i_free = W==0;

% Iterate until optimum is found or maximum number of iterations
% is reached.

for iter = 1:imax
    % ----------------------------------------
    %  Compute optimal perturbation vector p.
    % ----------------------------------------
    % Eliminate saturated variables.
    A_free = A(:,i_free);
    % Solve the reduced optimization problem for free variables.
    p_free = A_free\d;
    % Zero all perturbations corresponding to active constraints.
    p = zeros(m,1);
    % Insert perturbations from p_free into free the variables.
    p(i_free) = p_free;
    
    % ----------------------------
    %  Is the new point feasible?
    % ----------------------------
    
    u_opt = u + p;
    infeasible = (u_opt < umin) | (u_opt > umax);
    
    if ~any(infeasible(i_free))
        
        % ----------------------------
        %  Yes, check for optimality.
        % ----------------------------
        
        % Update point and residual.
        u = u_opt;
        d = d - A_free*p_free;
        % 判别推出循环条件
%         if norm(p)<=eps
        % Compute Lagrangian multipliers.
        lambda = W.*(A'*d);
        % Are all lambda non-negative?
        if lambda >= -eps
            % / ------------------------ \
            % | Optimum found, bail out. |
            % \ ------------------------ /
            if(incre)
            u=last_u+u;
            end
            return;
        end
        
        % --------------------------------------------------
        %  Optimum not found, remove one active constraint.
        % --------------------------------------------------
        
        % Remove constraint with most negative lambda from the
        % working set.
        [~,i_neg] = min(lambda);
        W(i_neg) = 0;
        i_free(i_neg) = 1;
%         end

    else
        
        % ---------------------------------------
        %  No, find primary bounding constraint.
        % ---------------------------------------
        
        % Compute distances to the different boundaries. Since alpha < 1 is
        % the maximum step length, initiate with ones.
        dist = ones(m,1);
        i_min = i_free & p<0;
        i_max = i_free & p>0;
        dist(i_min) = (umin(i_min) - u(i_min)) ./ p(i_min);
        dist(i_max) = (umax(i_max) - u(i_max)) ./ p(i_max);
        
        % Proportion of p to travel
        [alpha,i_alpha] = min(dist);
        % Update point and residual.
        u = u + alpha*p;
        % Update point and residual.
        d = d - A_free*alpha*p_free;
        
        % Add corresponding constraint to working set.
        W(i_alpha) = sign(p(i_alpha));
        i_free(i_alpha) = 0;
        
    end
    
end