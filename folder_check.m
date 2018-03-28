if exist(myFolder, 'dir') ~= 7
    Message = sprintf('Error: The following folder does not exist:\n%s', myFolder);
    uiwait(warndlg(Message));
    return;
end
