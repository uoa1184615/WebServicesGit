Comment Chen Chen's problem in four variables
16 Dec 2014;
thiscase:=5;

if thiscase=5 then begin % the five system
write ff_:=tp mat((
u4*u5+u3-u4,
u3*u5-u3+u4,
(u3*u5-u4*u5)/6+u1/6-u2/6+u3/6+u4/6-u1^2/2,
(u3*u5-u4*u5)/6-u1/6+u2/6-u3/6-u4/6+u2^2/2,
0));
write freqm_:=mat((0,0,0,2/3*i,-2/3*i));
write ee_:=tp mat((1,1,0,0,0),(-1,1,1,1,0), (0,0,0,0,1), (-1.5,4.5,1,-3,0), (4.5,-1.5,3,-1,0));
write zz_:=tp mat((1/2,1/2,0,0,0), (0,0,1/2,1/2,0), (0,0,0,0,1), (1,-1,-1,3,0), (1,-1,3,-1,0));
end;

if thiscase=2 then begin % the four system
write ff_:=tp mat((
u3,
u4,
u1/6-u2/6+u3/3-u1^2/2,
-u1/6+u2/6-u4/3+u2^2/2
));
write freqm_:=mat((0,0,-2/3*i,2/3*i));
write ee_:=tp mat((1,1,0,0),(-1,1,1,1),(-1,1,1/3,-1),(-1,1,-1,1/3));
write zz_:=tp mat((1/2,1/2,0,0),(0,0,1/2,1/2),(-1,1,1,-3),(-1,1,-3,1));
end;
if thiscase=4 then begin % the four system
write ff_:=tp mat((
u3,
u4,
u1/6-u2/6+u3/3-u1^2/2,
-u1/6+u2/6-u4/3+u2^2/2
));
write freqm_:=mat((0,0,2/3*i,-2/3*i));
write ee_:=tp mat((1,1,0,0),(-1,1,1,1),(-1.5,4.5,1,-3),(4.5,-1.5,3,-1));
write zz_:=tp mat((1/2,1/2,0,0),(0,0,1/2,1/2),(1,-1,-1,3),(1,-1,3,-1));
end;
if thiscase=3 then begin % the stable-slow system
write ff_:=tp mat((
u3,
u4,
u1/6-u2/6+u3/3-u1^2/2,
-u1/6+u2/6-u4/3+u2^2/2
));
write freqm_:=mat((0,0,2/3*i));
write ee_:=tp mat((1,1,0,0),(-1,1,1,1),(-1.5,4.5,1,-3));
write zz_:=tp mat((1/2,1/2,0,0),(0,0,1/2,1/2),(1,-1,-1,3));
end;
toosmall:=3; 
factor small,s,cis;

end;





