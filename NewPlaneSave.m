function [MainMatrix numbers planenumbers]=NewPlaneSave(Matrix,MainMatrix,ucakadiyaz,numbers)
b=size(MainMatrix,1)+1;
begin=strcat('C',num2str(b));
abegin=strcat('B',num2str(b));
cbegin=strcat('A',num2str(b));
Matrix(1)=[];
planenumbers=numbers(:,1);
ucaknumarasi=max(planenumbers)+1;
xlswrite('plane1deneme.xlsx',Matrix,1,begin)
xlswrite('plane1deneme.xlsx',ucakadiyaz,1,abegin);
xlswrite('plane1deneme.xlsx',ucaknumarasi,1,cbegin);
[numbers,strings,MainMatrix]=xlsread('plane1deneme.xlsx');
planenumbers=numbers(:,1);

end