
off echo;

write "\)
\paragraph{Time dependent centre manifold coordinates}
\(";

y_(1):=y_(1) +order_(varepsilon^2,sigma_^2);

y_(2):=y_(2) +order_(varepsilon^2,sigma_^2);

x_(1):=x_(1) +order_(varepsilon^2,sigma_^2);

write "\)
\paragraph{Result centre manifold DEs}
\(";

ff(1):=ff(1) +order_(varepsilon^3,sigma_^3);

end;
