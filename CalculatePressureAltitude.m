%calculation of Temperature and pressure 

function Press1=CalculatePressureAltitude(HeightAltitude)

Grvty0=(9.80665);% m/s^2
R=287.000; % Joule/Kg*Kelvin
P0=101325;%Pascal
if HeightAltitude<=11000%metre 
    T1=Calculation_Temperature(HeightAltitude);
    T0=288.15;
    a=(-0.0065);
   Press1=P0*((T1/T0)^(-Grvty0/(a*R)));
elseif HeightAltitude<=20000 &&HeightAltitude>11000
    a=(-0.0065);
    T1=Calculation_Temperature(HeightAltitude);
    T0=288.15;
   P0=P0*((T1/T0)^(-Grvty0/(a*R)));
   T0=Calculate_Refarence_Temp(HeightAltitude);
   Press1=P0*(exp((-Grvty0/(R*T0))*(HeightAltitude-11000)));
elseif HeightAltitude<=32000 &&HeightAltitude>20000
     a=(-0.0065);
     T0=288.15;
     T1=216.65;
   P1=P0*((T1/T0)^(-Grvty0/(a*R)));
   T0=216.65;
   P0=P1*(exp((-Grvty0/(R*T0))*(20000-11000)));
   a=(0.001);
   T1=Calculation_Temperature(HeightAltitude);
T0=Calculate_Refarence_Temp(HeightAltitude);
    Press1=P0*((T1/T0)^(-Grvty0/(a*R)));
end