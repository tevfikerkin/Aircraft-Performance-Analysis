function [ThrustSea,PowerSea,MaxCL_CD,temperature,press1,Density,AR,CDi,CD,lift,drag,dynamicpressure,induceddrag,PoweReqr,ThrustReqr,thrust,weight,oswald,CD0_1,wingspan,wingarea,CL]=Main_Calculations(HeightAltitude,Thrust,Weight,Oswald,CD0,SpanLength,AreaOfWing,j,V1)

press1=CalculatePressureAltitude(HeightAltitude);
    temperature=Calculation_Temperature(HeightAltitude);
    Density=Density_Calculation(HeightAltitude);
    thrust=Thrust(j);
    weight=Weight(j)*9.8065;
    oswald=Oswald(j);
    CD0_1=CD0(j);
    wingspan=SpanLength(j);
    wingarea=AreaOfWing(j);
    AR=(wingspan^2)/(wingarea);
    CL=(2*(weight))/(Density*wingarea*V1^2);
    CDi=(CL^2)/((pi)*oswald*AR);
    CD=CD0_1+CDi;
    lift=(0.5)*((Density*(V1^2))*(wingarea*CL));
    drag=((0.5)*(Density*(V1^2))*(wingarea*CD));
    dynamicpressure=(0.5)*Density*V1^2;
    induceddrag=lift*(CL/(pi*oswald*AR));
    PoweReqr=sqrt(((2*(2*(weight)^3))*(CD)^2)/(Density*wingarea*(CL)^3));
    ThrustReqr=drag;
    ThrustSea=thrust;%Deniz seviyesindeki (katologta verilen fabrika verisi) toplam itki.
    PowerSea=thrust*V1; %uçaðýn deniz seviyesindeki kullanýcýnýn girdiði hýzda ürettiði toplam güç.
    MaxCL_CD=(sqrt(CD0_1*pi*oswald*AR))/(2*CD0_1);
end