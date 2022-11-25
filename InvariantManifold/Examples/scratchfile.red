
off echo;


write "\)
\paragraph{The invariant manifold}
These give the location of the invariant manifold in
terms of parameters~\(s\sb j\).
\(";

tmp_(1):=coeffn(small*uu,e_(1,1),1)/small +order_(varepsilon^8);

tmp_(2):=coeffn(small*uu,e_(2,1),1)/small +order_(varepsilon^8);


write "\)
\paragraph{Invariant manifold ODEs}
The system evolves on the invariant manifold such
that the parameters evolve according to these ODEs.
\(";

tmp_s(1):=1*coeffn(gg,e_(1,1),1)+order_(varepsilon^9);

tmp_s(2):=1*coeffn(gg,e_(2,1),1)+order_(varepsilon^9);

;end;
