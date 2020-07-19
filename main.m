%% Program for the 2-D Constant velocity Model
clc;
clear;
close all;


%% Initialization
rng(2028)

% Truth state
x0 = [0;1;0;3];% x,vx,y,vy

dt = .1;
tspan = 0:dt:5;
len = length(tspan);


% Process Noise
px = 1; py = 1.41; % varinace of process noise

Qsub = [dt^3/3   dt^2/2;
              dt^2/2   dt];
Zeros2 = zeros(2,2);          
Q = [px*Qsub          Zeros2;
        Zeros2         py*Qsub]; % process noise matrix
   

%% Obtain the truth
truthWithoutNoise = NaN(len,4);
truthWithNoise = NaN(len,4);


truthWithoutNoise(1,:) = x0;
truthWithNoise(1,:) = x0;

for i = 2:len
    truthWithoutNoise(i,:) = consv2d(truthWithoutNoise(i-1,:)', dt);
    truthWithNoise(i,:) = consv2d(truthWithNoise(i-1,:)',dt,Q);
end


%% Visualization
figure()
plot(truthWithoutNoise(:,1), truthWithoutNoise(:,3),'ro');
hold on;
plot(truthWithNoise(:,1), truthWithNoise(:,3),'bo');
xlabel('x'); ylabel('y')
legend('Without noise','With noise')














