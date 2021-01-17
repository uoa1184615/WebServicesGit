% Jasper ?? et al. 2017. A normal form of steady
% solutions to Swift-Hohenberg in 1D.  
% AJR May 2017
ff_:=tp mat((u2,u3,u4
,-u1-2*u3
));
ff_:=tp mat(((3*u2+u4-gamma*small*(u2+u4))/2
,(-u1+u3+gamma*small*(u1+u3))/2
,(-u2+u4+gamma*small*(u2+u4))/2
,(-u1-3*u3-gamma*small*(u1+u3))/2+small^2*(mu*u1-u1^3)
));
evalm_:=mat((i,i,-i,-i));
ee_:=tp mat((1,i,-1,-i),(-3*i,1,-i,3)
,(1,-i,-1,i),(3*i,1,i,3));
zz_:=tp mat((1/8,3*i/8,-3/8,-i/8),(-i/8,1/8,-i/8,1/8)
,(1/8,-3*i/8,-3/8,i/8),(i/8,1/8,i/8,1/8));
toosmall:=4;
factor small,mu,gamma;
%maxiter_:=4;
%trace_:=1;
end;