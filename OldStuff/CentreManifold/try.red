ff_:=tp mat((
u4*u5+u3-u4,
u3*u5-u3+u4,
(u3*u5-u4*u5)/6+u1/6-u2/6+u3/6+u4/6-delta*u1^2/2,
(u3*u5-u4*u5)/6-u1/6+u2/6-u3/6-u4/6+delta*u2^2/2,
0));
aaa:=sqrt(2/3); aab:=-2; aac:=aaa;
freqm_:=mat((0,0,aaa*i,-aaa*i));
ee_:=tp mat((1,1,0,0,0),(-1,1,1,1,0)
,(aab,-aab,aac,-aac,0)
,(aab,-aab,-aac,aac,0)
);
zz_:=tp mat((1/2,1/2,0,0,0),(0,0,1/2,1/2,0)
,(1,-1,1-3*aaa,1+3*aaa,0)
,(1,-1,1+3*aaa,1-3*aaa,0) 
);
toosmall:=3;
factor small;
let {delta^3=>0};
maxiter_:=2;
end;