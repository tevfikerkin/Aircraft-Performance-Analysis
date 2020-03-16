function Graph_CL_CD(max_velocity,weight,wingarea,Density,oswald,AR,CD0_1,aircraftname,HeightAltitude)
x=linspace(0,max_velocity);
CL=(2*(weight))./(Density*wingarea*x.^2);
CDi=(CL.^2)./((pi)*oswald*AR);
CD=CD0_1+CDi;
y=CL./CD;
graphCL_CD=plot(x,y);
grid on;
xlabel('Velocity (m/s)');
ylabel('CL/CD');
title([aircraftname 'at' HeightAltitude 'metre'  'CL/CD VERSUS VELOCITY GRAPH']);
indexmax = find(max(y) == y);
xmax = x(indexmax);
ymax = y(indexmax);
strmax = ['The most efficient velocity for A/C= ',num2str(xmax)];
text(xmax,ymax,strmax,'HorizontalAlignment','right');
saveas(graphCL_CD,'GrapCL_CD.jpg');
msgbox('Graphic saved as GraphCL_CD.jpg','NOTIFICATION','warn');
end