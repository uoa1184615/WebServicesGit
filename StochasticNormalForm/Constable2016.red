% From Constable et al. (2016)
% numerators simple if b:=delta+something
bx:=by:=b;
f:=x*(bx+r*q-kappa*(x+y));
g:=y*(by+r*q-kappa*(x+y));
h:=p*x-delta*q;
equil:=solve(sub(p=0,{f,g,h}),{y,q});
jac:=mat((df(f,x),df(f,y),df(f,q))
,(df(g,x),df(g,y),df(g,q))
,(df(h,x),df(h,y),df(h,q)));
jac0:=sub((p=0).equil,jac);
mateigen(jac0,lam);

x:=xxx+x1+kappa*xxx*y1+kappa*r*xxx*y2;
y:=b/kappa-xxx-x1+(b-kappa*xxx)*y1+r*(b-kappa*xxx)*y2;
q:=0+kappa*(b-delta)*y2;

pinv:=1/tp mat((1,-1,0)
    ,(kappa*xxx,b-kappa*xxx,0)
    ,(kappa*r*xxx,r*(b-kappa*xxx),kappa*(b-delta)));

ddt:=pinv*tp mat((f,g,h));

% arbitrarily set parameters for simplicity
b:=2; delta:=kappa:=r:=1;
% change variables
clear x; operator x;
clear y;operator y;
x1:=x(1); y1:=y(1); y2:=y(2); p:=x(2); xxx:=s;


xrhs:={ddt(1,1)+(for n:=1:3 sum pinv(1,n)*w(n))
      , 0};
yrhs:={ddt(2,1)+(for n:=1:3 sum pinv(2,n)*w(n))
     , ddt(3,1)+(for n:=1:3 sum pinv(3,n)*w(n))
     };
zrhs:={};
toosmall:=3;
factor xxx,sigma,xx;
end;
