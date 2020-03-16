function [numbers MainMatrix]=Delete_Plane(planename,numbers,MainMatrix,planenumbers)

for i=1:max(planenumbers)
   
    qq=numbers(i,1);
    if planename==qq;
        numbers(i,:)=[];
        MainMatrix(i+1,:)=[];
        break
    end
end


