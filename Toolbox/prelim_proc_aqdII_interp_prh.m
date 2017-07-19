% prelim processing of the AQDII data from eazy-e

%load and transform aqdII data
eval(sprintf('cd %s%s',root_data,aqdpath))
disp(pwd)
f=dir('*ad2cp*.mat');
fprintf('be carefull at the order of file in dir(%s*ad2cp*.mat) \n',aqdpath)
beg=zeros(1,length(f));
cell_Data=struct([]);
for l=1:length(f)
  load([aqdpath f(l).name])
  beg(l)=Data.Burst_MatlabTimeStamp(1);
  cell_Data{l}=Data;
  cell_Config{l}=Config;
end
[beg,I]=sort(beg);

temp = calcHPR_YUPDOWN(cell_Data{I(1)}, cell_Config{I(1)});
temp=Signature_beam2xyz2enu(temp);
eval([name_aqd '=temp;']);
for i=2:length(I)
    disp([num2str(i) '-' num2str(length(I))])
    temp = calcHPR_YUPDOWN(cell_Data{I(i)}, cell_Config{I(i)});
    temp=Signature_beam2xyz2enu(temp);
    eval([name_aqd '=mergefields(' name_aqd ',temp,1,1);']);
end
save([name_aqd '.mat'],name_aqd, '-v7.3')

cd(root_script) 