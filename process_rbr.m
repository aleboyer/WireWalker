%% This is set up for icecube_d1
%  take care of the variable names for another cruise
% The name definition is still under progress. Depending on the cruise, we
% do not have the same structure. some looks like
% WW/name_of_the_wirewalker/d1/aqd
% other looks like 
% WW/name_of_the_wirewalker/aqd
%root_data='/Volumes/Ahua/data_archive/WaveChasers-DataArchive/LaJIT/Moorings/';
root_data='/Volumes/Ahua/data_archive/WaveChasers-DataArchive/LaJIT/Moorings/';
root_script='/Users/aleboyer/Wirewalker-master/';
Cruise_name='LAJIT2016'; % 
WW_name='JohnWesleyPowell'; % 
deployement='d15';





rbrpath=sprintf('%s%s/WW/%s/%s/rbr/',root_data,Cruise_name,WW_name,deployement);
name_rbr=[WW_name '_rbr_' deployement];

% used in prelim_proc_aqdII_interp_prh;
% path to aquadopp data.

% adding path 
addpath([root_script 'Toolbox']);
addpath([root_script 'Toolbox/rsktools']);
addpath([root_script 'Toolbox/gsw_matlab_v3_02']);
addpath([root_script 'Toolbox/gsw_matlab_v3_02/library']);
addpath([root_script 'Toolbox/position_scripts']);


% used in process_WW should be the name after the folder WW in dirName ;

rbrfile=dir(fullfile(rbrpath,'*.rsk'));
if length(rbrfile)>2;
    fprintf('Watch out \nThere is more than one rsk file\n')
    for j=1:length(filedir); disp(rbrfile(j).name);end
end
fprintf('read rbr file is %s\n',rbrfile(1).name)

disp('RSK_wrapper--- It is may take a while --- coffee time buddy?')

RSKfile= fullfile(rbrpath,rbrfile(1).name);
RSKdb=RSKopen(RSKfile);
RSKread=RSKreaddata(RSKdb);
rsk_struct_raw=RSK_struct(RSKread);
eval([name_rbr '=rsk_struct_raw;'])

save(fullfile(rbrpath,[name_rbr '.mat']),name_rbr);



