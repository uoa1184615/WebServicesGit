procedure exampleslowman;  
    invariantmanifold(
    mat((-u1+u2-u1^2,u1-u2+u2^2)),
    mat((0)),
    mat((1,1)),
    mat((1,1)),
    5)$

operator u1,u2,u3,u4,u5,u6,u7,u8,u9;

operator invariantmanifold;
for all odefns, evals, evecs, adjvecs, toosmall let
  invariantmanifold(odefns, evals, evecs, adjvecs, toosmall) 
  = begin 

scalar ff, evalm, ee, zz, maxiter, ff0, trace, ll, uvec,
reslin, ok, rhsjact, jacadj, resd, resde, resz, rhsfn, zs,
pp, est, eyem;

write "Construct an invariant manifold (version 8 Apr 2021)"$

ff := tp odefns;
ee := tp evecs;
zz := tp adjvecs; 

maxiter:=29$
factor small; 

trace:=0$


on div; off allfac; on revpri; 
on rationalize;

operator e_;
noncom e_;
factor e_;
let { e_(~j,~k)*e_(~l,~m)=>0 when k neq l
    , e_(~j,~k)*e_(~l,~m)=>e_(j,m) when k=l 
    , e_(~j,~k)^2=>0 when j neq k
    , e_(~j,j)^2=>e_(j,j) };

operator tpe_; linear tpe_;
let tpe_(e_(~i,~j),e_)=>e_(j,i);

write "total no. of variables ",
n:=part(length(ee),1);
write "no. of invariant modes ",
m:=part(length(ee),2);
if {length(evals),length(zz),length(ee),length(ff)}
  ={{1,m},{n,m},{n,m},{n,1}} 
  then write "Input dimensions are OK" 
  else <<write "INCONSISTENT INPUT DIMENSIONS, I EXIT"; 
      return>>;

if n>9 then <<write "SORRY, MAX NUMBER ODEs IS 9, I EXIT"; 
    return>>;

eyem:=for j:=1:m sum e_(j,j)$

clear exp; operator exp;
let { df(exp(~u),t) => df(u,t)*exp(u)
    , exp(~u)*exp(~v) => exp(u+v)
    , exp(~u)^~p => exp(p*u)
    };

procedure conj_(a)$ sub(i=-i,a)$

array eval_(m);
for j:=1:m do eval_(j):=evals(1,j);

matrix aa_(m,m),dexp_(m,m),cexp_(m,m);
for j:=1:m do dexp_(j,j):=exp(eval_(j)*t);
for j:=1:m do cexp_(j,j):=exp(-conj_(eval_(j))*t); 
aa_:=(tp map(conj_(~b),ee*dexp_)*zz*cexp_ )$
if trace then write aa_:=aa_;
write "Normalising the left-eigenvectors:";
aa_:=(aa_ where {exp(0)=>1, exp(~a)=>0 when a neq 0})$
if trace then write aa_:=aa_;
if det(aa_)=0 then << write
    "ORTHOGONALITY ERROR IN EIGENVECTORS; I EXIT"; 
    return>>;
zz:=zz*aa_^(-1);

operator d_; linear d_;
let { d_(~a^~p,t,~dt)=>d_(a,t,dt)^p
    , d_(~a*~b,t,~dt)=>d_(a,t,dt)*d_(b,t,dt)
    , d_(exp(~a),t,~dt)=>exp(a)
        *sub(t=-dt,cos(-i*a)+i*sin(-i*a))
    , df(d_(~a,t,~dt),~b)=>d_(df(a,b),t,dt)
    , d_(~a,t,0)=>a
    , d_(d_(~a,t,~dta),t,~dtb)=>d_(a,t,dta+dtb)
    };

somerules:={}$
depend u1,t; somerules:=(u1(~dt)=d_(u1,t,dt)).somerules$
depend u2,t; somerules:=(u2(~dt)=d_(u2,t,dt)).somerules$
depend u3,t; somerules:=(u3(~dt)=d_(u3,t,dt)).somerules$
depend u4,t; somerules:=(u4(~dt)=d_(u4,t,dt)).somerules$
depend u5,t; somerules:=(u5(~dt)=d_(u5,t,dt)).somerules$
depend u6,t; somerules:=(u6(~dt)=d_(u6,t,dt)).somerules$
depend u7,t; somerules:=(u7(~dt)=d_(u7,t,dt)).somerules$
depend u8,t; somerules:=(u8(~dt)=d_(u8,t,dt)).somerules$
depend u9,t; somerules:=(u9(~dt)=d_(u9,t,dt)).somerules$
ff:=(ff where somerules)$

