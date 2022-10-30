function rebuildSFunctions()
%rebuildSFunctions  Rebuild the S-Functions required by this project
%
%   Simple utility to rebuild the S-Functions required by this project. 
%   This is implemented as a script instead of a function to avoid adding
%   unwanted variables to the MATLAB base workspace.

%   Copyright 2013 The MathWorks, Inc.

% Give the user an indication of progress:
i_waitbar(0);

% Use Simulink Project API to get the current project:
project = simulinkproject;
projectRoot = project.RootFolder;

% We keep the source files for this project in $projectroot/src:
sourceFolder = fullfile(projectRoot, 'src');
% We put the compiled binaries in the local "work" folder:
outputFolder = fullfile(projectRoot, 'work');
if ~exist(outputFolder, 'dir')
    mkdir(outputFolder)
end
oldFolder = cd(sourceFolder);

% When this variable goes out of scope the supplied function handle will 
% be executed.
scopedCleanFuncion = onCleanup(@()cd(oldFolder));

% A list of the buildable S-Functions are listed in the SFunctionList
% variable
i_waitbar(0, 'Building S-Functions...');
SFunctionList = {'linearInputBus/linearInputBus.c linearInputBus/linearInputBus_wrapper.c';...
                'linearOutputBus/linearOutputBus.c linearOutputBus/linearOutputBus_wrapper.c'};
for k=1:length(SFunctionList)
    i_waitbar(k/(1+length(SFunctionList)), 'Building S-Functions...');
    mexCommand = sprintf(['mex ' SFunctionList{k} ' -outdir ''%s'''], outputFolder);
    eval(mexCommand)
end

i_waitbar(1, 'Successfully built S-Functions');
pause(1.5)
i_waitbar(-1);
end

function i_waitbar(progress, message)
% Thin wrapper on waitbar.
persistent h
if progress < 0
    % Close the waitbar if it still exists
    if ~isempty(h) && ishandle(h)
        close(h)
    end
    return
end
if nargin < 2
    message = 'Building S-Functions...';
end
if isempty(h) || ~ishandle(h)
    h = waitbar(progress, message, 'name', 'Building S-Functions');
    return
end
waitbar(progress, h, message);
end


