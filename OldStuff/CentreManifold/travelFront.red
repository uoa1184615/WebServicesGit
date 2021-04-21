Comment variant of Sanjeeva's travelling front with delay:
First is small u case, whereas second is small v:=1-u . This
is delay in x whereas we want delay in time, by 2*epsilon
say, so make delay -2*c*epsilon in x. ;
if 1 then begin % find unstable manifold
ff_:=tp mat((u2,
  -c*u2+u1*(u1-1)*(u1(-2*c*epsilon)/2-1/4-c/2-alpha*small)
  ));
freqm_:=mat((-i/2));
ee_:=tp mat((1,1/2));
zz_:=tp mat((c+1/2,1));
end else begin % find stable manifold
ff_:=tp mat((u2,
  -c*u2+u1*(u1-1)*(u1(-2*c*epsilon)/2-1/4+c/2+alpha*small)
  ));
freqm_:=mat((+i/2));
ee_:=tp mat((1,-1/2));
zz_:=tp mat((c-1/2,1));
end;
toosmall:=3; 
factor small,s,cis;
on gcd;
end;
