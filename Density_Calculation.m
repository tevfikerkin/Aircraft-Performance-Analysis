% density calculation

function Density=Density_Calculation(HeightAltitude)
T=Calculation_Temperature(HeightAltitude);
R=287; %Joule/K*Kg;
Pressure=CalculatePressureAltitude(HeightAltitude);
Density=Pressure/(R*T);
end

