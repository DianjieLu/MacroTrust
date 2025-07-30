%Verify the results when bar_W = 0.5, and T varies from 0 to 1
bar_W = 0.8;
T = 0:0.01:1.0;
steps = 101;
%%Three frames for zeta =4,6,and 8
framenum = 3;
zeta = [4 6 8];

%% Compute the threshold Tc according to Eq.(39)
for frame = 1:1:framenum
    tic;
    Tcm (frame)= 1.0/(zeta(frame)*bar_W);
    elapsedTime = toc;
    fprintf('Time elapsed: %.6f seconds\n', elapsedTime);
 for i=1:1:steps
  threshline(frame,i) = Tcm(frame);
 end
end

%%Read the theoretical f_{TIGC} from files (computed using C++),zeta = 4
szBuffer1 = './dataTchange_W0.8/sin_fraction_node_change_zeta4.txt'; 
f1=fopen(szBuffer1,'r');
i=1;
while 1
nextline = fgetl(f1);
if ~isstr(nextline), break, end 
b=sscanf(nextline, '%f');
FractionS_Real(1,i) = b(1);
i=i+1;
end
fclose(f1);

%%Read the theoretical f_{TIGC} from files (computed using C++),zeta = 6
szBuffer1 = './dataTchange_W0.8/sin_fraction_node_change_zeta6.txt'; 
f1=fopen(szBuffer1,'r');
i=1;
while 1
nextline = fgetl(f1);
if ~isstr(nextline), break, end 
b=sscanf(nextline, '%f');
FractionS_Real(2,i) = b(1);
i=i+1;
end
fclose(f1);

%%Read the theoretical f_{TIGC} from files (computed using C++),zeta = 8
szBuffer1 = './dataTchange_W0.8/sin_fraction_node_change_zeta8.txt'; 
f1=fopen(szBuffer1,'r');
i=1;
while 1
nextline = fgetl(f1);
if ~isstr(nextline), break, end 
b=sscanf(nextline, '%f');
FractionS_Real(3,i) = b(1);
i=i+1;
end
fclose(f1);
  

%%Read the f_{TIGC} values statistically collected from simulation
%%networks, zeta = 4
szBuffer1 = './dataTchange_W0.8/sin_average_fraction_zeta4.txt'; 
f1=fopen(szBuffer1,'r');
i=1;
while 1
nextline = fgetl(f1);
if ~isstr(nextline), break, end 
b=sscanf(nextline, '%f %f');
w_f4(i) = b(1);
fraction4(i) = b(2);
i=i+1;
end
fclose(f1);

%%Read the f_{TIGC} values statistically collected from simulation
%%networks, zeta = 6
szBuffer1 = './dataTchange_W0.8/sin_average_fraction_zeta6.txt'; 
f1=fopen(szBuffer1,'r');
i=1;
while 1
nextline = fgetl(f1);
if ~isstr(nextline), break, end 
b=sscanf(nextline, '%f %f');
w_f6(i) = b(1);
fraction6(i) = b(2);
i=i+1;
end
fclose(f1);

%%Read the f_{TIGC} values statistically collected from simulation
%%networks, zeta = 8
szBuffer1 = './dataTchange_W0.8/sin_average_fraction_zeta8.txt'; 
f1=fopen(szBuffer1,'r');
i=1;
while 1
nextline = fgetl(f1);
if ~isstr(nextline), break, end 
b=sscanf(nextline, '%f %f');
w_f8(i) = b(1);
fraction8(i) = b(2);
i=i+1;
end
fclose(f1);


 figure;
 %%Plot the theoritical results of f_TIGC
 plot(T, FractionS_Real(1, :),'color',[255.0/255 185.0/255 146.0/255],'LineWidth',2);
 hold on;
 plot(T, FractionS_Real(2, :),'color',[246.0/255 126.0/255 125.0/255],'LineWidth',2);
 hold on;
 plot(T, FractionS_Real(3, :),'color',[132.0/255 59.0/255 98.0/255],'LineWidth',2);
 hold on;
  
 %%Plot the statistical results of f_TIGC collected from
%%simulated networks, zeta = 4
sHandle = scatter(w_f4,fraction4,70,'o','filled');
sHandle.MarkerEdgeColor = [255.0/255 185.0/255 146.0/255];
sHandle.MarkerFaceColor = [255.0/255 185.0/255 146.0/255];
 hold on;
 
 %%Plot the statistical results of f_TIGC collected from
%%simulated networks, zeta = 6
sHandle = scatter(w_f6,fraction6,80,'s','filled');
sHandle.MarkerEdgeColor = [246.0/255 126.0/255 125.0/255];
sHandle.MarkerFaceColor = [246.0/255 126.0/255 125.0/255];
 hold on;

%%Plot the statistical results of f_TIGC collected from
%%simulated networks, zeta = 8
sHandle = scatter(w_f8,fraction8,70,'d','filled');
sHandle.MarkerEdgeColor = [132.0/255 59.0/255 98.0/255];
sHandle.MarkerFaceColor = [132.0/255 59.0/255 98.0/255];
 hold on;

 %%Plot the critical thresholds 
 y_axis_size=0:0.01:1;
 plot(threshline(1,:),y_axis_size,'--','color',[255.0/255 185.0/255 146.0/255],'LineWidth',1);
 hold on;
 plot(threshline(2,:),y_axis_size,'--','color',[246.0/255 126.0/255 125.0/255],'LineWidth',1);
 hold on;
 plot(threshline(3,:),y_axis_size,'--','color',[132.0/255 59.0/255 98.0/255],'LineWidth',1);
  
 
 h = legend('z=4','z=6','z=8','location','Southeast');
 axis([0 1.0 0 1.0]); 
 xlabel({'$\bar{T}$'},'Interpreter','latex','FontSize',15)
 ylabel({'$f_{TIGC}(\bar{W},\bar{T})$/$f_{TOGC}(\bar{W},\bar{T})$'},'Interpreter','latex','FontSize',15)
 set(gca,'xtick',[0 0.2 0.4 0.6 0.8 1.0]);
  
set(gca,'FontSize',15)
 
 
 