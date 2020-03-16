function Main()
% format bank;%2 ondalýk
[numbers,strings,mix]=xlsread('plane1.xlsx');
mix(:,3:size(mix,2))=[];
devam='E';
k=0;
while devam=='E' | devam=='Y'
    %     clear all;
    format bank;%2 ondalýk 
    %     [numbers,strings,mix]=xlsread('plane1.xlsx');
    %     mix(:,3:size(mix,2))=[];
    dongu=1;
    dongudevam=0;
    i=0;
    kontrol3=0;
    kontrol4=0;
    kontrol5=0;
    kontrol6=0;
    kontrol7=0;
    kontrol9=0;
    clc;
    %     Dil=input('Kullanma dilini seçiniz: Türkçe/English (T/E): ','s');
    %     Dil=upper(Dil);
    %     if Dil=='E'
    fprintf('Welcome to the AIRCRAFT ANALYZATION PROGRAM \nYou can calculate Aircraft performance at constant altitude which you choosed.\n\n');
    clc;
    disp(mix);
    
    while i<=1
        clc;
        disp(mix);
        istek=input('Do you want to add a new plane (Y/N): ','s');
        istek=lower(istek);
        if istek=='y'
            ucaknumarasi=size(mix,1);
            continue1='y';
            while continue1=='y'
                a=[];
                for i=1:8
                    temp=i;
                    switch i
                        case 1
                            count=0;
                            while count==0
                                ucakadi=input('Please Input Aircraft Name: ','s');
                                if(exist('ucakadi')==1)
                                    count=1;
                                else
                                    count=0;
                                end
                            end
                            ucakadi1={ucakadi}%üstteki komutla ucakadi ni atayýp yazdýrmaya çalýþtýðýmda sadece baþharfini yazdýrýyprdu bu sorunu string ifadesini hücreye atayýp yazdýrarak çözdüm.
                            ucakadiyaz=ucakadi1(1,1);
                        case 3
                            count=0;
                            while count==0
                                oswaldi=input('Please Input OSWALD Value: ');
                                if(size(oswaldi,1)==1)
                                    count=1;
                                else
                                    msgbox('Wrong value, please input valid OSWALD value !','ERROR');
                                    count=0;
                                end
                            end
                            i=oswaldi;
                        case 7
                            count=0;
                            while count==0
                                thrusti=input('Please input THRUST value that from user guide (newton): ');
                                if(size(thrusti,1)==1)
                                    count=1;
                                else
                                    msgbox('Wrong value, please input valid THRUST value !','ERROR');
                                    count=0;
                                end
                            end
                            i=thrusti;
                        case 4
                            count=0;
                            while count==0
                                cd0=input('Please input CD-0(non-unit): ');
                                if(size(cd0,1)==1)
                                    count=1;
                                else
                                    msgbox('Wrong value, please input valid CD-0(Parasite Drag Coefficient) value !','ERROR');
                                    count=0;
                                end
                            end
                            i=cd0;
                        case 5
                            count=0;
                            while count==0
                                wingspani=input('Please Input SPAN LENGTH(metre): ');
                                if(size(wingspani,1)==1)
                                    count=1;
                                else
                                    msgbox('Wrong value, please input valid SPAN LENGTH value !','ERROR');
                                    count=0;
                                end
                            end
                            i=wingspani;
                        case 6
                            count=0;
                            while count==0
                                wingareai=input('Please Input WING SURFACE AREA(m^2): ');
                                if(size(wingareai,1)==1)
                                    count=1;
                                else
                                    msgbox('Wrong value, please input valid WING SURFACE AREA value !','ERROR');
                                    count=0;
                                end
                            end
                            i=wingareai;
                        case 8
                            count=0;
                            while count==0
                                maxvelocity=input('Please input MAKSIMUM VELOCITY of A/C(aircraft)(m/s): ');
                                if(size(maxvelocity,1)==1) %length komutuda kullanýlabilir ama ben bunu terih ettim.
                                    count=1;
                                else
                                    msgbox('Wrong value, please input valid MAKSIMUM VELOCITY value !','ERROR');
                                    count=0;
                                end
                            end
                            i=maxvelocity;
                        case 2
                            count=0;
                            while count==0
                                weighti=input('Input WEIGHT OF  A/C(aircraft)(kg): ');
                                if size(weighti,1)==1
                                    count=1;
                                else
                                    msgbox('Wrong value, please input valid WEIGHT  value !','ERROR');
                                    count=0;
                                end
                            end
                            i=weighti;
                    end
                    a(temp)=i;
                end
                [numbers,strings,mix]=xlsread('plane1deneme.xlsx');
                b=size(mix,1)+k;
                begin=strcat('C',num2str(b));
                abegin=strcat('B',num2str(b));
                cbegin=strcat('A',num2str(b));
                ucaknumarasi=b-1;
                a(1)=[];
                xlswrite('plane1deneme.xlsx',ucaknumarasi,1,cbegin);
                xlswrite('plane1deneme.xlsx',a,1,begin)
                xlswrite('plane1deneme.xlsx',ucakadiyaz,1,abegin);
                
                kontrol88=0;
                while kontrol88==0
                    continue1=input('Do you want to add a new one ? (Y/N): ','s');
                    continue1=lower(continue1);
                    if continue1=='y' || continue1=='n'
                        kontrol88=1;
                    else
                        kontrol88=0;
                    end
                end
                k=k+1;
            end
            f = msgbox('All information succesfully saved','Success');
            [numbers,strings,mix]=xlsread('plane1deneme.xlsx');
            numbers(:,2)=[];
            Weight=numbers(:,2);
            Oswald=numbers(:,3);
            CD0=numbers(:,4);
            WingSpan=numbers(:,5);
            WingArea=numbers(:,6);
            DensitySea=1.225;
            Thrust=numbers(:,7);
            Max_Velocity=numbers(:,8);
            mix(:,3:size(mix,2))=[];
            i=2;
        elseif istek=='n'
            disp('You did not want to add a new plane. After, please choose a plane from list.');
            [numbers,strings,mix]=xlsread('plane1.xlsx');
            numbers(:,2)=[];
            Weight=numbers(:,2);
            Oswald=numbers(:,3);
            CD0=numbers(:,4);
            WingSpan=numbers(:,5);
            WingArea=numbers(:,6);
            DensitySea=1.225;
            Thrust=numbers(:,7);
            Max_Velocity=numbers(:,8);
            mix(:,3:size(mix,2))=[];
            i=3;
        else
            msgbox('Please input correct character(Y/N).!', 'ERROR!','error');
            %             disp('Wrong value input. Please input correct character.');
            i=0;
        end
    end
    while dongudevam==0
        clc;
        disp(mix);
        planename=input('Input number of aircraf: ');
        
        if planename>size(mix,1)-1 | planename<1
            msgbox('Please you must choose the constant values from table!', 'ERROR!','error');
            dongudevam=0;
        elseif size(planename,1)==0
            msgbox('There is no input argument!', 'ERROR!','error');
            dongudevam=0;
        else
            dongudevam=1;
        end
    end
    while kontrol3==0;
        HeightAltitude=input('Please input altitude(m): ');
        if HeightAltitude>32000  ischar(HeightAltitude)
            msgbox('This altitude is too high,must be between(0-32000m)', 'ERROR!','error');
            %             disp('Please input valid value , this altitude is too high');
            kontrol3=0;
        elseif size(HeightAltitude,1)==0
            msgbox('There is no input argument!', 'ERROR!','error');
            kontrol3=0;
        else
            kontrol3=1;
        end
    end
    
    max_velocity=Max_Velocity(planename);
    
    disp(['Your plane that choosed can go maximum ', num2str(max_velocity) ' m/s']);
    while kontrol4==0;
        V1=input('Please input velocity of aircraft(m/s): ');
        if max_velocity<V1
            msgbox('Please input less than maximum VELOCITY!', 'ERROR!','error');
            %             disp('Please input less than maximum VELOCITY.');
            kontrol4=0;
        elseif size(max_velocity,1)==0
            msgbox('There is no input argument!', 'ERROR!','error');
            kontrol4=0;
        else
            kontrol4=1;
        end
    end
    disp(['Choosed aircraft number: ' num2str(planename)]);
    fprintf('Aircraft velocity that you choosed: %gm/s\n',V1);
    fprintf('Altitude that you choosed: %gm\n',HeightAltitude);
    j=planename;
    planename=mix(planename+1,2);
    
    format bank;%2 ondalýk
    
    press1=CalculatePressureAltitude(HeightAltitude);
    temperature=Calculation_Temperature(HeightAltitude);
    Density=Density_Calculation(HeightAltitude);
    thrust=Thrust(j);
    weight=Weight(j)*9.8065;
    oswald=Oswald(j);
    CD0_1=CD0(j);
    wingspan=WingSpan(j);
    wingarea=WingArea(j);
    AR=(wingspan^2)/(wingarea);
    CL=(2*(weight))/(Density*wingarea*V1^2);
    CDi=(CL^2)/((pi)*oswald*AR);
    CD=CD0_1+CDi;
    lift=(0.5)*((Density*(V1^2))*(wingarea*CL));
    drag=((0.5)*(Density*(V1^2))*(wingarea*CD));
    dynamicpressure=(0.5)*Density*V1^2;
    induceddrag=lift*(CL/(pi*oswald*AR));
    PoweReqr=sqrt(((2*(2*(weight)^3))*(CD)^2)/(Density*wingarea*(CL)^3));
    ThrustReqr=drag;
    ThrustSea=thrust;%Deniz seviyesindeki (katologta verilen fabrika verisi) toplam itki.
    PowerSea=thrust*V1; %uçaðýn deniz seviyesindeki kullanýcýnýn girdiði hýzda ürettiði toplam güç.
    MaxCL_CD=(sqrt(CD0_1*pi*oswald*AR))/(2*CD0_1);
    celldisp(planename);
    fprintf('Temperature(Kelvin): %1.2f\tPressure(Pa): %1.2f\t Density(kg/m^3): %1.2f\n\nMax Velocity(m/s):%1.2f\nAspect ratio: %1.2f(non-unit) \nCD-Ý:%1.5f(non-unit) \nCD: %1.2f(non-unit) \nLift: %1.2f(newton)\nDrag: %1.2f(newton) \nDynamicPressure: %1.2f(kg/m*sec^2)\nInduced Drag: %1.2f(newton)\nPower Requirement: %1.2f(watt)\nThrust Reqirement: %1.2f(newton)\n *****************//////***********\n\n',temperature,press1,Density,max_velocity,AR,CDi,CD,lift,drag,dynamicpressure,induceddrag,PoweReqr,ThrustReqr);
    while kontrol5==0;
        cikti=input('Do You Want to Output Values ?(Y/N):','s');
        cikti=upper(cikti);
        if cikti=='Y' | cikti=='N'
            kontrol5=1;
        elseif size(cikti,1)==0
            msgbox('There is no input argument!', 'ERROR!','error');
            kontrol5=0;
        else
            msgbox('Please input correct character(Y/N).!', 'ERROR!','error');
            %             disp('Wrong value input, please input valid value (Y/N)');
            kontrol5=0;
        end
    end
    if cikti=='Y'
        %         while kontrol6==0;
        count5=0;
        while count5==0
            how=input('Which format do you want to output ? (for txt -->1 / for xlsx--->2 / for both ---->3): ');
            if size(how,1)==0
                msgbox('There is no input argument!', 'ERROR!','error');
                count5=0;
            elseif how>3
                msgbox('Please input correct format name as you see in bracket', 'ERROR!','error');
                count5=0;
            else
                count5=1;
            end
        end
        switch how
            
            case 1
                kont6=0;
                while kont6==0
                    filename=input('Please input the file name that you want: ','s');
                    if size(filename,1)==0
                       msgbox('There is no input argument!', 'ERROR!','error');
                        kont6=0;
                    else
                        kont6=1;
                    end
                end
                ffilename=strcat(filename,'.txt');
                f = msgbox(['The folder where the file name is located will be saved as ' , ffilename],'Notification');
                Variables = [max_velocity;AR;CDi;CD;lift;drag;dynamicpressure;induceddrag;PoweReqr;ThrustReqr];
                Propertie_s = [{'Maximum Velocity(m/s): ' ; 'Aspect Ratio(non-unit): ' ; 'Coefficient Of Induced Drag(non-unit): ';'Coefficient Of Drag(non-unit):';'Lift(newton):';'Drag(newton):';'Dynamic Pressure(kg/m*sec^2):';'Induced Drag(newton):';'PowerRequired(watt):';'Thrust Required(newton)\:'}];
                ttable=table(Propertie_s,Variables);
                writetable(ttable,ffilename);
                kontrol6=1;
                while kontrol7==0;
                    open=input('Do you want to open the view of .txt file  that consist of your values in MATLAB ?(Y/N): ','s');
                    open=upper(open);
                    if open=='Y' |open=='N'
                        kontrol7=1;
                    elseif size(open,1)==0
                        msgbox('There is no input argument!', 'ERROR!','error');
                        %                             disp('Please input correct character.');
                        kontrol7=0;
                    else
                        kontrol7=0;
                    end
                end
                switch open
                    case 'Y'
                        %                     system('notepad C:\Users\Tevfik''s Lenovo\Desktop\MATLAB PROJE\Deðerler.txt');
                        Variables = [max_velocity;AR;CDi;CD;lift;drag;dynamicpressure;induceddrag;PoweReqr;ThrustReqr];
                        Propertie_s = {'Maximum Velocity(m/s): ' ;'Aspect Ratio(non-unit): ' ; 'Coefficient Of Induced Drag(non-unit): ';'Coefficient Of Drag(non-unit):';'Lift(newton):';'Drag(newton):';'Dynamic Pressure(kg/m*sec^2):';'Induced Drag(newton):';'PowerRequired(watt):';'Thrust Required(newton)\:'};
                        T = table(Variables,'RowNames',Propertie_s);
                        disp(T)
                    case'N'
                        disp('--------------------******************-----------------------------');
                end
            case 2
                
                kont6=0;
                while kont6==0
                    
                    filename=input('Please input the file name that you want: ','s');
                    if size(filename,1)==0
                        msgbox('There is no input argument!', 'ERROR!','error');
                        kont6=0;
                    else
                        kont6=1;
                    end
                end
                
                ffilename=strcat(filename,'.xlsx');
                f = msgbox(['The folder where the file name is located will be saved as ' , ffilename],'Notification');
                %                            disp(['The folder where the file name is located will be saved as ' , ffilename]);
                Variables = [max_velocity;AR;CDi;CD;lift;drag;dynamicpressure;induceddrag;PoweReqr;ThrustReqr];
                Propertie_s = [{'Maximum Velocity(m/s): ' ; 'Aspect Ratio(non-unit): ' ; 'Coefficient Of Induced Drag(non-unit): ';'Coefficient Of Drag(non-unit):';'Lift(newton):';'Drag(newton):';'Dynamic Pressure(kg/m*sec^2):';'Induced Drag(newton):';'PowerRequired(watt):';'Thrust Required(newton)\:'}];
                %                 Unit=[{' non-unit','non-unit','non-unit',' non-unit',' newton',' newton','kg/m*s^2','newton','watt','newton'}];
                ttable=table(Propertie_s,    Variables);
                writetable(ttable,ffilename);
                kontrol6=1;
                while kontrol9==0;
                    open=input('Do you want to open the view of .xlsx file that you saved in MATLAB ?(Y/N):: ','s');
                    open=upper(open);
                    if open=='Y' |open=='N'
                        kontrol9=1;
                    elseif size(open,1)==0
                        msgbox('There is no input argument!', 'ERROR!','error');
                        kontrol9=0;
                    else
                        msgbox('Please input correct character(Y/N).!', 'ERROR!','error');
                        %                             disp('Wrong value input, please input valid value (Y/N)');
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
                while kont6==0
                    filename=input('Please input the file name that you want for .txt format: ','s');
                    if size(filename,1)==0
                         msgbox('There is no input argument!', 'ERROR!','error');
                        kont6=0;
                    else
                        kont6=1;
                    end
                end
                ffilename=strcat(filename,'.txt');
                f = msgbox(['The folder where the file name is located will be saved as ' , ffilename],'Notification');
                Variables = [max_velocity;AR;CDi;CD;lift;drag;dynamicpressure;induceddrag;PoweReqr;ThrustReqr];
                Propertie_s = [{'Maximum Velocity(m/s): ' ; 'Aspect Ratio(non-unit): ' ; 'Coefficient Of Induced Drag(non-unit): ';'Coefficient Of Drag(non-unit):';'Lift(newton):';'Drag(newton):';'Dynamic Pressure(kg/m*sec^2):';'Induced Drag(newton):';'PowerRequired(watt):';'Thrust Required(newton)\:'}];
                ttable=table(Propertie_s,Variables);
                writetable(ttable,ffilename);
                kont6=0;
                while kont6==0
                    filename=input('Please input the file name that you want for .xlsx format: ','s');
                    if size(filename,1)==0
                        msgbox('Please input correct character(Y/N).!', 'ERROR!','error');
                        kont6=0;
                    else
                        kont6=1;
                    end
                end
                ffilename2=strcat(filename,'.xlsx');
                f = msgbox(['The folder where the file name is located will be saved as ' , ffilename2],'Notification');
                Variables = [max_velocity;AR;CDi;CD;lift;drag;dynamicpressure;induceddrag;PoweReqr;ThrustReqr];
                Propertie_s = [{'Maximum Velocity(m/s): ' ; 'Aspect Ratio(non-unit): ' ; 'Coefficient Of Induced Drag(non-unit): ';'Coefficient Of Drag(non-unit):';'Lift(newton):';'Drag(newton):';'Dynamic Pressure(kg/m*sec^2):';'Induced Drag(newton):';'PowerRequired(watt):';'Thrust Required(newton)\:'}];
                ttable=table(Propertie_s,    Variables);
                writetable(ttable,ffilename2);
                kontrol6=1;
                %                         bu satýr þüpheli
                kontrol7=0;
                while kontrol7==0;
                    open=input('Do you want to open the view of .txt file  that consist of your values in MATLAB ?(Y/N): ','s');
                    open=upper(open);
                    if open=='Y' |open=='N'
                        kontrol7=1;
                    elseif size(open,1)==0
                        msgbox('There is no input argument!', 'ERROR!','error');
                        kontrol7=0;
                        
                    else
                        msgbox('Please input correct character.!', 'ERROR!','error');
                        %                             disp('Please input correct character.');
                        kontrol7=0;
                    end
                end
                switch open
                    case 'Y'
                        %                     system('notepad C:\Users\Tevfik''s Lenovo\Desktop\MATLAB PROJE\Deðerler.txt');
                        Variables = [max_velocity;AR;CDi;CD;lift;drag;dynamicpressure;induceddrag;PoweReqr;ThrustReqr];
                        Propertie_s = {'Maximum Velocity(m/s): ' ;'Aspect Ratio(non-unit): ' ; 'Coefficient Of Induced Drag(non-unit): ';'Coefficient Of Drag(non-unit):';'Lift(newton):';'Drag(newton):';'Dynamic Pressure(kg/m*sec^2):';'Induced Drag(newton):';'PowerRequired(watt):';'Thrust Required(newton)\:'};
                        T = table(Variables,'RowNames',Propertie_s);
                        disp(T)
                    case'N'
                        disp('--------------------******************-----------------------------');
                end
                
                
                kontrol9=0;
                while kontrol9==0;
                    open=input('Do you want to open the view of .xlsx file that you saved in MATLAB ?(Y/N):: ','s');
                    open=upper(open);
                    if open=='Y' |open=='N'
                        kontrol9=1;
                    elseif size(open,1)==0
                        msgbox('There is no input argument!', 'ERROR!','error');
                        kontrol9=0;
                    else
                        msgbox('Wrong value input, please input valid value (Y/N)', 'ERROR!','error');
                        %                             disp('Wrong value input, please input valid value (Y/N)');
                        kontrol9=0;
                    end
                end
                switch open
                    case'Y'
                        [x,y,z]=xlsread(ffilename2);
                        disp(z);
                    case 'N'
                        disp('---------------------------**************************-----------------------------');
                end
                %                 otherwise
                %                     msgbox('Please input correct format name as you see in bracket', 'ERROR!','error');
                %                     disp('Please input correct format name as you see in bracket');
                %                     kontrol6=0;
        end
        %         end
    end
    kontrol9=0;
    while kontrol9==0;
        
        draw=input('Do you want to show Basic Performance Graphs with those values ?(Y/N): ','s');
        draw=lower(draw);
        if draw=='y'|draw=='n'
            
            kontrol9=1;
        elseif size(draw,1)==0
            msgbox('There is no input argument!', 'ERROR!','error');
            kontrol9=0;
        else
            
            msgbox('Wrong value input, please input valid value (Y/N)', 'ERROR!','error');
            %             disp('Wrong value input, please input valid value (Y/N)');
            kontrol9=0;
        end
    end
    if draw=='y'
        kontrol9=0;
        while kontrol9==0
            graph=input('Which type of graph you want to see CL/CD(1), Dynamic Pressure(2) or Both(3): ');
            if graph>0 && graph<4
                kontrol9=1;
            elseif size(graph,1)==0
                msgbox('There is no input argument!', 'ERROR!','error');
                kontrol9=0;
            else
                msgbox('Wrong choice , please input correct value (1,2 or 3)', 'ERROR!','error');
                %                 disp('Wrong choice , please input correct value (1,2 or 3)');
                kontrol9=0;
            end
        end
        if graph==1
            x=linspace(0,max_velocity);
            CL=(2*(weight))./(Density*wingarea*x.^2);
            CDi=(CL.^2)./((pi)*oswald*AR);
            CD=CD0_1+CDi;
            y=CL./CD;
            plot(x,y)
            grid on;
            xlabel('VELOCITY (m/s)');
            ylabel('CL/CD');
            title('CL/CD VERSUS VELOCITY GRAPH')
            indexmax = find(max(y) == y);
            xmax = x(indexmax);
            ymax = y(indexmax);
            strmax = ['CL/CD at this velocity= ',num2str(xmax)];
            text(xmax,ymax,strmax,'HorizontalAlignment','right');
        elseif graph==2
            V1=linspace(1,max_velocity);
            dynamicpressure=(0.5)*Density*V1.^2;
            plot(V1,dynamicpressure,'o c')
            xlabel('Velocity(m/s)');
            ylabel('Dynamic Pressure(kg/m*s^2)');
            title('Changing Dynamic Pressure According to Velocity');
            %                         indexmax = find(max(dynamicpressure) == dynamicpressure);
            %                         V1x = x(indexmax);
            %                         dynamicpressuremax = dynamicpressure(indexmax);
            %                         strmax = [' Max hýz = ',num2str(V1x)];
            %                         text(V1x,dynamicpressuremax,strmax,'HorizontalAlignment','right');
            grid on;
        elseif graph==3
            subplot(2,1,1);
            x=linspace(0,max_velocity);
            CL=(2*(weight))./(Density*wingarea*x.^2);
            CDi=(CL.^2)./((pi)*oswald*AR);
            CD=CD0_1+CDi;
            y=CL./CD;
            plot(x,y,'-- b')
            xlabel('VELOCITY (m/s)');
            ylabel('CL/CD');
            title('CL/CD VERSUS VELOCITY GRAPH')
            indexmax = find(max(y) == y);
            xmax = x(indexmax);
            ymax = y(indexmax);
            strmax = [' Max CL/CD oraný hýzý = ',num2str(xmax)];
            text(xmax,ymax,strmax,'HorizontalAlignment','right');
            grid on;
            subplot(2,1,2);
            V1=linspace(1,max_velocity);
            dynamicpressure=(0.5)*Density*V1.^2;
            plot(V1,dynamicpressure,'o c')
            xlabel('Hýz(m/s)');
            ylabel('Dinamik Basýnç(kg/m*s^2)');
            title('Hýza baðlý dinamik basýncýn deðiþim grafiði');
            grid on;
            
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
            kontrol9=0;
        else
            msgbox('Wrong value input, please input valid value (Y/N)', 'ERROR!','error');
            %             disp('Wrong value input, please input correct character.');
            kontrol9=0;
            
        end
    end
    if devam=='N'
        clc;
        disp('Good Bye...');
        
    end
    %     end
