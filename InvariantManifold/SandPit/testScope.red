Comment procedure to test local versus global variables in
Reduce.  AJR Apr 2021;
procedure z(y); begin
  scalar aa,bbb;
  a:=globalval*y;                 % global   
  aa:=localval*y^2;               % local
  matrix bb(3,3); % matrix and scalar bb is invalid
  b:=mat((1,y),(y^2,y^3));        % global
  bb:=y*mat((1,y),(y^2,y^3));     % global
  bbb:=y^2*mat((1,y),(y^2,y^3));  % local
  array c(2);    % array and scalar cc is invalid
  c(2):=y^2;                      % global
  cc(2,2):=y^3;                   % becomes global operator rule
  operator dd;   % operator and scalar dd is invalid
  let dd(~x)=>x^2;
  return dd(y);
end;

zresult:=z(yy);
a_:=a; aa_:=aa;
b_:=b; bb_:=bb; bbb_:=bbb;
c2_:=c(2); cc22_:=cc(2,2);
ddy_:=dd(yy);
end;
