function Graph_Dynamic(max_velocity,Density,HeightAltitude,aircraftname)
V1=linspace(1,max_velocity);
dynamicpressure=(0.5)*Density*V1.^2; 
dynamic=plot(V1,dynamicpressure,'o c');
xlabel('Velocity(m/s)');
ylabel('Dynamic Pressure(kg/m*s^2)');
title([aircraftname 'at' HeightAltitude 'metre' 'CHANGING DYNAMIC PRESSURE RESPECT TO VELOCITY']);
grid on;
saveas(dynamic,'Dynamic_Pressure_Graph.jpg');
msgbox('Graphic saved as Dynamic_Pressure_Graph.jpg','NOTIFICATION','warn');
end