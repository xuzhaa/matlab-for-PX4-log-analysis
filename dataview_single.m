% % "shift+右键"打开 powershell 输入-> "ulog2csv xxx.ulg" 将.ulg转换为.csv

clc
clear

t=0;
%%%%%%%%%%%%%%文件时间%%%%%%%%%%%%%%
filedata='429';
filename='1-4';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

filename_1=['log-',filedata,'\','log',filename,'_vehicle_local_position_0.csv'];
filename_1a=['log-',filedata,'\','log',filename,'_actuator_controls_0_0.csv'];
DATA = xlsread(filename_1, 1);%读取sheet1
[a,b]=size(DATA); %计算行列


for i=1:1:a-1
    t=[t; i*0.1];  
end

local_x=csvread(filename_1,1,4,[1 4 a 4 ]);
local_y=csvread(filename_1,1,5,[1 5 a 5 ]);
local_z=csvread(filename_1,1,6,[1 6 a 6 ]);

vx=csvread(filename_1,1,10,[1 10 a 10 ]);
vy=csvread(filename_1,1,11,[1 11 a 11 ]);
vz=csvread(filename_1,1,12,[1 12 a 12 ]);

for i=1:1:a
  v(i)=sqrt((vx(i))^2+(vy(i))^2+(vz(i))^2);
end

ax=csvread(filename_1,1,17,[1 17 a 17 ]);
ay=csvread(filename_1,1,18,[1 18 a 18 ]);
az=csvread(filename_1,1,19,[1 19 a 19 ]);

roll=csvread(filename_1a,1,3,[1 3 a 3 ]);
pitch=csvread(filename_1a,1,4,[1 4 a 4 ]);
yaw=csvread(filename_1a,1,5,[1 5 a 5 ]);



figure(1) %绘制二维轨迹
plot(local_y,local_x); %位置

figure(2) %绘制高度曲线
plot(t,-local_z); %位置

figure(3) %绘制三维轨迹
plot3(local_y,local_x,-local_z); %位置
xlabel('x');ylabel('y');zlabel('z');

figure(4) %绘制速度
plot(t,v'); %位置


figure(5) %绘制速度和加速度
subplot(2,3,1)
plot(t,vx);title('vx');xlabel('Time(s)');grid;
subplot(2,3,2)
plot(t,vy);title('vy');xlabel('Time(s)');grid;
subplot(2,3,3)
plot(t,-vz);title('vz');xlabel('Time(s)');grid;
subplot(2,3,4)
plot(t,ax);title('ax');xlabel('Time(s)');grid;
subplot(2,3,5)
plot(t,ay);title('ay');xlabel('Time(s)');grid;
subplot(2,3,6)
plot(t,az);title('az');xlabel('Time(s)');grid;

figure(6) %绘制姿态
subplot(3,1,1)
plot(t,roll);title('roll/翻滚');xlabel('Time(s)');grid;
subplot(3,1,2)
plot(t,pitch);title('pitch/俯仰');xlabel('Time(s)');grid;
subplot(3,1,3)
plot(t,yaw);title('yaw/偏航');xlabel('Time(s)');grid;
