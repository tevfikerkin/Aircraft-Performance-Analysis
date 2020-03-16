% tempareture calculation

function T1=Calculation_Temperature(HeightAltitude)
T0=288;% kelvin
if HeightAltitude<=11000 % yükseklik birimi metre
        a=(-0.0065);% a'nýn birimi Kelvin/metre 
T1=T0+a*(HeightAltitude);
elseif HeightAltitude>11000 && HeightAltitude<=20000
    a=(0);
T1=(T0-((0.0065)*(11000)));
elseif HeightAltitude>20000 && HeightAltitude<=32000
    a=10^-3;
    T0=(T0-((0.0065)*(11000)));
     T1=(a*(HeightAltitude-20000)+T0);
end
    