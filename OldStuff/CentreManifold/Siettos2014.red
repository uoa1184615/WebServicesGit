Comment Seittos 2014 Hopf bifurcation model two (22) p383
AJR, 23 Dec 2014;
alfa:=1.6;
gamma:=0.04;
kr:=1;
eta:=0.016;
mu:=0.36;
% p383: one bifurcation from equilibrium occurs at following
beta1:=20.239485;
ta1:=0.340068;
tb1:=0.021934;
tc1:=0.610850;
% write in terms of perturbations from the equilibrium
ta:=ta1+u1;
tb:=tb1+u2;
tc:=tc1+u3;
% code the ODEs
write ff_:=tp mat((
alfa*(1-ta-tb-tc)-gamma*ta-4*kr*ta*tb,
2*(beta1+small*beta)*(1-ta-tb-tc)^2-4*kr*ta*tb,
mu*(1-ta-tb-tc)-eta*tc
));
write freqm_:=mat((0.041375,-0.041375));

if 0 then begin % check the linearisation
matrix jac(3,3),tmp(3,1);
for j:=1:3 do begin
  tmp:=sub({small=0,u1=0,u2=0,u3=0},df(ff_,mkid(u,j)));
  for i:=1:3 do jac(i,j):=tmp(i,1);
end;
on complex;on rounded; print_precision 5$
write equil:=sub({small=0,u1=0,u2=0,u3=0},ff_);
off nat; write jac:=jac; on nat;
Comment matlab/octave code
jac=[- 1.7277, - 2.9603, - 1.6
  - 2.2856, - 3.5581, - 2.1978
  - 0.36, - 0.36, - 0.376]
[v,d]=eig(jac)
[z,d]=eig(jac')
;
write ii:=mat((i,0,0),(0,i,0),(0,0,i));
write v1:=(1/(jac-freqm_(1,1)*ii))*mat((1),(1),(1));
end;

% Siettos may have got the signs of i wrong in evec
write ee_:=tp mat((-0.768858,0.124863+i*0.0961375,0.599218-i*0.157988)
                 ,(-0.768858,0.124863-i*0.0961375,0.599218+i*0.157988));
% remember need cc of evecs of transpose
write zz_:=tp mat((-0.46627+i*0.18112,0.46223-i*0.14533,-0.71764)
                 ,(-0.46627-i*0.18112,0.46223+i*0.14533,-0.71764));
toosmall:=3; 
factor small,s,cis;

end;





