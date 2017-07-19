%% This is set up for icecube_d1
%  take care of the variable names for another cruise
% The name definition is still under progress. Depending on the cruise, we
% do not have the same structure. some looks like
% WW/name_of_the_wirewalker/d1/aqd
% other looks like 
% WW/name_of_the_wirewalker/aqd


root_data='/Volumes/Ahua/data_archive/WaveChasers-DataArchive/LaJIT/Moorings/';
root_script='/Users/aleboyer/Wirewalker-master/';
Cruise_name='LAJIT2016'; % 
WW_name='JohnWesleyPowell'; % 
deployement='d15';




aqdpath=sprintf('%s/WW/%s/%s/aqd/',Cruise_name,WW_name,deployement);

name_aqd=[WW_name '_aqd_' deployement];

% used in prelim_proc_aqdII_interp_prh;
% path to aquadopp data.

% adding path 
addpath([root_script 'Toolbox']);
addpath([root_script 'Toolbox/rsktools']);
addpath([root_script 'Toolbox/rsktools/mksqlite-1.12-src']);
addpath([root_script 'Toolbox/gsw_matlab_v3_02']);
addpath([root_script 'Toolbox/gsw_matlab_v3_02/library']);
addpath([root_script 'Toolbox/position_scripts']);


% used in process_WW should be the name after the folder WW in dirName ;


prelim_proc_aqdII_interp_prh;

