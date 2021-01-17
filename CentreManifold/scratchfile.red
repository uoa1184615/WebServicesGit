
write "\)
\paragraph{The Slow
manifold}


These give the location of the invariant manifold in
terms of parameters~\(s\sb j\).
\(";

tmp(1):=coeffn(small*uu_,e_(1,1),1)/small;

tmp(2):=coeffn(small*uu_,e_(2,1),1)/small;

write "\)
\paragraph{Slow
manifold ODEs}


The system evolves on the invariant manifold such
that the parameters evolve according to these ODEs.
\(";

tmps(1):=1*coeffn(gg_,e_(1,1),1);


write "\)
\paragraph{Normals to isochrons at the slow manifold}
Use these vectors: to project initial conditions
onto the slow manifold; to project non-autonomous
forcing onto the slow evolution; to predict the
consequences of modifying the original system; in
uncertainty quantification to quantify effects on
the model of uncertainties in the original system.
The normal vector \(\vec z\sb j:=(z\sb{j1},\ldots,z\sb{jn}\
)\)
\(";

tmpzz(1,1):=tmpzz(1,1);

tmpzz(1,2):=tmpzz(1,2);

end;
