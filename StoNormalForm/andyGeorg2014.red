xrhs:={small*(x(1)-x(1)^3)+a*y(1)};
yrhs:={-y(1)-y(1)^2*df(y(1),t)+(1+small*y(1)^2)*w(1)};
zrhs:={};
toosmall:=4;
end;
