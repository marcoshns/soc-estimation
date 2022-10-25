function install(mode)
%INSTALL Installation script for Drive Cycle Blockset.
%   INSTALL installs the Drive Cycle Blockset for the current session and
%   all future sessions.
%
%   See also: UNINSTALL.

%   INSTALL has some undocumented modes:
%
%   INSTALL('INSTALL') is the same as INSTALL.
%   INSTALL('UNINSTALL') reverses the installation.
%
%   We've done this so that all the installation/uninstallation code is in
%   the same place. The user is expected to call the functions with INSTALL
%   and UNINSTALL.

%   Copyright 2013 Cranfield University


% Check input arguments.
narginchk(0, 1);
if nargin < 1
    mode = 'install';
end
allowedModes = {'install', 'uninstall'};
if ~ischar(mode) || ~ismember(lower(mode), allowedModes)
    id = 'drivecyclelib:install:unknownModeArg';
    msg = ['Unknown mode argument: allowed values are ''install'' and ' ...
        '''uninstall''.'];
    ME = MException(id, msg);
    throwAsCaller(ME);
end
mode = lower(mode);

% Store the original directory.
originalDir = pwd;
restoreDirFcn = onCleanup(@()cd(originalDir));

% Do the installation/uninstallation.
switch mode
    case 'install'
        doInstall();
    otherwise
        assert(strcmp(mode, 'uninstall'));
        doUninstall();
end

end % install()



function p = projectPath()
%projectPath Return the project path.
%   p = projectPath() returns the project path.

projectRoot = fileparts(mfilename('fullpath'));
cycledata = fullfile(projectRoot, 'cycledata');
functions = fullfile(projectRoot, 'functions');

PATH_SEP = pathsep();

p = [projectRoot, PATH_SEP, cycledata, PATH_SEP, functions];

end % projectPath()



function doInstall()
%doInstall Do the installation.
%   doInstall() does the installation, both for the current session and all
%   future ones.

% Add the installation for the current session.
theProjectPath = projectPath();
addpath(theProjectPath, '-end');

% Add the installation for all future sessions.
theCurrentPath = path();
restorePathFcn = onCleanup(@()path(theCurrentPath));
path(pathdef());
addpath(theProjectPath, '-end');
savepath();

end % doInstall()



function doUninstall()
%doUninstall Do the uninstallation.
%   doUninstall() does the uninstallation, both for the current session and
%   all future ones.

% Turn off warning messages.
S = warning('query', 'all');
warnRestoreFcn = onCleanup(@()warning(S));
warning('off', 'MATLAB:rmpath:DirNotFound');

% Remove the installation for the current session.
theProjectPath = projectPath();
rmpath(theProjectPath);

% Remove the installation for all future sessions.
theCurrentPath = path();
restorePathFcn = onCleanup(@()path(theCurrentPath));
path(pathdef());
rmpath(theProjectPath);
savepath();

end % doUninstall()
