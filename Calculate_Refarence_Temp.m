%Temp Referance
function T0=Calculate_Refarence_Temp(HeightAltitude)
T0=288;%KELV�N
if  HeightAltitude>=11000
    a=(-0.0065);% a'n�n birimi Kelvin/metre
    T0=T0+a*(11000);
    % HeightAltitude<20000 &&
    % elseif HeightAltitude>=20000 && HeightAltitude<32000
    %     a=(-0.0065);% a'n�n birimi Kelvin/metre
    % T0=T0+a*(11000);
    % elseif HeightAltitude>=32000
    %      a=(-0.0065);% a'n�n birimi Kelvin/metre
    % T0=T0+a*(11000);
    % end
end