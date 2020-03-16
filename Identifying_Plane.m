function [numbers planename]=Identifying_Plane(numbers,planename,planenumbers)
for i=1:max(planenumbers)
    if planenumbers(i)==planename
       planename=i;
       break
    end
end