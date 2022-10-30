%% startVars.m - Initialize variables
% This script initializes variables and buses required for the model to
% work. Mask block parameters are defined by structures that define the
% location of the block, ie. If the Initial Condition parameter is located
% under Vehicle/Nonlinear/Integrator the variable is set to
% Vehicle.Nonlinear.Integrator.initialCondition = 0;

%   Copyright 2013-2017 The MathWorks, Inc.

% Register variables in the workspace before the project is loaded
initVars = who;
% Variants Conditions
asbVariantDefinition;
allocatiom_method=0;   % 0: inv, 1: dir, 2: pro, 3: qp
controller=0;          % 0: ADRC, 1: PID...
VSS_COMMAND = 3;       % 0: Signal builder, 1: Joystick, 2: Pre-saved data, 3: user
% VSS_SENSORS = 1;       % 0: Feedthrough, 1: Dynamics
% VSS_VEHICLE = 1;       % 0: Linear Airframe, 1: Nonlinear Airframe.
% VSS_ENVIRONMENT = 0;   % 0: Constant, 1: Variable
VSS_VISUALIZATION = 0; % 0: Scopes, 1: Send values to workspace, 2: FlightGear, 3: Simulink 3D.
% VSS_ACTUATORS = 0;     % 0: Feedthrough, 1: Linear Second Order, 2: Noninear Second Order

% Bus definitions 
asbBusDefinitionCommand; 
asbBusDefinitionSensors;
asbBusDefinitionEnvironment;
asbBusDefinitionStates;

% Sampling rate
Ts= 0.01;
% Mass properties
mass = 1.53;
I_x=0.025483;
I_y=0.025504;
I_z=0.00562;
inertia = [I_x 0 0;0 I_y 0;0 0 I_z];
d2r=pi/180;
r2d=180/pi;

%% Custom Variables
% Add your variables here:
%===========================1旧版====================================
% controlldata = xlsread('controll');
% rolldata=controlldata(:,1)./(100*r2d)*0.7;
% pitchdata=controlldata(:,2)./(100*r2d)*0.7;
% yawdata=controlldata(:,3)./(100*r2d)*0.7;
% hdata=controlldata(:,4)./(100);
% cmdroll = timeseries(rolldata,0:Ts:Ts*(length(rolldata)-1));
% cmdpitch = timeseries(pitchdata,0:Ts:Ts*(length(pitchdata)-1));
% cmdyaw = timeseries(yawdata,0:Ts:Ts*(length(yawdata)-1));
% cmdh = timeseries(hdata,0:Ts:Ts*(length(hdata)-1));

%===========================2新版结合 testplot.m =====================================
% data=xlsread('DATAfx13-2_5.xlsx');%10000-15000
% roll_d=data(10000:15000,4).*d2r/100;
% pitch_d=data(10000:15000,5).*d2r/100;
% yaw_d=data(10000:15000,6).*d2r/100;% 实际给定控制
% h_e=data(6000:9000,19)/100;% 观测输出高度
% cmdroll = timeseries(roll_d,0:Ts:Ts*(length(roll_d)-1));
% cmdpitch = timeseries(pitch_d,0:Ts:Ts*(length(pitch_d)-1));
% cmdyaw = timeseries(yaw_d,0:Ts:Ts*(length(yaw_d)-1));
% cmdh = timeseries(h_e,0:Ts:Ts*(length(h_e)-1));%给到仿真中的控制量
%====================================================================
%%
load('cmdroll.mat');
load('cmdpitch.mat');
load('cmdyaw.mat');
load('cmdh.mat');
%%
if(VSS_COMMAND ==2)
    initDate = [2019 5 1 0 0 0];
    initPosLLA = [113.353891 23.159235 30];
    initPosNED = [0 0 cmdh.Data(1)];
    initVb = [0 0 0];
    initEuler = [cmdroll.Data(1) cmdpitch.Data(1) cmdyaw.Data(1)];
    initAngRates = [0 0 0];
else
    % % Initial contitions
    initDate = [2019 5 1 0 0 0];
    initPosLLA = [23.159235 113.353891 30];% 纬度，经度，高度
    initPosNED = [0 0 -30];
    initVb = [0 0 0];
    initEuler = [0 0 0];
    initAngRates = [0 0 0];
end
global r_sm_X r_sm_Y k_rs_X k_rs_Y k_as_X k_as_Y k_ac_X k_ac_Y k_ra_X k_ra_Y r_m_X r_m_Y e_m_X e_m_Y e_p_X e_p_Y

% function callqpact
global B umin umax p_limits sw_turb end_time filter_switch builder_switch
end_time=25;% 仿真时间，sec
filter_switch=1;
builder_switch=1;
sw_turb=0;
p_limits=20;
umin=[1;1;1;1]*(-p_limits)*pi/180;
umax=[1;1;1;1]*p_limits*pi/180;
kc1=3.157;% 2.8
kc2=3.157;% 3.3
l_1=0.17078793;
l_2=0.06647954;
% 初始化控制效率矩阵B
B=1*[-kc1*l_1    0        kc1*l_1     0;
      0      -kc1*l_1     0        kc1*l_1;
      kc2*l_2   kc2*l_2    kc2*l_2    kc2*l_2];

%-------------------r_sm插值表-----------------------------------------------------------
data1 = load('r_sm.txt');
r_sm_X=data1(:,1);
r_sm_Y=data1(:,2);
%-------------------k_rs插值表-----------------------------------------------------------
data2 = load('k_rs.txt');
k_rs_X=data2(:,1);
k_rs_Y=data2(:,2);
%-------------------k_as插值表-----------------------------------------------------------
data3 = load('k_as_k_ac.txt');
k_as_X=data3(:,1);
k_as_Y=data3(:,2);
%-------------------k_ac插值表-----------------------------------------------------------
k_ac_X=data3(:,1);
k_ac_Y=data3(:,3);
%-------------------k_ra插值表-----------------------------------------------------------
data4 = load('k_ra.txt');
k_ra_X=data4(:,1);
k_ra_Y=data4(:,2);
%-------------------r_m插值表-----------------------------------------------------------
data5 = load('r_m.txt');
r_m_X=data5(:,1);
r_m_Y=data5(:,2);
%-------------------epsilon_m插值表-----------------------------------------------------------
data6 = load('e_m.txt');
e_m_X=data6(:,1);
e_m_Y=data6(:,2);
%-------------------epsilon_p插值表-----------------------------------------------------------
data7 = load('e_p.txt');
e_p_X=data7(:,1);
e_p_Y=data7(:,2);

% myvariable = 0;
% Register variables after the project is loaded and store the variables in
% initVars so they can be cleared later on the project shutdown.
endVars = who;
initVars = setdiff(endVars,initVars);
clear endVars;
