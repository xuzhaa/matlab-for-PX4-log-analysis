% % "shift+�Ҽ�"�� powershell ����-> "ulog2csv xxx.ulg" ��.ulgת��Ϊ.csv

clc
clear

t=0;
%%%%%%%%%%%%%%�ļ�ʱ��%%%%%%%%%%%%%%
filedata='429';
filename='1-4';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

filename_1=['log-',filedata,'\','log',filename,'_vehicle_local_position_0.csv'];
filename_1a=['log-',filedata,'\','log',filename,'_actuator_controls_0_0.csv'];
DATA = xlsread(filename_1, 1);%��ȡsheet1
[a,b]=size(DATA); %��������


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



figure(1) %���ƶ�ά�켣
plot(local_y,local_x); %λ��

figure(2) %���Ƹ߶�����
plot(t,-local_z); %λ��

figure(3) %������ά�켣
plot3(local_y,local_x,-local_z); %λ��
xlabel('x');ylabel('y');zlabel('z');

figure(4) %�����ٶ�
plot(t,v'); %λ��


figure(5) %�����ٶȺͼ��ٶ�
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

figure(6) %������̬
subplot(3,1,1)
plot(t,roll);title('roll/����');xlabel('Time(s)');grid;
subplot(3,1,2)
plot(t,pitch);title('pitch/����');xlabel('Time(s)');grid;
subplot(3,1,3)
plot(t,yaw);title('yaw/ƫ��');xlabel('Time(s)');grid;
