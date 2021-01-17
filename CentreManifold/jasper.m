% Jasper ?? et al. 2017. A normal form of steady
% solutions to Swift-Hohenberg in 1D
L=[0 1 0 0
0 0 1 0
0 0 0 1
-1 0 -2 0]
[v,d]=eig(L)
j=find(abs(diag(d)-1i)<1e-7)
v1=v(:,j(1))/v(1,j(1))
v2=null([L-1i*eye(4) v1;v1' 0],1e-8); v2(abs(v2)<1e-9)=0;
v2=v2(1:end-1)/v2(end)
% check
vv=[v1 v2 conj(v1) conj(v2)]
dd=vv\(L*vv); dd(abs(dd)<1e-9)=0

[v,d]=eig(L')
j=find(abs(diag(d)+1i)<1e-7)
z2=v(:,j(1))/v(1,j(1))
z1=null([L'+1i*eye(4) z2;z2' 0],1e-8); 
z1=z1(1:end-1)/z1(end)
% check
zz=[z1 z2 conj(z1) conj(z2)]
ff=zz\(L'*zz); ff(abs(ff)<1e-9)=0

