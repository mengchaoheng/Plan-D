function [u]=two_dir_alloc_mch(v_D, v_C,u,p_limits,v_limits)% 
% (c) mengchaoheng
% Last edited 2019-11
% B=[-0.5   0       0.5   0;
%      0  -0.5    0       0.5;
%     0.25   0.25   0.25   0.25];
global B
v=v_D+v_C;
if(~v_limits)
    umin=[1;1;1;1]*(-p_limits)*pi/180;
    umax=[1;1;1;1]*p_limits*pi/180;
else
%====幅值、速度约束================ 
    umin=max([1;1;1;1]*(-p_limits)*pi/180,-0.01*400*pi/180+u);
    umax=min([1;1;1;1]*p_limits*pi/180,0.01*400*pi/180+u);
end
% uv = dir_alloc_mch(v,umin,umax); % wls_alloc_mch(v,u);% 先计算合力矩所需舵量
uv =wls_alloc_mch(v, u,p_limits, v_limits);
if(check(uv,p_limits,v_limits)) % 若舵量可以满足则直接满足
    u=uv;
else  % 否则再计算扰动所需
%     uv1 = dir_alloc_mch(v_D,umin,umax); % wls_alloc_mch(v1,u);
    uv1 =wls_alloc_mch(v_D,u, p_limits, v_limits);
    if(check(uv1,p_limits,v_limits))  % 若扰动可满足，合力矩不能满足，则进行两次分配
        
        umin1=umin-uv1;
        umax1=umax-uv1;
        
%         uv2 = dir_alloc_mch(v_C,umin1,umax1);
        [uv2,~] = dir_alloc(B,v_C,umin1,umax1);
          
        u=uv1+uv2;
    else  % 扰动也不能满足，则直接按照合力矩进行分配
        u=uv1;
    end
end
