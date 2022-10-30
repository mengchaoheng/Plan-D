function trimLinearizeOpPoint()
% trimLinearizeOpPoint - Trim and Linearize aircraft model
% This function creates a linear system object that contains a linear model
% of the aircraft based on an trimmed operating point. The linear system
% object is assigned to linsys and saved to a .mat file. It uses Simulink
% Control Design(TM).

% Copyright 2013-2017 The MathWorks, Inc.

%% Variants Conditions
oldVariantVehicle = evalin('base','VSS_VEHICLE');
oldVariantActuators = evalin('base','VSS_ACTUATORS');

% Set up variants for trimming
VSS_VEHICLE = 1;
VSS_ACTUATORS = 0;

%Send variants to the workspace
assignin('base','VSS_VEHICLE',VSS_VEHICLE);
assignin('base','VSS_ACTUATORS',VSS_ACTUATORS);

%% Obtain inputs and outputs from the model
model = 'trimNonlinearAirframe';
if ~bdIsLoaded(model)
    load_system(model);
end
io = getlinio(model);

%% Create the operating point specification object.
opspec = operspec(model);

%% Set the constraints on the states in the model.
% - The defaults for all states are Known = false, SteadyState = true,
%   Min = -Inf, and Max = Inf.

% State (1) - trimNonlinearAirframe/nonlinearAirframe|nonlinearAirframe/Nonlinear/6DOF (Quaternion)/Calculate DCM & Euler Angles/q0 q1 q2 q3
% - Default model initial conditions are used to initialize optimization.

% State (2) - trimNonlinearAirframe/nonlinearAirframe|nonlinearAirframe/Nonlinear/6DOF (Quaternion)/p,q,r
% - Default model initial conditions are used to initialize optimization.

% State (3) - trimNonlinearAirframe/nonlinearAirframe|nonlinearAirframe/Nonlinear/6DOF (Quaternion)/ub,vb,wb
% - Default model initial conditions are used to initialize optimization.

% State (4) - trimNonlinearAirframe/nonlinearAirframe|nonlinearAirframe/Nonlinear/6DOF (Quaternion)/xe,ye,ze
% - Default model initial conditions are used to initialize optimization.

% State (5) - trimNonlinearAirframe/nonlinearAirframe|nonlinearAirframe/Nonlinear/Position on Earth/Integrator
% - Default model initial conditions are used to initialize optimization.

%% Set the constraints on the inputs in the model.
% - The defaults for all inputs are Known = false, Min = -Inf, and
% Max = Inf.

% Input (1) - trimNonlinearAirframe/Actuators
% - Default model initial conditions are used to initialize optimization.

% Input (2) - trimNonlinearAirframe/Gravity ned
opspec.Inputs(2).u = [0;0;9.81];
opspec.Inputs(2).Known = [true;true;true];

% Input (3) - trimNonlinearAirframe/Air Temp
opspec.Inputs(3).u = 288;
opspec.Inputs(3).Known = true;

% Input (4) - trimNonlinearAirframe/speed sound
opspec.Inputs(4).u = 340;
opspec.Inputs(4).Known = true;

% Input (5) - trimNonlinearAirframe/pressure
opspec.Inputs(5).u = 101300;
opspec.Inputs(5).Known = true;

% Input (6) - trimNonlinearAirframe/air density
opspec.Inputs(6).u = 1.22;
opspec.Inputs(6).Known = true;

% Input (7) - trimNonlinearAirframe/Magnetic Field
% - Default model initial conditions are used to initialize optimization.
opspec.Inputs(7).Known = [true;true;true];

%% Set the constraints on the outputs in the model.
% - The defaults for all outputs are Known = false, Min = -Inf, and
% Max = Inf.

% Output (1) - trimNonlinearAirframe/V_body
% - Default model initial conditions are used to initialize optimization.
opspec.Outputs(1).Known = [true;true;true];

% Output (2) - trimNonlinearAirframe/Omega_body
% - Default model initial conditions are used to initialize optimization.
opspec.Outputs(2).Known = [true;true;true];

% Output (3) - trimNonlinearAirframe/Bus Selector
% - Default model initial conditions are used to initialize optimization.

% Output (4) - trimNonlinearAirframe/Bus Selector
% - Default model initial conditions are used to initialize optimization.


%% Create the options
opt = findopOptions('DisplayReport','iter');

%% Perform the operating point search.
[op,opreport] = findop(model,opspec,opt); %#okNASGU

% Linearize the model for the given operating and inputs/outputs.
linsys = linearize(model,io,op); %#ok<NASGU>

% Restore Variants
assignin('base','VSS_VEHICLE',oldVariantVehicle);
assignin('base','VSS_ACTUATORS',oldVariantActuators);

% Save trim points and linear model
p = simulinkproject;
save(fullfile(p.RootFolder,'linearAirframe','linearizedAirframe.mat'),...
    'linsys','op','opreport');