root_data='/Volumes/Ahua/data_archive/WaveChasers-DataArchive/LaJIT/Moorings/';
root_script='/Users/aleboyer/Wirewalker-master/';
Cruise_name='LAJIT2016'; % 
WW_name='JohnWesleyPowell'; % 
deployement='d15';




% need seawater to use sw_bfrq
addpath Toolbox/
addpath Toolbox/seawater/

rbrpath=sprintf('%s/%s/WW/%s/%s/rbr/',root_data,Cruise_name,WW_name,deployement);
WWpath=sprintf('%s/%s/WW/%s/%s/L1/',root_data,Cruise_name,WW_name,deployement);

name_rbr=[WW_name '_rbr_' deployement];


load([rbrpath name_rbr])
eval(['[up,down,dataup] = get_upcast_rbr(' name_rbr ');'])

dup=diff(up);
ind_prof=find(dup>1);
RBRprofiles=struct([]);
fields=fieldnames(dataup);
tdata=dataup.time;
dataup
for i=1:length(ind_prof)-1
    for f=1:length(fields)
        wh_field=fields{f};
        if (length(tdata)==length(dataup.(wh_field)))
            RBRprofiles{i}.(wh_field)=dataup.(wh_field)(ind_prof(i)+1:ind_prof(i+1));
            RBRprofiles{i}.info=dataup.info;
        end
    end
end
%% compute N2

disp('find depths and displacements of a few selected isopycnals')
for i=1:length(RBRprofiles)
    if length(RBRprofiles{i}.T)>3
        RBRprofiles{i}.rho=sw_dens(RBRprofiles{i}.S,...
            RBRprofiles{i}.T,...
            RBRprofiles{i}.P);
        [n2,~,p_ave] = sw_bfrq(RBRprofiles{i}.S,...
            RBRprofiles{i}.T,...
            RBRprofiles{i}.P);
        [p_ave, IA]=unique(p_ave);
        RBRprofiles{i}.n2=interp1(p_ave,n2(IA),RBRprofiles{i}.P);
    else
        RBRprofiles{i}.n2=RBRprofiles{i}.T*nan;
    end
end
save([rbrpath 'Profiles_' name_rbr],'RBRprofiles')




