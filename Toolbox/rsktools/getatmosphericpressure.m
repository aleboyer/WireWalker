function pAtm = getatmosphericpressure(RSK)

% getatmosphericpressure - Find the atmospheric pressure in RSK file or use
% default
%
% Syntax:   pAtm = getatmosphericpressure(RSK)
%
% Inputs:
%    RSK - Structure containing the logger metadata and data
%
% Outputs:
%    pAtm - Atmospheric pressure in dbar
%
%
% Author: RBR Ltd. Ottawa ON, Canada
% email: support@rbr-global.com
% Website: www.rbr-global.com
% Last revision: 2017-05-18

if isfield(RSK, 'parameterKeys')
    atmrow = find(strcmpi({RSK.parameterKeys.key}, 'ATMOSPHERE'));
    pAtm = str2double(RSK.parameterKeys(atmrow(end)).value);
elseif isfield(RSK, 'parameters')
    pAtm = RSK.parameters.atmosphere;
else
    pAtm = 10.1325;
end
end
    