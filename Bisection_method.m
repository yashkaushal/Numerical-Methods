%root finding algorithm


%take input equation

%enter input interval

%verify interval sign difference(proceed only if true)

%(A+b)/2 to find mid point

% check if mid point is poisitive or negative, match with interval of
% opposite sign

%start of program
clc
clear all
%str = input('Give an equation in x: ','s')  ;
   % the user types in, for instance 2*x^2-3*x+4
%x = input('Type in a value of a: ') ; 
   % the user types in, for instance, 2
%f = inline(str,'x') 
%y = feval(f,'x')
%disp(['"' str '", for a = ' num2str(x) ', equals ' num2str(y)]) ;
syms x;
g=x^3+2*x^2-3*x-1;

h = 1/(x^2+2*x-3);
j = (3*x+1-2*x^2)^(1/3);
k = (x^3+2*(x^2)-1)/3;

d3 = 4/(2*x+3);
d2 = 2*x^2+3*x-4;

a = newton(d2,0,1);
b = Regular_falsi(d2,0,1);
c = bisection(d2,0,1);
d = Secant( d2,0,1);
disp('fixed point starting point')
e = FixedPointIteration(d3,25)
f = aitkens(d3,2)