ll:=ee*(tp ee)*0; 
uzero:=(for k:=1:n collect (mkid(u,k)=0))$
equilibrium:=(small=0).uzero$
for j:=1:n do for k:=1:n do begin 
  ll(j,k):=df(ff(j,1),mkid(u,k));
  ll(j,k):=sub(equilibrium,ll(j,k));
end;
write "Find the linear operator is";
write ll:=ll;

uvec:=0*ff; 
for j:=1:n do uvec(j,1):=mkid(u,j);

write "Check invariant subspace linearisation ";
for j:=1:m do for k:=1:m do aa_(j,k):=0;
for j:=1:m do aa_(j,j):=eval_(j);

reslin:=(ll*(ee*dexp_)-(ee*dexp_)*aa_
    where exp(~a)*d_(1,t,~dt)=>sub(t=-dt,cos(-i*a)+i*sin(-i*a))*exp(a) )$ 
if trace then write reslin:=reslin;
ok:=1$
for j:=1:n do for k:=1:m do 
    ok:=if reslin(j,k)=0 then ok else 0$
if ok then write "Linearisation is OK";

if not ok then for iter:=1:2 do begin
write "WARNING: I NEED TO ADJUST LINEAR OPERATOR";
write
lladj:=reslin*tp map(conj_(~b),zz*cexp_);
write
lladj:=(lladj where {exp(0)=>1, exp(~a)=>0 when a neq 0});
write
ll:=ll-lladj;

write
reslin:=(ll*(ee*dexp_)-(ee*dexp_)*aa_
    where exp(~a)*d_(1,t,~dt)=>sub(t=-dt,cos(-i*a)+i*sin(-i*a))*exp(a) ); 
ok:=1$
for j:=1:n do for k:=1:m do 
    ok:=if reslin(j,k)=0 then ok else 0$
if ok then iter:=iter+1000;
end;
if not ok then << write
    "OOPS, INCONSISTENT EIGENVALUES, EIGENVECTORS AND OPERATOR.
    EMAIL ME; I EXIT"; 
    return >>;

somerules:=for j:=1:n collect 
  (d_(1,t,~dt)*mkid(u,j)=d_(mkid(u,j),t,dt))$
ll0_:=(ll*uvec where somerules)$
ff:=(if 1 then small*ff
           else ff-(1-small)*sub(small=0,ff)) 
    +(1-small)*ll0_$

ff0:=(ff where uzero)$
ff:=ff+(exp(0)-1)*ff0$

rhsfn:=for i:=1:n sum e_(i,1)*ff(i,1)$

rhsjact:=for i:=1:n sum for j:=1:n sum 
    e_(j,i)*df(ff(i,1),mkid(u,j))$

array eval_s(m),modes_(m); 
neval:=0$ eval_set:={}$ 
for j:=1:m do if not(eval_(j) member eval_set) then begin
  neval:=neval+1; 
  eval_s(neval):=eval_(j);
  eval_set:=eval_(j).eval_set;
  modes_(neval):=for k:=j:m join 
    if eval_(j)=eval_(k) then {k} else {};
end;

itisSlowMan_:=if eval_set={0} then 1 else 0$
if trace then write itisSlowMan_:=itisSlowMan_;

eval_s(0):=geneval$
modes_(0):={}$

