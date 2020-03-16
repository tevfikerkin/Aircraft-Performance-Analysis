function Main2()
clc;
clear all;
[numbers,strings,MainMatrix]=xlsread('plane1deneme.xlsx');
devam='E';
k=0;
while devam=='E' | devam=='Y'
    format bank;%2 ondalýk
    dongu=1;
    dongudevam=0;
    i=0;
    kontrol3=0;
    kontrol4=0;
    kontrol5=0;
    kontrol6=0;
    kontrol7=0;
    kontrol9=0;
    kont88=0;
    continue1=0;
    fprintf('Welcome to the AIRCRAFT ANALYZATION PROGRAM \nYou can calculate Aircraft performance at constant altitude which you choosed.\n\n');
    %%
    while i<=1
        showplane=MainMatrix(:,1:2);
        disp(showplane);
        istek=input('Do you want to add a new plane (Y/N): ','s');
        istek=lower(istek);
        if istek=='y' & isempty(str2num(istek))==1
            ucaknumarasi=size(MainMatrix,1);
            continue1='y';
            %%
            while continue1=='y'
                Matrix=[];
                %%
                for i=1:8
                    temp=i;
                    switch i% switch case yapýsýný sýralý ve düzgün matrix oluþturmak için kullandým.
                        case 1
                            count=0;
                            %%
                            while count==0
                                ucakadi=input('Please Input Aircraft Name: ','s');
                                if(exist('ucakadi')==1 & isempty(ucakadi)==0)
                                    count=1;
                                else
                                    msgbox('Please enter aircraft name!', 'ERROR!','error');
                                    count=0;
                                    beep;
                                end
                            end
                            ucakadi1={ucakadi};%üstteki komutla ucakadi ni atayýp yazdýrmaya çalýþtýðýmda sadece baþharfini yazdýrýyprdu bu sorunu string ifadesini hücreye atayýp yazdýrarak çözdüm.
                            ucakadiyaz=ucakadi1(1,1);
                        case 2
                            count=0;
                            %%
                            while count==0
                                weighti=input('Input WEIGHT OF  A/C(aircraft)(kg): ','s');
                                
                                if size(weighti,1)==1 & isempty(str2num(weighti))~=1
                                    count=1;
                                    weighti=str2num(weighti);
                                else
                                    msgbox('Wrong value, please input valid WEIGHT  value !','ERROR','error');
                                    beep;
                                    count=0;
                                end
                            end
                            i=weighti;
                            
                        case 3
                            count=0;
                            %%
                            while count==0
                                oswaldi=input('Please Input OSWALD Value: ','s');
                                if(size(oswaldi,1)==1) & isempty(str2num(oswaldi))~=1
                                    count=1;
                                else
                                    msgbox('Wrong value, please input valid OSWALD value !','ERROR','error');
                                    beep;
                                    count=0;
                                end
                            end
                            oswaldi= str2num(oswaldi);
                            i=oswaldi;
                        case 4
                            count=0;
                            %%
                            while count==0
                                cd0=input('Please input CD-0(non-unit): ','s');
                                if(size(cd0,1)==1) & isempty(str2num(cd0))~=1
                                    count=1;
                                else
                                    msgbox('Wrong value, please input valid CD-0(Parasite Drag Coefficient) value !','ERROR','error');
                                    beep;
                                    count=0;
                                end
                            end
                            cd0= str2num(cd0);
                            i=cd0;
                        case 5
                            count=0;
                            %%
                            while count==0
                                wingspani=input('Please Input SPAN LENGTH(metre): ','s');
                                if(size(wingspani,1)==1) & isempty(str2num(wingspani))~=1
                                    count=1;
                                else
                                    msgbox('Wrong value, please input valid SPAN LENGTH value !','ERROR','error');
                                    beep;
                                    count=0;
                                end
                            end
                            wingspani=str2num(wingspani);
                            i=wingspani;
                        case 6
                            count=0;
                            %%
                            while count==0
                                wingareai=input('Please Input WING SURFACE AREA(m^2): ','s');
                                
                                if(size(wingareai,1)==1) & isempty(str2num(wingareai))~=1
                                    count=1;
                                else
                                    msgbox('Wrong value, please input valid WING SURFACE AREA value !','ERROR','error');
                                    beep;
                                    count=0;
                                end
                            end
                            wingareai=str2num(wingareai);
                            i=wingareai;
                            
                        case 7
                            count=0;
                            %%
                            while count==0
                                thrusti=input('Please input THRUST value that from user guide (newton): ','s');
                                
                                if(size(thrusti,1)==1) & isempty(str2num(thrusti))~=1
                                    count=1;
                                else
                                    msgbox('Wrong value, please input valid THRUST value !','ERROR','error');
                                    beep;
                                    count=0;
                                end
                            end
                            thrusti=str2num(thrusti);
                            i=thrusti;
                        case 8
                            count=0;
                            %%
                            while count==0
                                maxvelocity=input('Please input MAKSIMUM VELOCITY of A/C(aircraft)(m/s): ','s');
                                if(size(maxvelocity,1)==1) & isempty(str2num(maxvelocity))~=1 %length komutuda kullanýlabilir ama ben bunu terih ettim.
                                    count=1;
                                else
                                    msgbox('Wrong value, please input valid MAKSIMUM VELOCITY value !','ERROR');
                                    beep;
                                    count=0;
                                end
                            end
                            maxvelocity=str2num(maxvelocity);
                            i=maxvelocity;
                    end
                    Matrix(temp)=i;
                end
                MainMatrix=NewPlaneSave(Matrix,MainMatrix,ucakadiyaz,ucaknumarasi);
                f = msgbox('All information succesfully saved','Success');
                beep;
                kontrol88=0;
                while kontrol88==0
                    clc;
                    showplane=MainMatrix(:,1:2);
                    disp(showplane);
                    continue1=input('Do you want to add a new one ? (Y/N): ','s');
                    continue1=lower(continue1);
                    if continue1=='y' | continue1=='n'
                        kontrol88=1;
                    else
                        kontrol88=0;
                    end
                end
            end
            %             f = msgbox('All information succesfully saved','Success');
            [numbers,strings,MainMatrix]=xlsread('plane1deneme.xlsx');%yeni eklenen uçaðý görmesi için tekrar dosyayý okuttum.
            numbers(:,2)=[];
            [Weight Oswald CD0 SpanLength AreaOfWing DensitySea Thrust Max_Velocity MainMatrix]=AddNew(numbers,MainMatrix);
            i=2;% while döngüsünden çýkmasý için yaptým.
        elseif istek=='n' & isempty(str2num(istek))==1%eðer girilen veri char ise bu fonksyion 0 döndürecek o yüzden 0 dedim.
            disp('You did not want to add a new plane. After, please choose a plane from list.');
            %             [numbers,strings,MainMatrix]=xlsread('plane1deneme.xlsx');
            numbers(:,2)=[];
            [Weight Oswald CD0 SpanLength AreaOfWing DensitySea Thrust Max_Velocity MainMatrix]=AddNew(numbers,MainMatrix);
            i=3;% while döngüsünden çýkmasý için yaptým.
        else
            msgbox('Please input correct character(Y/N).!', 'ERROR!','error');
            beep;
            i=0;
        end
    end
    %%
    
    while dongudevam==0
        clc;
        disp(showplane);
        while kont88==0 
            delete=input('Do you want to delete a plane from list ? (Y/N): ','s');
            delete=lower(delete);
            if delete=='y'
                count43=0;
                kont88=1;
            elseif delete=='n'
                dongudevam=1;
                kont88=1;
                count43=1;
                count25=1;
              
            else
                msgbox('Please input correct character(Y/N).!', 'ERROR!','error');
                beep;
                kont88=0;
                count43=1;
                count25=1;
            end
            %%
            while count43==0
                wish=input('Please enter a plane number that you want to delete: ', 's');
                if isempty(wish)~=1 & isempty(str2num(wish))~=1 & size(MainMatrix,1)>=str2num(wish)
                    wish=str2num(wish);
                    %                     [numbers,strings,MainMatrix]=xlsread('plane1deneme.xlsx');
                    [numbers MainMatrix]=Delete_Plane(wish,numbers,MainMatrix);
                    msgbox('Deleting information is successful.','Success');
                    count25=0;
                    count43=1;
                else
                    msgbox('Please enter valid value.','ERROR','error');
                    count43=0;
                end
            end
            %%
            while count25==0
                register=input('Do you want to save new excell file as referance ? (Y/N): ','s');
                if lower(register)=='y'| lower(register)=='n'
                    disp('');
                else
                    msgbox('Please valid character (Y/N)','ERROR','error');
                    beep;
                    count25=0;
                end
                while lower(register)=='y' |lower(register)=='n' % eðer deðer istediðim gibi deðilse program bu satýra hiç inemyecek hýzlandýrmak için yaptým.
                    if (lower(register)=='y')
                        MainMatrix=Print_New_Excell(MainMatrix);
                        msgbox('New referance file saved in this folder');
                        beep;
                        count25=1;
                        register=1;
                        kont88=0;
                        
                        showplane=MainMatrix(:,1:2);
                    elseif lower(register)=='n'
                        disp('Referance file is same.')
                        
                        count25=1;
                        register=1;
                        dongudevam=0;
                        kont88=0;
                        
                          showplane=MainMatrix(:,1:2);
                    else
                        msgbox('Please valid character (Y/N)','ERROR','error');
                        beep;
                        count25=0;
                    end
                    clc;
                    disp(showplane);
                    
                end
            end
        end
        %%
        clc;
        disp(showplane);
        count87=0;
        while  count87==0
            planename=input('Input number of aircraf: ','s');
            if isempty(str2num(planename))~=1 & str2num(planename)<=size(MainMatrix,1)-1
                count87=1;
                planename=str2num(planename);
            elseif isempty(str2num(planename))==1
                msgbox('Please you must choose the constant values from table!', 'ERROR!','error');
                beep;
                count87=0;
            elseif size(planename,1)==0
                msgbox('There is no input argument!', 'ERROR!','error');
                count87=0;
                beep;
            elseif  str2num(planename)>size(MainMatrix,1)-1
                msgbox('Please you must choose the constant values from table!', 'ERROR!','error');
                beep;
                count87=0;
            end
        end
        %%
        while kontrol3==0;
            HeightAltitude=input('Please input altitude(m): ','s');
            if str2num(HeightAltitude)>32000
                msgbox('This altitude is too high,must be between(0-32000m)', 'ERROR!','error');
                kontrol3=0;
            elseif isempty(str2num(HeightAltitude))==1
                msgbox('Please you enter numeric value.!', 'ERROR!','error');
                beep;
                kontrol3=0;
            elseif size(HeightAltitude,1)==0
                msgbox('There is no input argument!', 'ERROR!','error');
                beep;
                kontrol3=0;
            elseif  isempty(str2num(HeightAltitude))~=1
                kontrol3=1;
                HeightAltitude=str2num(HeightAltitude);
            end
        end
        max_velocity=Max_Velocity(planename);%matrix ten alýyorum.
        disp(['Your plane that choosed can go maximum ', num2str(max_velocity) ' m/s']);
        %%
        while kontrol4==0;
            V1=input('Please input velocity of aircraft(m/s): ','s');
            if max_velocity<str2num(V1)
                msgbox('Please input less than maximum VELOCITY!', 'ERROR!','error');
                beep;
                kontrol4=0;
            elseif isempty(str2num(V1))==1
                msgbox('Please you enter numeric value.!', 'ERROR!','error');
                beep;
                kontrol4=0;
            elseif size(max_velocity,1)==0
                msgbox('There is no input argument!', 'ERROR!','error');
                beep;
                kontrol4=0;
            elseif  isempty(str2num(V1))~=1
                kontrol4=1;
                V1=str2num(V1);
            end
        end
        disp(['Choosed aircraft number: ' num2str(planename)]);
        fprintf('Aircraft velocity that you choosed: %gm/s\n',V1);
        fprintf('Altitude that you choosed: %gm\n',HeightAltitude);
        j=planename;
        planename=MainMatrix(planename+1,2);
        format bank;%2 ondalýk
        [ThrustSea,PowerSea,MaxCL_CD,temperature,press1,Density,AR,CDi,CD,lift,drag,dynamicpressure,induceddrag,PoweReqr,ThrustReqr,thrust,weight,oswald,CD0_1,wingspan,wingarea,CL]=Main_Calculations(HeightAltitude,Thrust,Weight,Oswald,CD0,SpanLength,AreaOfWing,j,V1);
        fprintf('Temperature(Kelvin): %1.2f\tPressure(Pa): %1.2f\t Density(kg/m^3): %1.2f\n\nMax Velocity(m/s):%1.2f\nAspect ratio: %1.2f(non-unit) \nCD-Ý:%1.5f(non-unit) \nCD: %1.2f(non-unit) \nLift: %1.2f(newton)\nDrag: %1.2f(newton) \nDynamicPressure: %1.2f(kg/m*sec^2)\nInduced Drag: %1.2f(newton)\nPower Requirement: %1.2f(watt)\nThrust Reqirement: %1.2f(newton)\n *****************//////***********\n\n',temperature,press1,Density,max_velocity,AR,CDi,CD,lift,drag,dynamicpressure,induceddrag,PoweReqr,ThrustReqr);
        while kontrol5==0;
            cikti=input('Do You Want to Output Values ?(Y/N):','s');
            cikti=upper(cikti);
            if cikti=='Y' | cikti=='N'
                kontrol5=1;
            elseif size(cikti,1)==0
                msgbox('There is no input argument!', 'ERROR!','error');
                beep;
                kontrol5=0;
            else
                msgbox('Please input correct character(Y/N).!', 'ERROR!','error');
                beep;
                kontrol5=0;
            end
        end
        %%
        if cikti=='Y'
            count5=0;
            while count5==0
                how=input('Which format do you want to output ? (for txt -->1 / for xlsx--->2 / for both ---->3): ','s');
                if size(how,1)==0
                    msgbox('There is no input argument!', 'ERROR!','error');
                    beep;
                    count5=0;
                elseif isempty(str2num(how))~=1 & str2num(how)<4
                    count5=1;
                    how=str2num(how);
                elseif  how>3
                    
                    msgbox('Please input correct format name as you see in bracket', 'ERROR!','error');
                    beep;
                    count5=0;
                end
            end
            switch how
                case 1
                    kont6=0;
                    while kont6==0
                        filename=input('Please input the file name that you want: ','s');
                        if size(filename,1)==0
                            msgbox('There is no input argument!', 'ERROR!','error');
                            beep;
                            kont6=0;
                        else
                            kont6=1;
                        end
                    end
                    Print_TXT(filename,max_velocity,AR,CDi,CD,lift,drag,dynamicpressure,induceddrag,PoweReqr,ThrustReqr)
                    kontrol6=1;
                    %%
                    while kontrol7==0;
                        open=input('Do you want to open the view of .txt file  that consist of your values in MATLAB ?(Y/N): ','s');
                        open=upper(open);
                        if open=='Y' |open=='N'
                            kontrol7=1;
                        elseif size(open,1)==0
                            msgbox('There is no input argument!', 'ERROR!','error');
                            beep;
                            kontrol7=0;
                        else
                            kontrol7=0;
                        end
                    end
                    switch open
                        case 'Y'
                            Show_TXT(max_velocity,AR,CDi,CD,lift,drag,dynamicpressure,induceddrag,PoweReqr,ThrustReqr);
                        case'N'
                            disp('--------------------******************-----------------------------');
                    end
                case 2
                    kont6=0;
                    while kont6==0
                        filename=input('Please enter the file name that you want: ','s');
                        if size(filename,1)==0
                            msgbox('There is no input argument!', 'ERROR!','error');
                            beep;
                            kont6=0;
                        else
                            kont6=1;
                        end
                    end
                    ffilename=Print_XLSX(max_velocity,AR,CDi,CD,lift,drag,dynamicpressure,induceddrag,PoweReqr,ThrustReqr,filename);
                    kontrol6=1;
                    while kontrol9==0;
                        open=input('Do you want to open the view of .xlsx file that you saved in MATLAB ?(Y/N): ','s');
                        open=upper(open);
                        if open=='Y' |open=='N'
                            kontrol9=1;
                        elseif size(open,1)==0
                            msgbox('There is no input argument!', 'ERROR!','error');
                            beep;
                            kontrol9=0;
                        else
                            msgbox('Please input correct character(Y/N).!', 'ERROR!','error');
                            beep;
                            kontrol9=0;
                        end
                    end
                    switch open
                        case'Y'
                            [x,y,z]=xlsread(ffilename);
                            disp(z);
                        case 'N'
                            disp('---------------------------**************************-----------------------------');
                    end
                case 3
                    kont6=0;
                    %%
                    while kont6==0
                        filename=input('Please input the file name that you want for .txt format: ','s');
                        if size(filename,1)==0
                            msgbox('There is no input argument!', 'ERROR!','error');
                            beep;
                            kont6=0;
                        else
                            kont6=1;
                        end
                    end
                    Print_TXT(filename,max_velocity,AR,CDi,CD,lift,drag,dynamicpressure,induceddrag,PoweReqr,ThrustReqr);
                    kont6=0;
                    while kont6==0
                        filename=input('Please input the file name that you want for .xlsx format: ','s');
                        if size(filename,1)==0
                            msgbox('Please enter a file name !', 'ERROR!','error');
                            beep;
                            kont6=0;
                        else
                            kont6=1;
                        end
                    end
                    ffilename=Print_XLSX(max_velocity,AR,CDi,CD,lift,drag,dynamicpressure,induceddrag,PoweReqr,ThrustReqr,filename);
                    kontrol6=1;
                    kontrol7=0;
                    while kontrol7==0;
                        open=input('Do you want to open the view of .txt file  that consist of your values in MATLAB ?(Y/N): ','s');
                        open=upper(open);
                        if open=='Y' |open=='N'
                            kontrol7=1;
                        elseif size(open,1)==0
                            msgbox('There is no input argument!', 'ERROR!','error');
                            beep;
                            kontrol7=0;
                        else
                            msgbox('Please input correct character.!', 'ERROR!','error');
                            beep;
                            kontrol7=0;
                        end
                    end
                    %%
                    switch open
                        case 'Y'
                            Show_TXT(max_velocity,AR,CDi,CD,lift,drag,dynamicpressure,induceddrag,PoweReqr,ThrustReqr);
                        case'N'
                            disp('--------------------******************-----------------------------');
                    end
                    kontrol9=0;
                    while kontrol9==0;
                        open=input('Do you want to open the view of .xlsx file that you saved in MATLAB ?(Y/N): ','s');
                        open=upper(open);
                        if open=='Y' |open=='N'
                            kontrol9=1;
                        elseif size(open,1)==0
                            msgbox('There is no input argument!', 'ERROR!','error');
                            beep;
                            kontrol9=0;
                        else
                            msgbox('Wrong value input, please input valid value (Y/N)', 'ERROR!','error');
                            beep;
                            kontrol9=0;
                        end
                    end
                    switch open
                        case'Y'
                            [x,y,z]=xlsread(ffilename);
                            disp(z);
                        case 'N'
                            disp('---------------------------**************************-----------------------------');
                    end
            end
        end
        kontrol9=0;
        while kontrol9==0;
            
            draw=input('Do you want to show Basic Performance Graphs with those values ?(Y/N): ','s');
            draw=lower(draw);
            if draw=='y'|draw=='n'
                kontrol9=1;
            elseif size(draw,1)==0
                msgbox('There is no input argument!', 'ERROR!','error');
                beep;
                kontrol9=0;
            else
                msgbox('Wrong value input, please input valid value (Y/N)', 'ERROR!','error');
                beep;
                kontrol9=0;
            end
        end
        %%
        if draw=='y'
            kontrol9=0;
            while kontrol9==0
                graph=input('Which type of graph you want to see and save CL/CD(1), Dynamic Pressure(2) or Both(3): ','s');
                if str2num(graph)>0 & str2num(graph)<4 & isempty(str2num(graph))~=1
                    kontrol9=1;
                    graph=str2num(graph);
                elseif size(graph,1)==0
                    msgbox('There is no input argument!', 'ERROR!','error');
                    beep;
                    kontrol9=0;
                else
                    msgbox('Wrong choice , please input correct value (1,2 or 3)', 'ERROR!','error');
                    beep;
                    kontrol9=0;
                end
            end
            if graph==1
                Graph_CL_CD(max_velocity,weight,wingarea,Density,oswald,AR);
            elseif graph==2
                Graph_Dynamic(max_velocity,V1,Density);
            elseif graph==3
                Graph_Both(max_velocity,weight,wingarea,Density,oswald,AR,CD0_1)
            else
                disp('---------*************--------------');
            end
        end
        kontrol9=0;
        while kontrol9==0
            devam=input('Would you like to make a calculation for a new plane ? (Y/N): ','s');
            devam=upper(devam);
            if devam=='Y' | devam=='N'
                kontrol9=1;
            elseif size(devam,1)==0
                msgbox('There is no input argument!', 'ERROR!','error');
                beep;
                kontrol9=0;
            else
                msgbox('Wrong value input, please input valid value (Y/N)', 'ERROR!','error');
                beep;
                kontrol9=0;
            end
        end
        if devam=='N'
            clc;
            fprintf('PROGRAM TERMINATED BY USER.\n\n...THANKS A LOT , HOPE TO SEE YOU AGAIN...\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n');
            
            fprintf('\t\t\t\t\t\t\t\t\t\t\t\t\t\t  All Rights Reserved By Tevfik Erkin\n'); 
        end
    end
end
%%