
off echo;


write "\)
\paragraph{The invariant manifold}
These give the location of the invariant manifold in
terms of parameters~\(s_ j\).
\(";

tmp_(1):=coeffn(small*uu,e_(1,1),1)/small +order_(varepsilon^5);

tmp_(2):=coeffn(small*uu,e_(2,1),1)/small +order_(varepsilon^5);

tmp_(3):=coeffn(small*uu,e_(3,1),1)/small +order_(varepsilon^5);


write "\)
\paragraph{Invariant manifold ODEs}
The system evolves on the invariant manifold such
that the parameters evolve according to these ODEs.
\(";

tmp_s(1):=1*coeffn(gg,e_(1,1),1)+order_(varepsilon^6);


write "\)
\paragraph{Normals to isochrons at the slow manifold}
Use these vectors: to project initial conditions
onto the slow manifold; to project non-autonomous
forcing onto the slow evolution; to predict the
consequences of modifying the original system; in
uncertainty quantification to quantify effects on
the model of uncertainties in the original system.
The normal vector \(\vec z_j:=(z_{j1},\ldots,z_{jn})\)
\(";

zs_(1,1):=tmp_zz(1,1)+order_(varepsilon^6);

zs_(1,2):=tmp_zz(1,2)+order_(varepsilon^6);

zs_(1,3):=tmp_zz(1,3)+order_(varepsilon^6);

;end;
