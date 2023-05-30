
off echo;

write "\)
\paragraph{Time dependent normal form coordinates}
\(";

z_(1):=z_(1) +order_(varepsilon^3,sigma_^2);

y_(1):=y_(1) +order_(varepsilon^3,sigma_^2);

x_(1):=x_(1) +order_(varepsilon^3,sigma_^2);

write "\)
\paragraph{Result normal form DEs}
\(";

hh(1):=hh(1) +order_(varepsilon^4,sigma_^3);

gg(1):=gg(1) +order_(varepsilon^4,sigma_^3);

ff(1):=ff(1) +order_(varepsilon^4,sigma_^3);

end;
