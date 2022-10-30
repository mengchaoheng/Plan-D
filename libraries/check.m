function boolean = check(u,p_limits,v_limits)
% A=p_limits*pi/180;
if(~v_limits)
    umin=[1;1;1;1]*(-p_limits)*pi/180;
    umax=[1;1;1;1]*p_limits*pi/180;
else
%====幅值、速度约束================ 
    umin=max([1;1;1;1]*(-p_limits)*pi/180,-0.01*400*pi/180+u);
    umax=min([1;1;1;1]*p_limits*pi/180,0.01*400*pi/180+u);
end
flag=u<umax & u>umin;
% if(abs(u(1))<A && abs(u(2))<A && abs(u(3))<A && abs(u(4))<A)
if(flag(1)==1 && flag(2)==1 && flag(3)==1 &&  flag(4)==1)
    boolean=1;
else
    boolean=0;
end