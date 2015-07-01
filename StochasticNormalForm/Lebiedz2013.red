% Lebiedz2013  eps=1/100
%\dot x=-x+(x+\rat12)y+u(t) 
%\epsilon\dot y=x-(x+1)y\,.

xrhs:={ -x(1)++(x(1)+1/2)*y(1)+w(1) };
yrhs:={-100*y(1)+100*x(1)*(1-y(1)) };
zrhs:={};
toosmall:=3;
factor sigma,small;
end;
