function uninstall()

currentDir = pwd();
restoreDirFcn = onCleanup(@()cd(currentDir));

thisDir = fileparts(mfilename('fullpath'));
cd(thisDir);
install('uninstall');

end