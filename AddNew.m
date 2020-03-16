function [Weight,Oswald,CD0,SpanLength,AreaOfWing,DensitySea,Thrust,Max_Velocity,MainMatrix]=AddNew(numbers,MainMatrix)
%yeni uçaðýnda verilerini okutmak için bu fonksiyonu yazdým.
Weight=numbers(:,2);
Oswald=numbers(:,3);
CD0=numbers(:,4);
SpanLength=numbers(:,5);
AreaOfWing=numbers(:,6);
DensitySea=1.225;
Thrust=numbers(:,7);
Max_Velocity=numbers(:,8);
end