matrix llzz_(n+m,n+m);
array l_invs(neval),g_invs(neval);
array l1_invs(neval),g1_invs(neval),l2_invs(neval),g2_invs(neval);
operator sp_; linear sp_;
for k:=0:neval do begin
  if trace then write "ITERATION ",k:=k; 

  for ii:=1:n do for jj:=1:n do llzz_(ii,jj):=(
      -sub(small=0,ll(ii,jj)) where d_(1,t,~dt)
      => cos(i*eval_s(k)*dt)+i*sin(i*eval_s(k)*dt));

  for j:=1:n do llzz_(j,j):=eval_s(k)+llzz_(j,j);

  for j:=1:length(modes_(k)) do 
    for ii:=1:n do llzz_(ii,n+j):=ee(ii,part(modes_(k),j))
     +(for jj:=1:n sum 
       sp_(ll(ii,jj)*ee(jj,part(modes_(k),j)),d_)
       where { sp_(1,d_)=>0
             , sp_(d_(1,t,~dt),d_)=>dt*(
               cos(i*eval_s(k)*dt)+i*sin(i*eval_s(k)*dt))
             });

  for ii:=1:length(modes_(k)) do for j:=1:n do 
      llzz_(n+ii,j):=conj_(zz(j,part(modes_(k),ii)));
  if trace then write "finished Force the updates to be orthogonal";

  for i:=1:length(modes_(k)) do 
    for j:=1:m do llzz_(n+i,n+j):=0;

  for i:=length(modes_(k))+1:m do begin 
    for j:=1:n+i-1 do llzz_(n+i,j):=llzz_(j,n+i):=0;
    llzz_(n+i,n+i):=1;
  end;
  if trace then write "finished Add some trivial rows and columns";

  if trace then write llzz_:=llzz_; 
  llzz_:=llzz_^(-1);
  if trace then write llzz_:=llzz_;
  l_invs(k):=for i:=1:n sum for j:=1:n sum e_(i,j)*llzz_(i,j);
  g_invs(k):=for i:=1:length(modes_(k)) sum 
    for j:=1:n sum e_(part(modes_(k),i),j)*llzz_(i+n,j);
if trace then write "finished Invert the matrix and unpack";

  l1_invs(k) := for ii:=1:n sum for j:=1:n sum 
      e_(ii,j)*conj_(llzz_(j,ii));
  l2_invs(k) := for ii:=1:n sum 
      for j:=1:length(modes_(k)) sum 
          e_(ii,part(modes_(k),j))*conj_(llzz_(j+n,ii));
  g1_invs(k) := for ii:=1:length(modes_(k)) sum 
      for j:=1:n sum 
          e_(part(modes_(k),ii),j)*conj_(llzz_(j,ii+n));
  g2_invs(k) := for ii:=1:length(modes_(k)) sum 
      for j:=1:length(modes_(k)) sum 
          e_(part(modes_(k),ii),part(modes_(k),j))
          *conj_(llzz_(j+n,ii+n));
  if trace then write "finished Unpack the conjugate transpose";
end;

operator l_inv; linear l_inv;
let l_inv(e_(~j,~k)*exp(~a),exp)=>l_invproc(a/t)*e_(j,k);
procedure l_invproc(a);
  if a member eval_set
  then << k:=0; 
    repeat k:=k+1 until a=eval_s(k);
    l_invs(k)*exp(a*t) >>
  else sub(geneval=a,l_invs(0))*exp(a*t)$

operator g_inv; linear g_inv;
let g_inv(e_(~j,~k)*exp(~a),exp)=>ginv_proc(a/t)*e_(j,k);
procedure ginv_proc(a); 
  if a member eval_set
  then << k:=0; 
    repeat k:=k+1 until a=eval_s(k);
    g_invs(k) >>
  else sub(geneval=a,g_invs(0))$

procedure inv_proc(a,invs);
  if a member eval_set
  then << k:=0; 
    repeat k:=k+1 until a=eval_s(k);
    invs(k)*exp(a*t) >>
  else sub(geneval=a,invs(0))*exp(a*t)$

operator l1_inv; linear l1_inv;
operator l2_inv; linear l2_inv;
operator g1_inv; linear g1_inv;
operator g2_inv; linear g2_inv;
let { l1_inv(e_(~j,~k)*exp(~a),exp)
      => inv_proc(a/t,l1_invs)*e_(j,k)
    , l2_inv(e_(~j,~k)*exp(~a),exp)
      => inv_proc(a/t,l2_invs)*e_(j,k)
    , g1_inv(e_(~j,~k)*exp(~a),exp)
      => inv_proc(a/t,g1_invs)*e_(j,k)
    , g2_inv(e_(~j,~k)*exp(~a),exp)
      => inv_proc(a/t,g2_invs)*e_(j,k)
    };


write "Analyse ODE/DDE system du/dt = ",ff;

clear gg_;
operator s; depend s,t;
let df(s(~j),t)=>coeffn(gg_,e_(j,1),1);