end
%%türkçe ekleme.
% elseif Dil=='T'
%     fprintf('Uçak analiz programýna hoþgeldiniz. \nBu program ile hafýzada bulunan uçaklarýn istediðiniz irtifadaki\n-analizlerini ve diðer özelliklerini görüntüleyebilirsiniz.\n\n');
%     clc;
%     disp(mix);
%     while i<=1
%         istek=input('Yeni uçak eklemek ister misiniz? [Sadece 1 yeni uçak ekleyebilirsiniz.](E/H): ','s');
%         istek=lower(istek);
%         if istek=='e'
%             ucaknumarasi=size(mix,1);
%             ucakadi=input('Please Input Aircraft Name: ','s');
%             ucakadi={ucakadi}%üstteki komutla ucakadi ni atayýp yazdýrmaya çalýþtýðýmda sadece baþharfini yazdýrýyprdu bu sorunu string ifadesini hücreye atayýp yazdýrarak çözdüm.
%             ucakadiyaz=ucakadi(1,1);
%             %üstteki komutla ucakadi ni atayýp yazdýrmaya çalýþtýðýmda sadece baþharfini yazdýrýyprdu bu sorunu string ifadesini hücreye atayýp yazdýrarak çözdüm.
%             oswaldi=input('Oswald deðerini giriniz: ');
%             thrusti=input('Fabrika verilerinin vermiþ olduðu itki kuvvetini giriniz(newton): ');
%             cd0=input('CD-0 deðerini giriniz(birimsiz): ');
%             wingspani=input('Kanat açýklýðýný giriniz(metre): ');
%             wingareai=input('Kanat yüzey alanýný giriniz(m^2): ');
%             maxvelocity=input('Maksimum hýzýný giriniz(m/s): ');
%             weighti=input('Aðýrlýðý giriniz(kg): ');
%             xlswrite('plane1deneme.xlsx',ucaknumarasi,1,'A8');
%             xlswrite('plane1deneme.xlsx',ucakadiyaz,1,'B8');
%             xlswrite('plane1deneme.xlsx',weighti,1,'C8');
%             xlswrite('plane1deneme.xlsx',oswaldi,1,'D8');
%             xlswrite('plane1deneme.xlsx',cd0,1,'E8');
%             xlswrite('plane1deneme.xlsx',wingspani,1,'F8');
%             xlswrite('plane1deneme.xlsx',wingareai,1,'G8');
%             xlswrite('plane1deneme.xlsx',thrusti,1,'H8');
%             xlswrite('plane1deneme.xlsx',maxvelocity,1,'I8');
%             k = msgbox('Tüm veriler baþarýlý bir þekilde kaydedildi.','Baþarýlý');
%             Weight=xlsread('plane1deneme.xlsx','C2:C8');
%             Oswald=xlsread('plane1deneme.xlsx','D2:D8');
%             CD0=xlsread('plane1deneme.xlsx','E2:E8');
%             WingSpan=xlsread('plane1deneme.xlsx','F2:F8');
%             WingArea=xlsread('plane1deneme.xlsx','G2:G8');
%             DensitySea=(1.225);
%             Thrust=xlsread('plane1deneme.xlsx','H2:H8');
%             PlaneName=xlsread('plane1deneme.xlsx','B2:B8');
%             Max_Velocity=xlsread('plane1deneme.xlsx','I2:I8');
%             [numbers,strings,mix]=xlsread('plane1deneme.xlsx');
%             mix(:,3:size(mix,2))=[];
%             i=2;
%         elseif istek=='h'
%             disp('Uçak eklemek istemediniz , lütfen listeden bir uçak seçiniz.');
%             Weight=xlsread('plane1.xlsx','C2:C7');
%             Oswald=xlsread('plane1.xlsx','D2:D7');
%             CD0=xlsread('plane1.xlsx','E2:E7');
%             WingSpan=xlsread('plane1.xlsx','F2:F7');
%             WingArea=xlsread('plane1.xlsx','G2:G7');
%             DensitySea=(1.225);
%             Thrust=xlsread('plane1.xlsx','H2:H7');
%             PlaneName=xlsread('plane1.xlsx','B2:B7');
%             Max_Velocity=xlsread('plane1.xlsx','I2:I7');
%             [numbers,strings,mix]=xlsread('plane1.xlsx');
%             mix(:,3:size(mix,2))=[];
%             i=2;
%         else
%             i=0;
%             disp('Hatalý veri giriþi, lütfen E yada H ye basýnýz.');
%         end
%     end
%     while dongudevam==0
%         clc
%         disp(mix);
%         planename=input('Uçak numarasý giriniz: ');
%         if planename>size(mix,1)-1 | planename<1
%             msgbox('Lütfen belirtilen deðerlerden birini giriniz', 'Hatalý sayý giriþi!','error');
%             dongudevam=0;
%         else
%             dongudevam=1;
%         end
%     end
%     while kontrol3==0;
%         HeightAltitude=input('Lütfen irtifayý giriniz(m): ');
%         if HeightAltitude>32000
%             disp('Atmosfer yüksekliðinden fazla deðer girdiniz ne yazýkki uçak bu yükseklikte uçamaz..:) Lütfen 0-32000m arasýnda deðer giriniz.')
%             kontrol3=0;
%         else
%             kontrol3=1;
%         end
%     end
%     max_velocity=Max_Velocity(planename);
%     disp(['Seçilen uçak en fazla ', num2str(max_velocity) ' m/s hýzla gidebilir. Lütfen maksimum hýz veya daha düþüðünü giriniz.']);
%     while kontrol4==0;
%         V1=input('Lütfen uçaðýn hýzýný giriniz(m/s): ');
%         if V1>max_velocity
%             disp('Maksimum hýzdan büyük deðer girdiniz, lütfen geçerli bir deðer giriniz.');
%             kontrol4=0;
%         else
%             kontrol4=1;
%         end
%     end
%     disp(['Seçtiðiniz uçaðýn numarasý: ' num2str(planename)]);
%     fprintf('Uçaðýnýzýn hýzý: %gm/s\n',V1);
%     fprintf('Analiz yapmak istediðiniz irtifa: %gm\n',HeightAltitude);
%     j=planename;
%     planename=mix(planename+1,2);
%
%     format bank;%2 ondalýk
%     press1=CalculatePressureAltitude(HeightAltitude);
%     temperature=Calculation_Temperature(HeightAltitude);
%     Density=Density_Calculation(HeightAltitude);
%     thrust=Thrust(j);
%     weight=Weight(j)*9.8065;
%     oswald=Oswald(j);
%     CD0_1=CD0(j);
%     wingspan=WingSpan(j);
%     wingarea=WingArea(j);
%     AR=(wingspan^2)/(wingarea);
%     CL=(2*(weight))/(Density*wingarea*V1^2);
%     CDi=(CL^2)/((pi)*oswald*AR);
%     CD=CD0_1+CDi;
%     lift=(0.5)*((Density*(V1^2))*(wingarea*CL));
%     drag=((0.5)*(Density*(V1^2))*(wingarea*CD));
%     dynamicpressure=(0.5)*Density*V1^2;
%     induceddrag=lift*(CL/(pi*oswald*AR));
%     %             thrustrequired=dynamicpressure*wingarea*CL;
%     %             powerrequired=thrustrequired*1;
%     %             performance=CD/CL;
%     PoweReqr=sqrt(((2*(2*(weight)^3))*(CD)^2)/(Density*wingarea*(CL)^3));
%     %             ThrustReqr=dynamicpressure*wingarea*CL;
%     ThrustReqr=drag;
%     ThrustSea=thrust;%Deniz seviyesindeki (katologta verilen fabrika verisi) toplam itki.
%     PowerSea=thrust*V1; %uçaðýn deniz seviyesindeki kullanýcýnýn girdiði hýzda ürettiði toplam güç.
%     MaxCL_CD=(sqrt(CD0_1*pi*oswald*AR))/(2*CD0_1);
%     celldisp(planename);
%     fprintf('Sýcaklýk: %1.2f(Kelvin)\tBasýnç: %1.2f(Pa)\t Density: %1.2f(kg/m^3)\n\nMaksimum Hýz(m/s): %1.2f\nKanat Açýklýk Oraný: %1.2f(birimsiz) \nCD-Ý:%1.5f(birimsiz) \nCD: %1.2f(birimsiz) \nKaldýrma Kuvveti: %1.2f(newton)\nSürükleme Kuvveti: %1.2f(newton) \nDinamik Basýnç: %1.2f(kg/m*sec^2)\nÝndüklenmiþ Sürükleme Kuvveti: %1.2f(newton)\nGerekli Güç: %1.2f(watt)\nGerekli Ýtki: %1.2f(newton)\n*****************//////***********\n\n',temperature,press1,Density,max_velocity,AR,CDi,CD,lift,drag,dynamicpressure,induceddrag,PoweReqr,ThrustReqr);
%
%     cikti=input('Deðerleri Çýktý Almak Ýster Misiniz ?(E/H):','s');
%     cikti=upper(cikti);
%     if cikti=='E'
%         how=input('Degerleri hangi formatta çýktý almak istersiniz ? (txt/xlsx): ','s');
%         how=lower(how);
%         switch how
%
%             case 'txt'
%                 disp('Veriler bulunduðunuz klasöre '' Deðerler.txt '' olarak kaydedilecektir.');
%                 Variables = [max_velocity;AR;CDi;CD;lift;drag;dynamicpressure;induceddrag;PoweReqr;ThrustReqr];
%                 Propertie_s = [{'Maksimum Hýz(m/s): ' ; 'Kanat Açýklýk Oraný(non-unit): ' ; 'Ýndüklenmiþ Sürükleme Katsayýsý(non-unit): ';'Sürükleme Katsayýsý(non-unit):';'Kaldýrma Kuvveti(newton):';'Sürükleme Kuvveti(newton):';'Dinamik Basýnç(kg/m*sec^2):';'Ýndüklenmiþ Sürükleme Kuvveti(newton):';'Gerekli Güç(watt):';'Gerekli Ýtki(newton)\:'}];
%                 %                 Unit=[{' non-unit','non-unit','non-unit',' non-unit',' newton',' newton','kg/m*s^2','newton','watt','newton'}];
%                 ttable=table(Propertie_s,Variables);
%                 writetable(ttable,'Values.txt');
%                 open=input('Kaydettiðiniz Deðerler.txt dosyasýný MATLAB''ta açmak ister misiniz ?(E/H): ','s');
%                 open=upper(open);
%                 switch open
%                     case 'E'
%                         %                     system('notepad C:\Users\Tevfik''s Lenovo\Desktop\MATLAB PROJE\Deðerler.txt');
%                         Variables = [max_velocity;AR;CDi;CD;lift;drag;dynamicpressure;induceddrag;PoweReqr;ThrustReqr];
%                         Propertie_s = {'Maksimum Hýz(m/s): ' ; 'Kanat Açýklýk Oraný(non-unit): ' ; 'Ýndüklenmiþ Sürükleme Katsayýsý(non-unit): ';'Sürükleme Katsayýsý(non-unit):';'Kaldýrma Kuvveti(newton):';'Sürükleme Kuvveti(newton):';'Dinamik Basýnç(kg/m*sec^2):';'Ýndüklenmiþ Sürükleme Kuvveti(newton):';'Gerekli Güç(watt):';'Gerekli Ýtki(newton)\:'};%deðerleri türkçe yaz
%                         T = table(Variables,'RowNames',Propertie_s);
%                         disp(T)
%                     case'H'
%                         disp('--------------------******************-----------------------------');
%                 end
%             case 'xlsx'
%                 disp('Veriler bulunduðunuz klasöre '' Deðerler.xlsx '' olarak kaydedilecektir.');
%                 Variables = [max_velocity;AR;CDi;CD;lift;drag;dynamicpressure;induceddrag;PoweReqr;ThrustReqr];
%                 Propertie_s = [{'Maksimum Hýz(m/s): ' ; 'Kanat Açýklýk Oraný(non-unit): ' ; 'Ýndüklenmiþ Sürükleme Katsayýsý(non-unit): ';'Sürükleme Katsayýsý(non-unit):';'Kaldýrma Kuvveti(newton):';'Sürükleme Kuvveti(newton):';'Dinamik Basýnç(kg/m*sec^2):';'Ýndüklenmiþ Sürükleme Kuvveti(newton):';'Gerekli Güç(watt):';'Gerekli Ýtki(newton)\:'}];
%                 %                 Unit=[{' non-unit','non-unit','non-unit',' non-unit',' newton',' newton','kg/m*s^2','newton','watt','newton'}];
%                 ttable=table(Propertie_s,    Variables);
%                 writetable(ttable,'Deðerler.xlsx');
%                 open=input('Kaydettiðiniz Deðerler.xlsx dosyasýný MATLAB''ta açmak ister misiniz ?(E/H): ','s');
%                 open=upper(open);
%                 switch open
%                     case'E'
%                         [x,y,z]=xlsread('Deðerler.xlsx');
%                         disp(z);
%                     case 'H'
%                         disp('---------------------------**************************-----------------------------');
%                 end
%         end
%     end
%     draw=input('Bu verilerle temel performans grafiklerini görüntülemek ister misiniz ?(E/H): ','s');
%     draw=lower(draw);
%     if draw=='e'
%         grafik=input('Hangi grafiði görüntülemek istersiniz CL/CD(1) veya Dinamik Basýncýn Hýza Baðlý Deðiþimi(2) Her ikisi(3): ');
%         %                     grafik=1;
%         %                     grafik1=2;
%         if grafik==1
%
%             x=linspace(0,max_velocity);
%             CL=(2*(weight))./(Density*wingarea*x.^2);
%             CDi=(CL.^2)./((pi)*oswald*AR);
%             CD=CD0_1+CDi;
%             y=CL./CD;
%             plot(x,y,'-- b')
%             xlabel('VELOCITY (m/s)');
%             ylabel('CL/CD');
%             title('CL/CD VERSUS VELOCITY GRAPH')
%             indexmax = find(max(y) == y);
%             xmax = x(indexmax);
%             ymax = y(indexmax);
%             strmax = [' Max CL/CD oraný hýzý = ',num2str(xmax)];
%             text(xmax,ymax,strmax,'HorizontalAlignment','right');
%             grid on;
%         elseif grafik==2
%             V1=linspace(1,max_velocity);
%             dynamicpressure=(0.5)*Density*V1.^2;
%             plot(V1,dynamicpressure,'o c')
%             xlabel('Hýz(m/s)');
%             ylabel('Dinamik Basýnç(kg/m*s^2)');
%             title('Hýza baðlý dinamik basýncýn deðiþim grafiði');
%             %                         indexmax = find(max(dynamicpressure) == dynamicpressure);
%             %                         V1x = x(indexmax);
%             %                         dynamicpressuremax = dynamicpressure(indexmax);
%             %                         strmax = [' Max hýz = ',num2str(V1x)];
%             %                         text(V1x,dynamicpressuremax,strmax,'HorizontalAlignment','right');
%             grid on;
%         elseif grafik==3
%             subplot(2,1,1);
%             x=linspace(0,max_velocity);
%             CL=(2*(weight))./(Density*wingarea*x.^2);
%             CDi=(CL.^2)./((pi)*oswald*AR);
%             CD=CD0_1+CDi;
%             y=CL./CD;
%             plot(x,y,'-- b')
%             xlabel('VELOCITY (m/s)');
%             ylabel('CL/CD');
%             title('CL/CD VERSUS VELOCITY GRAPH')
%             indexmax = find(max(y) == y);
%             xmax = x(indexmax);
%             ymax = y(indexmax);
%             strmax = [' Max CL/CD oraný hýzý = ',num2str(xmax)];
%             text(xmax,ymax,strmax,'HorizontalAlignment','right');
%             grid on;
%             subplot(2,1,2);
%             V1=linspace(1,max_velocity);
%             dynamicpressure=(0.5)*Density*V1.^2;
%             plot(V1,dynamicpressure,'o c')
%             xlabel('Hýz(m/s)');
%             ylabel('Dinamik Basýnç(kg/m*s^2)');
%             title('Hýza baðlý dinamik basýncýn deðiþim grafiði');
%         else
%             disp('---------*************--------------');
%         end
%
%     else
%         disp('---------*************--------------');
%     end
%     devam=input('Yeni bir uçak için hesaplama yapmak ister misiniz ? (E/H): ','s');
%     devam=upper(devam);
%     if devam=='H'
%         clc;
%         disp('Hoþçakalýn...');
%
%         break
%     end
% end
% end
% end