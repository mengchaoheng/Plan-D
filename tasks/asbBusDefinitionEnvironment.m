function asbBusDefinitionEnvironment() 
% ASBBUSDEFINITIONENVIRONMENT initializes a set of bus objects in the MATLAB base workspace 
% Copyright 2013 The MathWorks, Inc.

% Bus object: AtmosphereBus 
clear elems;

% elems(1) = Simulink.BusElement;
% elems(1).Name = 'wind_xy';
% elems(1).Dimensions = [2 1];
% elems(1).DimensionsMode = 'Fixed';
% elems(1).DataType = 'double';
% elems(1).SampleTime = -1;
% elems(1).Complexity = 'real';
% elems(1).SamplingMode = 'Sample based';
% elems(1).Min = [];
% elems(1).Max = [];
% elems(1).DocUnits = '';
% elems(1).Description = '';
% 
% elems(2) = Simulink.BusElement;
% elems(2).Name = 'wind_d';
% elems(2).Dimensions = 1;
% elems(2).DimensionsMode = 'Fixed';
% elems(2).DataType = 'double';
% elems(2).SampleTime = -1;
% elems(2).Complexity = 'real';
% elems(2).SamplingMode = 'Sample based';
% elems(2).Min = [];
% elems(2).Max = [];
% elems(2).DocUnits = '';
% elems(2).Description = '';
% WindBus = Simulink.Bus;
% WindBus.HeaderFile = '';
% WindBus.Description = '';
% WindBus.DataScope = 'Auto';
% WindBus.Alignment = -1;
% WindBus.Elements = elems;
% assignin('base','WindBus', WindBus)

elems(1) = Simulink.BusElement;
elems(1).Name = 'air_temp';
elems(1).Dimensions = 1;
elems(1).DimensionsMode = 'Fixed';
elems(1).DataType = 'double';
elems(1).SampleTime = -1;
elems(1).Complexity = 'real';
elems(1).SamplingMode = 'Sample based';
elems(1).Min = [];
elems(1).Max = [];
elems(1).DocUnits = sprintf('K');
elems(1).Description = '';

elems(2) = Simulink.BusElement;
elems(2).Name = 'speed_sound';
elems(2).Dimensions = 1;
elems(2).DimensionsMode = 'Fixed';
elems(2).DataType = 'double';
elems(2).SampleTime = -1;
elems(2).Complexity = 'real';
elems(2).SamplingMode = 'Sample based';
elems(2).Min = [];
elems(2).Max = [];
elems(2).DocUnits = '';
elems(2).Description = '';

elems(3) = Simulink.BusElement;
elems(3).Name = 'pressure';
elems(3).Dimensions = 1;
elems(3).DimensionsMode = 'Fixed';
elems(3).DataType = 'double';
elems(3).SampleTime = -1;
elems(3).Complexity = 'real';
elems(3).SamplingMode = 'Sample based';
elems(3).Min = [];
elems(3).Max = [];
elems(3).DocUnits = '';
elems(3).Description = '';

elems(4) = Simulink.BusElement;
elems(4).Name = 'air_density';
elems(4).Dimensions = 1;
elems(4).DimensionsMode = 'Fixed';
elems(4).DataType = 'double';
elems(4).SampleTime = -1;
elems(4).Complexity = 'real';
elems(4).SamplingMode = 'Sample based';
elems(4).Min = [];
elems(4).Max = [];
elems(4).DocUnits = '';
elems(4).Description = '';

AtmosphereBus = Simulink.Bus;
AtmosphereBus.HeaderFile = '';
AtmosphereBus.Description = '';
AtmosphereBus.DataScope = 'Auto';
AtmosphereBus.Alignment = -1;
AtmosphereBus.Elements = elems;
assignin('base','AtmosphereBus', AtmosphereBus)

% Bus object: Environment 
clear elems;
elems(1) = Simulink.BusElement;
elems(1).Name = 'Gravity_ned';
elems(1).Dimensions = [3 1];
elems(1).DimensionsMode = 'Fixed';
elems(1).DataType = 'double';
elems(1).SampleTime = -1;
elems(1).Complexity = 'real';
elems(1).SamplingMode = 'Sample based';
elems(1).Min = [];
elems(1).Max = [];
elems(1).DocUnits = '';
elems(1).Description = '';

elems(2) = Simulink.BusElement;
elems(2).Name = 'AtmosphereBus';
elems(2).Dimensions = 1;
elems(2).DimensionsMode = 'Fixed';
elems(2).DataType = 'Bus: AtmosphereBus';
elems(2).SampleTime = -1;
elems(2).Complexity = 'real';
elems(2).SamplingMode = 'Sample based';
elems(2).Min = [];
elems(2).Max = [];
elems(2).DocUnits = '';
elems(2).Description = '';

elems(3) = Simulink.BusElement;
elems(3).Name = 'MagneticField_ned';
elems(3).Dimensions = [3 1];
elems(3).DimensionsMode = 'Fixed';
elems(3).DataType = 'double';
elems(3).SampleTime = -1;
elems(3).Complexity = 'real';
elems(3).SamplingMode = 'Sample based';
elems(3).Min = [];
elems(3).Max = [];
elems(3).DocUnits = '';
elems(3).Description = '';

elems(4) = Simulink.BusElement;
elems(4).Name = 'StatesBus';
elems(4).Dimensions = 1;
elems(4).DimensionsMode = 'Fixed';
elems(4).DataType = 'Bus: StatesBus';
elems(4).SampleTime = -1;
elems(4).Complexity = 'real';
elems(4).SamplingMode = 'Sample based';
elems(4).Min = [];
elems(4).Max = [];
elems(4).DocUnits = '';
elems(4).Description = '';

% elems(5) = Simulink.BusElement;
% elems(5).Name = 'WindBus';
% elems(5).Dimensions = [3 1];
% elems(5).DimensionsMode = 'Fixed';
% elems(5).DataType = 'Bus: WindBus';
% elems(5).SampleTime = -1;
% elems(5).Complexity = 'real';
% elems(5).SamplingMode = 'Sample based';
% elems(5).Min = [];
% elems(5).Max = [];
% elems(5).DocUnits = '';
% elems(5).Description = '';
elems(5) = Simulink.BusElement;
elems(5).Name = 'Wind';
elems(5).Dimensions = [3 1];
elems(5).DimensionsMode = 'Fixed';
elems(5).DataType = 'double';
elems(5).SampleTime = -1;
elems(5).Complexity = 'real';
elems(5).SamplingMode = 'Sample based';
elems(5).Min = [];
elems(5).Max = [];
elems(5).DocUnits = '';
elems(5).Description = '';

EnvironmentBus = Simulink.Bus;
EnvironmentBus.HeaderFile = '';
EnvironmentBus.Description = '';
EnvironmentBus.DataScope = 'Auto';
EnvironmentBus.Alignment = -1;
EnvironmentBus.Elements = elems;
assignin('base','EnvironmentBus', EnvironmentBus)





