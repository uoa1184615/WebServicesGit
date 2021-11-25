
off echo;

write "\)
\paragraph{Time dependent normal form coordinates}
\(";

y_(1):=y_(1) +order_(varepsilon^4,sigma_^2);

x_(1):=x_(1) +order_(varepsilon^4,sigma_^2);

write "\)
\paragraph{Result normal form DEs}
\(";

gg(1):=gg(1) +order_(varepsilon^5,sigma_^3);

ff(1):=ff(1) +order_(varepsilon^5,sigma_^3);

end;
