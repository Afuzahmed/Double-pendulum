function fval=Function(t,y)
global M1 M2 Length1 Length2
fval =zeros(4,1);
g=9.810;
a=Length1*((M1/3)+M2-(3/4)*M2*(cos(y(3,1)-y(1,1)))^2); %y(1,1)=theta1, 
b=((M1/2)+M2)*g*sin(y(1,1)); %y(2,1)=theta1dot
c=(3/4)*M2*Length1*cos(y(3,1)-y(1,1))*sin(y(3,1)-y(1,1))*(y(2,1)^2);
d=(3/4)*M2*g*cos(y(3,1)-y(1,1))*sin(y(3,1));%y(3,1)=theta2
e=(1/2)*M2*Length2*sin(y(3,1)-y(1,1))*(y(4,1)^2);%y(4,1)=theta2dot
a2=Length1*cos(y(3,1)-y(1,1));
b2=Length1*sin(y(3,1)-y(1,1))*(y(2,1)^2);
c2=g*sin(y(3,1));
d2=-(3/(2*Length2));
fval(1,1)=y(2,1);
fval(3,1)=y(4,1);
fval(2,1)=(1/a)*(c+d+e-b);
fval(4,1)=d2*(a2*fval(2,1)+b2+c2);
end