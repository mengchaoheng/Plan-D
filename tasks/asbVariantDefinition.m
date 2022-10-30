%% asbVariantDefinition.m - Variants definiton
% This script initializes the variant objects for the quadcopter model.

% Copyright 2017 The MathWorks, Inc.
% allocation
inv = Simulink.Variant('allocatiom_method==0');
dir = Simulink.Variant('allocatiom_method==1');
pro = Simulink.Variant('allocatiom_method==2');
qp = Simulink.Variant('allocatiom_method==3');
% controller
ADRC_allocator = Simulink.Variant('controller==0');
PID = Simulink.Variant('controller==1');
% Command
VSS_COMMAND_SIGBLDR = Simulink.Variant('VSS_COMMAND==0');
VSS_COMMAND_JOYSTICK = Simulink.Variant('VSS_COMMAND==1');
VSS_COMMAND_PRESAVED = Simulink.Variant('VSS_COMMAND==2');
VSS_COMMAND_user = Simulink.Variant('VSS_COMMAND==3');
% Sensors
% VSS_SENSORS_FEEDTHROUGH = Simulink.Variant('VSS_SENSORS==0');
% VSS_SENSORS_DYNAMICS = Simulink.Variant('VSS_SENSORS==1');

% Environment
% VSS_ENVIRONMENT_CST = Simulink.Variant('VSS_ENVIRONMENT==0');
% VSS_ENVIRONMENT_VARIABLE = Simulink.Variant('VSS_ENVIRONMENT==1');

%Visualization
VSS_VISUALIZATION_SCOPES = Simulink.Variant('VSS_VISUALIZATION==0');
VSS_VISUALIZATION_WORKSPACE = Simulink.Variant('VSS_VISUALIZATION==1');
VSS_VISUALIZATION_FLIGHTGEAR = Simulink.Variant('VSS_VISUALIZATION==2');
% VSS_VISUALIZATION_SL3D = Simulink.Variant('VSS_VISUALIZATION==3');

% Actuators
% VSS_ACTUATORS_FEEDTHROUGH = Simulink.Variant('VSS_ACTUATORS==0');
% VSS_ACTUATORS_LINEAR = Simulink.Variant('VSS_ACTUATORS==1');
% VSS_ACTUATORS_NONLINEAR = Simulink.Variant('VSS_ACTUATORS==2');

% Vehicle
% VSS_VEHICLE_LINEAR = Simulink.Variant('VSS_VEHICLE==0');
% VSS_VEHICLE_NONLINEAR = Simulink.Variant('VSS_VEHICLE==1');