procedure manifold_(uu);
    for j:=1:n collect mkid(u,j)=coeffn(uu,e_(j,1),1)$

uu_:=for j:=1:m sum s(j)*exp(eval_(j)*t)
  *(for k:=1:n sum e_(k,1)*ee(k,j))$
gg_:=0$
if trace then write uu_:=uu_;

procedure matify(a,m,n)$
  begin matrix z(m,n);
    for i:=1:m do for j:=1:n do z(i,j):=coeffn(a,e_(i,j),1);
    return (z where {exp(0)=>1,small=>s}); 
    end$

zs:=for j:=1:m sum exp(eval_(j)*t)
  *(for k:=1:n sum e_(k,j)*zz(k,j))$
pp:=0$

let d_(s(~k),t,~dt)=>s(k)+(for n:=1:toosmall sum 
        (-dt)^n*df(s(k),t,n)/factorial(n));

for j:=toosmall:toosmall do let small^j=>0;

write "Start iterative construction of invariant manifold";
for iter:=1:maxiter do begin
if trace then write "
ITERATION = ",iter,"
-------------";

resde:=-df(uu_,t)+sub(manifold_(uu_),rhsfn);
if trace then write "resde=",matify(resde,n,1);

est:=tpe_(for j:=1:m sum df(uu_,s(j))*e_(1,j),e_);
est:=conj_(est);
if trace then write "est=",matify(est,m,n);

if itisSlowMan_ then begin
    jacadj:=conj_(sub(manifold_(uu_),rhsjact));
    if trace then write "jacadj=",matify(jacadj,n,n);
    resd:=df(zs,t)+jacadj*zs+zs*pp;
    if trace then write "resd=",matify(resd,n,m);

    resz:=est*zs-eyem*exp(0);
    if trace then write "resz=",matify(resz,m,m);
end else resd:=resz:=0; 

write lengthRes:=map(length(~a),{resde,resd,resz});

uu_:=uu_+l_inv(resde,exp);
gg_:=gg_+g_inv(resde,exp);
if trace then write "gg=",matify(gg_,m,1);
if trace then write "uu=",matify(uu_,n,1);

if itisSlowMan_ then begin
zs:=zs+l1_inv(resd,exp)-l2_inv(resz,exp);
pp:=pp-g1_inv(resd,exp)+youshouldnotseethis*g2_inv(resz,exp);
if trace then write "zs=",matify(zs,n,m);
if trace then write "pp=",matify(pp,m,m);
end;

showtime;
if {resde,resd,resz}={0,0,0} then write iter:=iter+10000;
end;

if {resde,resd,resz}={0,0,0} 
  then write "SUCCESS: converged to an expansion"
  else <<write "FAILED TO CONVERGE; I EXIT";
    return; >>;

let exp(0)=>1;

write "The invariant manifold is (to one order lower)";
for j:=1:n do write "u",j," = ",
  coeffn(small*uu_,e_(j,1),1)/small;
write "The evolution of the real/complex amplitudes";
for j:=1:m do write "ds(",j,")/dt = ",
  coeffn(gg_,e_(j,1),1);

if itisSlowMan_ then begin
  write "The normals to the isochrons at the slow manifold.
Use these vectors: to project initial conditions
onto the slow manifold; to project non-autonomous
forcing onto the slow evolution; to predict the
consequences of modifying the original system; in
uncertainty quantification to quantify effects on
the model of uncertainties in the original system.";
  for j:=1:m do write "z",j," = ",
    for i:=1:n collect coeffn(zs,e_(i,j),1);
end;

if length(gg_)>30 then begin
on rounded; print_precision 4$
write "Numerically, the invariant manifold is (to one order lower)";
for j:=1:n do write "u",j," = ",
  coeffn(small*uu_,e_(j,1),1)/small;
write "Numerically, the evolution of the real/complex amplitudes";
for j:=1:m do write "ds(",j,")/dt = ",
  coeffn(gg_,e_(j,1),1);
if itisSlowMan_ then begin
  write "Numerically, normals to isochrons at slow manifold.";
  for j:=1:m do write "z",j," = ",
    for i:=1:n collect coeffn(zs,e_(i,j),1);
end;
off rounded;
end;

return Finished_constructing_invariant_manifold_of_system$ 
end$

end;