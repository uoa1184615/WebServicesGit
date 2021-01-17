% Glizer et al. 2017.
% algorithm fails to converge when decay is -u2(1) in u2 eqn
ff_:=tp mat((
small*(-2*(xx+u1)+3*u2)
,-u2+small*(8*(xx+u1)+2*u2)
));
evalm_:=mat((0));
ee_:=tp mat((1,0)
);
zz_:=tp mat((1,0) 
);
toosmall:=3;
factor small;
maxiter_:=4;
trace_:=1;
end;