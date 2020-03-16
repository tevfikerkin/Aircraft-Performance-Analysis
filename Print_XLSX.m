function [ffilename filename]=Print_XLSX(max_velocity,AR,CDi,CD,lift,drag,dynamicpressure,induceddrag,PoweReqr,ThrustReqr,filename)

ffilename=strcat(filename,'.xlsx');
msgbox(['The folder where the file name is located will be saved as ' , ffilename],'Notification');
Variables = [max_velocity;AR;CDi;CD;lift;drag;dynamicpressure;induceddrag;PoweReqr;ThrustReqr];
Propertie_s = [{'Maximum Velocity(m/s): ' ; 'Aspect Ratio(non-unit): ' ; 'Coefficient Of Induced Drag(non-unit): ';'Coefficient Of Drag(non-unit):';'Lift(newton):';'Drag(newton):';'Dynamic Pressure(kg/m*sec^2):';'Induced Drag(newton):';'PowerRequired(watt):';'Thrust Required(newton)\:'}];
ttable=table(Propertie_s,    Variables);
writetable(ttable,ffilename);
end