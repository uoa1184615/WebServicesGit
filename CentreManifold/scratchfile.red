
write "\)
\paragraph{The Centre
manifold}


These give the location of the invariant manifold in
terms of parameters~\(s\sb j\).
\(";

tmp(1):=coeffn(small*uu_,e_(1,1),1)/small;

tmp(2):=coeffn(small*uu_,e_(2,1),1)/small;

tmp(3):=coeffn(small*uu_,e_(3,1),1)/small;

tmp(4):=coeffn(small*uu_,e_(4,1),1)/small;

write "\)
\paragraph{Centre
manifold ODEs}


The system evolves on the invariant manifold such
that the parameters evolve according to these ODEs.
\(";

tmps(1):=1*coeffn(gg_,e_(1,1),1);

tmps(2):=1*coeffn(gg_,e_(2,1),1);

tmps(3):=1*coeffn(gg_,e_(3,1),1);

tmps(4):=1*coeffn(gg_,e_(4,1),1);

end;
