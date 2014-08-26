

write "\)
\paragraph{The centre manifold}
These give the location of the centre manifold in
terms of parameters~\(s\sb j\).
\(";

tmp(1):=coeffn(small*uu_,e_(1,1),1)/small;

tmp(2):=coeffn(small*uu_,e_(2,1),1)/small;

tmp(3):=coeffn(small*uu_,e_(3,1),1)/small;

tmp(4):=coeffn(small*uu_,e_(4,1),1)/small;

tmp(5):=coeffn(small*uu_,e_(5,1),1)/small;


write "\)
\paragraph{Centre manifold ODEs}
The system evolves on the centre manifold such
that the parameters evolve according to these ODEs.
\(";

tmps(1):=1*coeffn(gg_,e_(1,1),1);

tmps(2):=1*coeffn(gg_,e_(2,1),1);

tmps(3):=1*coeffn(gg_,e_(3,1),1);


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

tmpzz(1,3):=tmpzz(1,3);

tmpzz(1,4):=tmpzz(1,4);

tmpzz(1,5):=tmpzz(1,5);

tmpzz(2,1):=tmpzz(2,1);

tmpzz(2,2):=tmpzz(2,2);

tmpzz(2,3):=tmpzz(2,3);

tmpzz(2,4):=tmpzz(2,4);

tmpzz(2,5):=tmpzz(2,5);

tmpzz(3,1):=tmpzz(3,1);

tmpzz(3,2):=tmpzz(3,2);

tmpzz(3,3):=tmpzz(3,3);

tmpzz(3,4):=tmpzz(3,4);

tmpzz(3,5):=tmpzz(3,5);

end;
