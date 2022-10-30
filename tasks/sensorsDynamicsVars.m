%% Sensors Dynamic Library Block Variables
% Copyright 2013 The MathWorks, Inc.

% IMU
% Main
Sensors.Dynamics.IMU.cg = [0 0 0];
% Accelerometer
Sensors.Dynamics.IMU.imu = [0 0 0];  %IMU pos relative to datum
Sensors.Dynamics.IMU.accNatFreq = 190; %Accelerometer natural frequency
Sensors.Dynamics.IMU.accDamping = 0.707; %Accelerometer damping ratio
Sensors.Dynamics.IMU.accScaleCross = eye(3);
Sensors.Dynamics.IMU.accBias = [0 0 0];
Sensors.Dynamics.IMU.accLimits = [-inf -inf -inf inf inf inf];
% Gyroscope
Sensors.Dynamics.IMU.gyroNatFreq = 190;
Sensors.Dynamics.IMU.gyroDamping = 0.707;
Sensors.Dynamics.IMU.gyroScaleCross = eye(3);
Sensors.Dynamics.IMU.gyroBias = [0 0 0];
Sensors.Dynamics.IMU.gyroGBias = [0 0 0];
Sensors.Dynamics.IMU.gyroLimits = [-inf -inf -inf inf inf inf];
% Noise
Sensors.Dynamics.IMU.noiseSeeds = [23093 23094 23095 23096 23097 23098];
Sensors.Dynamics.IMU.noisePower = [0.001 0.001 0.001 0.0001 0.0001 0.0001];
