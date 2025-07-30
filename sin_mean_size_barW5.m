%Verify the results when bar_W = 0.5, and T varies from 0 to 1
bar_W = 0.5;
T = 0:0.01:1.0;
steps = 101;
%%Three frames for zeta =4,6,and 8
framenum = 3;
zeta = [4 6 8];
%%Number of nodes 
n = 100000;
 
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

%%Compute <s>_in and <s>_out according to Eq.(38)
for frame = 1:1:framenum
for i=1:1:steps
    s(frame,i) = T(i) + (bar_W*T(i)*T(i)*zeta(frame))/(1-T(i)*bar_W*zeta(frame));
    %%if T(i) is higher than the critical threshold
    if (T(i)>=Tcm(frame))
        s(frame,i) = n;
    end     
end
end

%%Read sin and sout values statistically collected from simulation
%%networks, zeta = 4
szBuffer1 = './dataTchange_W0.5/average_sin_cluster_size_zeta4.txt'; 
f1=fopen(szBuffer1);
i=1;
while 1
nextline = fgetl(f1);
if ~isstr(nextline), break, end 
b=sscanf(nextline, '%f %f');
w_s4(i) = b(1);
meansize4(i) = b(2);
i=i+1;
end
fclose(f1);

%%Read sin and sout values statistically collected from simulation
%%networks, zeta = 6
szBuffer1 = './dataTchange_W0.5/average_sin_cluster_size_zeta6.txt'; 
f1=fopen(szBuffer1);
i=1;
while 1
nextline = fgetl(f1);
if ~isstr(nextline), break, end 
b=sscanf(nextline, '%f %f');
w_s6(i) = b(1);
meansize6(i) = b(2);
i=i+1;
end
fclose(f1);

%%Read sin and sout values statistically collected from simulation
%%networks, zeta = 8
szBuffer1 = './dataTchange_W0.5/average_sin_cluster_size_zeta8.txt'; 
f1=fopen(szBuffer1);
i=1;
while 1
nextline = fgetl(f1);
if ~isstr(nextline), break, end 
b=sscanf(nextline, '%f %f');
w_s8(i) = b(1);
meansize8(i) = b(2);
i=i+1;
end
fclose(f1);
 
figure;
%%Plot the theoritical results of <s>_in and <s>_out
plot(T,s(1,:),'color',[255.0/255 185.0/255 146.0/255],'LineWidth',2)
hold on;
plot(T,s(2,:),'color',[246.0/255 126.0/255 125.0/255],'LineWidth',2)
hold on;
plot(T,s(3,:),'color',[132.0/255 59.0/255 98.0/255],'LineWidth',2)
hold on;

%%Plot the statistical results of <s>_in and <s>_out collected from
%%simulated networks
sHandle = scatter(w_s4,meansize4,70,'o','filled');
sHandle.MarkerEdgeColor = [255.0/255 185.0/255 146.0/255];
sHandle.MarkerFaceColor = [255.0/255 185.0/255 146.0/255];
hold on; 
sHandle = scatter(w_s6,meansize6,70,'gs','filled');
sHandle.MarkerEdgeColor = [246.0/255 126.0/255 125.0/255];
sHandle.MarkerFaceColor = [246.0/255 126.0/255 125.0/255];

hold on; 
sHandle = scatter(w_s8,meansize8,70,'bd','filled');
sHandle.MarkerEdgeColor = [132.0/255 59.0/255 98.0/255];
sHandle.MarkerFaceColor = [132.0/255 59.0/255 98.0/255];
hold on; 

%%Plot the critical thresholds 
y_axis_size=0:0.3:30;
plot(threshline(1,:),y_axis_size,'--','color',[255.0/255 185.0/255 146.0/255],'LineWidth',1);
hold on;
plot(threshline(2,:),y_axis_size,'--','color',[246.0/255 126.0/255 125.0/255],'LineWidth',1);
hold on;
plot(threshline(3,:),y_axis_size,'--','color',[132.0/255 59.0/255 98.0/255],'LineWidth',1);
  
h = legend('z=4','z=6','z=8','location','Northeast');
axis([0 1 0 30]);   
xlabel({'$\bar{T}$'},'Interpreter','latex','FontSize',15)
ylabel('$\left<s\right>_{in}$/$\left<s\right>_{out}$','Interpreter','latex','FontSize',15);
set(gca,'xtick',[0 0.2 0.4 0.6 0.8 1.0]);
set(gca,'FontSize',15)
  
 
 