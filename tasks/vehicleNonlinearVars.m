%% Vehicle Nonlinear Variables
% Copyright 2013 The MathWorks, Inc.

% 6DOF
Vehicle.Nonlinear.Nonlinear.SixDOF.initGreenwich = 0;
Vehicle.Nonlinear.Nonlinear.SixDOF.quatGain = 1;
% Actuators
% Linear
Vehicle.Nonlinear.Nonlinear.ACModel.Actuator.Linear.natFreq = 1;
Vehicle.Nonlinear.Nonlinear.ACModel.Actuator.Linear.damping = 0.3;
Vehicle.Nonlinear.Nonlinear.ACModel.Actuator.Linear.initPosition = 0;
Vehicle.Nonlinear.Nonlinear.ACModel.Actuator.Linear.initVelocity = 0;
% Nonlinear
Vehicle.Nonlinear.Nonlinear.ACModel.Actuator.NonLinear.natFreq = 1;
Vehicle.Nonlinear.Nonlinear.ACModel.Actuator.NonLinear.damping = 0.3;
Vehicle.Nonlinear.Nonlinear.ACModel.Actuator.NonLinear.maxDeflection = 20*pi/180;
Vehicle.Nonlinear.Nonlinear.ACModel.Actuator.NonLinear.minDeflection = -20*pi/180;
Vehicle.Nonlinear.Nonlinear.ACModel.Actuator.NonLinear.rateLimit = 500*pi/180;
Vehicle.Nonlinear.Nonlinear.ACModel.Actuator.NonLinear.initPosition = 1;
Vehicle.Nonlinear.Nonlinear.ACModel.Actuator.NonLinear.initVelocity = 0;
% Position on Earth
Vehicle.Nonlinear.Nonlinear.PositionOnEarth.href = 0;
Vehicle.Nonlinear.Nonlinear.PositionOnEarth.FlatEarthToLLA.xAxis = 0;