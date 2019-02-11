%globalize masses and length
clear;
global M1 M2 Length1 Length2
M1=input('enter mass of 1st pendulum:');
M2=input('enter mass of 2nd pendulum :');
Length1=input('give length of 1st pendulum : ');
Length2=input('give length of 2nd pendulum : ');
tend=input('enter the time upto which you want to see the response :');
l=Length1+Length2;
%initial condition
th10=input('give initai angle of 1st pendulam theta1(radian *pi/180) : ');
w10=input('give initai anglular velocity of 1st pendulum : ');
th20=input('give initai angle of 2nd pendulum theta2(radian *pi/180) : ');
w20=input('give initai anglular velocity of 2nd pendulum : ');
y0=[th10;w10;th20;w20];
t=[0 tend];
%solving using ode45
[tsol,ysol]=ode45(@(t,y) Function(t,y), t,y0);
th1=ysol(:,1);
w1=ysol(:,2);
w2=ysol(:,4);
th2=ysol(:,3);
%coverting theta1 and theta2 in degrees
thdeg1=th1*(180/pi); 
thdeg2=th2*(180/pi);
%deriving the end point of 2nd pendulum 
y=-(Length1*cosd(thdeg1)+Length2*cosd(thdeg2));
x=(Length1*sind(thdeg1)+Length2*sind(thdeg2));
thmin=-abs((min(th1)+min(th2))/1.2);
thmax=abs((max(th2)+max(th2))/1.2);
%two figures for graph and simulation
f1=figure('Position',[10 80 550 580]);
f2=figure('Position',[600 70 800 580]);
for i=1:length(x)
    x2(i)=x(i);
    y2(i)=y(i);
    t(i)=tsol(i);
    theta1(i)=th1(i);
    theta2(i)=th2(i);
    omega1(i)=w1(i);
    omega2(i)=w2(i);
    %graph
    figure(f1)
    %plots for Theta1 and Theta2
    subplot(211);
    plot(t,theta1,t,theta2);
    ylabel('theta');
    axis([0 t(i)+1  thmin thmax]);
    %plots for omega1 and omega2
    subplot(212);
    plot(t,omega1,t,omega2);
    ylabel('omega');
    axis([0 t(i)+1 -5 5]);
    y1(i)=-Length1*cosd(thdeg1(i));
    x1(i)=Length1*sind(thdeg1(i));
    % simulation of double pendulum
    figure(f2)
    plot(x2,y2,'g--');
    a1=line([0 x1(i)], [0 y1(i)],'LineWidth',4);
    b1=line([x1(i) x2(i)],[ y1(i) y2(i)],'LineWidth',4);
    c1=viscircles([x1(i) y1(i)],0.05);
    c2=viscircles([0 0],0.02);
    axis([-1.2*l 1.2*l -1.2*l 1.2*l]);
    pause(0.0001)
    delete(a1);
    delete(b1);
    delete(c1);
end
  figure(f1)
  subplot(211)
  legend('for 1st pendulum','for 1st pendulum');
  subplot(212)
  legend('for 1st pendulum','for 2nd pendulum');