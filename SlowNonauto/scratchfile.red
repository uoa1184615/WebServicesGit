
off echo;

write "\)
\paragraph{Time dependent slow manifold parametrisation}
\(";

u_1:=u_(1,1) +order_(varepsilon^2,sigma_^2);

u_2:=u_(2,1) +order_(varepsilon^2,sigma_^2);

write "\)
\paragraph{Result slow manifold DEs}
\(";

ff(1):=ff(1) +order_(varepsilon^3,sigma_^3);

end;
