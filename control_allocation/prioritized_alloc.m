function [u] = prioritized_alloc(B,v_high,v_low,last_u, p_limits)
  
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

    %====½ö·ùÖµÔ¼Êø================
        umin=[1;1;1;1]*(-p_limits)*pi/180;
        umax=[1;1;1;1]*p_limits*pi/180;

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
  Aeq = [-v_low B];
  beq = v_high;% zeros(k,1)
  % a >= 0, umin <= u <= umax
  lb = [0 umin']';
  ub = [1 umax']'; % 1e4 should be infty but error if too large.
  
  % Solve linear program
  options = optimset('Display', 'iter');% ,'Algorithm','interior-point-legacy'
  [x,fval,exitflag,output,lambda]= linprog(f,A,b,Aeq,beq,lb,ub,[],options);
  if(exitflag~=1)
      u = prioritized_alloc(B,[0;0;0],v_high,last_u, p_limits);
  else
%       a = x(1);
      u = x(2:end);
%       if(incre)
%         u=u+last_u;
%       end
  end
  
  