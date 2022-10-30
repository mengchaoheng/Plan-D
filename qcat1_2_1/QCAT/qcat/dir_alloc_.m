function [u,a] = dir_alloc_(B,v,last_u, p_limits, v_limits,incre)
  
% DIR_ALLOC - Direct control allocation.
%
%  [u,a] = dir_alloc(B,v,umin,umax)
%
% Performs direct control allocation by solving the LP
%
%   max a   subj. to  Bu = av
%   a,u               umin <= u <= umax
%
% If a > 1, set u = u/a.
%
% Note: This function has not been optimized for speed.
%
%  Inputs:
%  -------
% B     control effectiveness matrix (k x m)
% v     commanded virtual control (k x 1)
% umin  lower position limits (m x 1)
% umax  upper position limits (m x 1)
% 
%  Outputs:
%  -------
% u     optimal control
% a     scaling factor
%
% See also: DIR_SIM.
    %====仅幅值约束================
if(~v_limits)
    if(incre)
        last_v=B*last_u;
        umin=[1;1;1;1]*(-p_limits)*pi/180-last_u;
        umax=[1;1;1;1]*p_limits*pi/180-last_u;
        v=v-last_v;
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
    else
        umin=max([1;1;1;1]*(-p_limits)*pi/180,-0.01*500*pi/180+last_u);
        umax=min([1;1;1;1]*p_limits*pi/180,0.01*500*pi/180+last_u);
    end
end
% Number of variables
  [k,m] = size(B);
  
  % Reformulate problem to fit linprog format:
  %
  % min f'x subj. to A*x <=b
  %                  Aeq*b = beq
  %		     lb <= x <= ub
  
  % x = [a ; u]
  % f' = [-1 0 ... 0] (min -a <-> max a)
  f = [-1 zeros(1,m)]';
  % A, b empty
  A = [];
  b = [];
  % Bu = av <=> [-v B]x = 0
  Aeq = [-v B];
  beq = zeros(k,1);
  % a >= 0, umin <= u <= umax
  lb = [0 umin']';
  ub = [1e4 umax']'; % 1e4 should be infty but error if too large.
  
  % Solve linear program
  options = optimset('Display', 'iter');% ,'Algorithm','interior-point-legacy'
  [x,fval,exitflag,output,lambda]= linprog(f,A,b,Aeq,beq,lb,ub,[],options);
  if(exitflag~=1)
      a=0;
      u=[0;0;0;0];
  else
      a = x(1);
      u = x(2:end);
  end
  % Scale down u if a>1
  if a>1
    u = u/a;
  end
  if(incre)
     u=u+last_u;
  end
  