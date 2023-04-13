clc
clear
close all

h = 0.01; % time-step
t = 0:h:5; % simulation time
Nt = numel(t);
y = zeros(2,Nt);
y(: ,1)=[0;0]; % initial values
f = @(t,y) [y(2);-21*y(2)-10*y(1)+10]; % ode function
for i=1:Nt-1
    k1=h * f(t(i) , y(: , i));
    k2=h * f(t(i)+h/2 , y(: , i)+k1/2);
    k3=h * f(t(i)+h/2 , y(: , i)+k2/2);
    k4=h * f(t(i)+h , y(: , i)+k3);
    y(: , i+1) = y(: ,i) + 1/6*(k1 + 2*k2 + 2*k3 + k4);
end
figure
plot(t,y(1,:),'LineWidth',1.2)
hold on
plot(t,y(2,:),'LineWidth',1.2)
xlabel('t')
ylabel('y')
grid on
legend({'y','dy'})