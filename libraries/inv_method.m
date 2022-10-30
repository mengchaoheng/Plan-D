function y=inv_method(u)
% kc1=3.157;% 2.8
% kc2=3.157;% 3.3
% l_1=0.17078793;
% l_2=0.06647954;
% B=1*[-kc1*l_1    0        kc1*l_1     0;
%       0      -kc1*l_1     0        kc1*l_1;
%       kc2*l_2   kc2*l_2    kc2*l_2    kc2*l_2];  
global B
y=pinv(B)*u;
end