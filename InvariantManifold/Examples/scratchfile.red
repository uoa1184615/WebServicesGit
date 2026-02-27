
off echo;


write "\)
\paragraph{The invariant manifold}
These give the location of the invariant manifold in
terms of parameters~\(s_ j\).
\(";

tmp_(1):=coeffn(small*uu,e_(1,1),1)/small +order_(varepsilon^4);

tmp_(2):=coeffn(small*uu,e_(2,1),1)/small +order_(varepsilon^4);

tmp_(3):=coeffn(small*uu,e_(3,1),1)/small +order_(varepsilon^4);

tmp_(4):=coeffn(small*uu,e_(4,1),1)/small +order_(varepsilon^4);


write "\)
\paragraph{Invariant manifold ODEs}
The system evolves on the invariant manifold such
that the parameters evolve according to these ODEs.
\(";

tmp_s(1):=1*coeffn(gg,e_(1,1),1)+order_(varepsilon^5);

tmp_s(2):=1*coeffn(gg,e_(2,1),1)+order_(varepsilon^5);

;end;
