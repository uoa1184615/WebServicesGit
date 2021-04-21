% check Four State Markov, the CA agrees, Aug 2014
format short
s=100, ss=s^2
a0=[0 1 0 0;0 -1 0 0;0 0 -1 0; 0 0 1 0]
b=[-1 0 0 0;1 -1 1 0;0 1 -1 1;0 0 0 -1]
a=a0+b/ss
[v,d]=eig(a);
j=find(abs(diag(d))<0.1)
z0=[0 0 1 1;1 1 0 0]
e=v(:,j)/(z0*v(:,j))
g=e\(a*e)

[v,d]=eig(a')
j=find(abs(diag(d))<0.1)
z=v(:,j)/(e'*v(:,j))
id=e'*z

e0=round(s*e)/s
e=ss*(e-e0);
e1=round(s*e)/s
e=ss*(e-e1);
e2=round(s*e)/s
e=ss*(e-e2);
e3=round(round(s*e)/s)
z0=round(s*z)/s
z=ss*(z-z0);
z1=round(s*z)/s
z=ss*(z-z1);
z2=round(s*z)/s
z=ss*(z-z2);
z3=round(round(s*z)/s)
