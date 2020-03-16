function Graph_Both(max_velocity,weight,wingarea,Density,oswald,AR,CD0_1,aircraftname,HeightAltitude)
subplot(2,1,1);
x=linspace(0,max_velocity);
CL=(2*(weight))./(Density*wingarea*x.^2);
CDi=(CL.^2)./((pi)*oswald*AR);
CD=CD0_1+CDi;
y=CL./CD;
plot(x,y,'-- b')
xlabel('Velocity (m/s)');
ylabel('CL/CD');
title([aircraftname 'at' HeightAltitude 'metre' 'CL/CD VERSUS VELOCITY GRAPH']);
indexmax = find(max(y) == y);
xmax = x(indexmax);
ymax = y(indexmax);
strmax = ['The most efficient velocity for A/C= ',num2str(xmax)];
text(xmax,ymax,strmax,'HorizontalAlignment','right');
grid on;
subplot(2,1,2);
V1=linspace(1,max_velocity);
dynamicpressure=(0.5)*Density*V1.^2;
bothofthem=plot(V1,dynamicpressure,'o c');
xlabel('Velocity(m/s)');
ylabel('Dynamic Pressure(kg/m*s^2)');
title('CHANGING DYNAMIC PRESSURE RESPECT TO VELOCITY');
grid on;
saveas(bothofthem,'Graph_Both.jpg');
msgbox('The graphic saved as Graph_Both.jpg','Notification','warn');
end