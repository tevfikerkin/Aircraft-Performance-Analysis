function open=Show_TXT(max_velocity,AR,CDi,CD,lift,drag,dynamicpressure,induceddrag,PoweReqr,ThrustReqr)

Variables = [max_velocity;AR;CDi;CD;lift;drag;dynamicpressure;induceddrag;PoweReqr;ThrustReqr];
Propertie_s = {'Maximum Velocity(m/s): ' ;'Aspect Ratio(non-unit): ' ; 'Coefficient Of Induced Drag(non-unit): ';'Coefficient Of Drag(non-unit):';'Lift(newton):';'Drag(newton):';'Dynamic Pressure(kg/m*sec^2):';'Induced Drag(newton):';'PowerRequired(watt):';'Thrust Required(newton)\:'};
T = table(Variables,'RowNames',Propertie_s);
disp(T)
end