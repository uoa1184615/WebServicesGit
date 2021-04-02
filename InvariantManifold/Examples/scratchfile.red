
off echo;


write "\)
\paragraph{The invariant manifold}
These give the location of the invariant manifold in
terms of parameters~\(s\sb j\).
\(";

tmp_(1):=coeffn(small*uu_,e_(1,1),1)/small;

tmp_(2):=coeffn(small*uu_,e_(2,1),1)/small;

tmp_(3):=coeffn(small*uu_,e_(3,1),1)/small;


write "\)
\paragraph{Invariant manifold ODEs}
The system evolves on the invariant manifold such
that the parameters evolve according to these ODEs.
\(";

tmp_s(1):=1*coeffn(gg_,e_(1,1),1);

tmp_s(2):=1*coeffn(gg_,e_(2,1),1);

end;
