% plots some trajectories for following ODE (dots), then
% plot isochrons (solid). AJR, Jun 2023
% Variables s=u(:,1) and c=u(:,2)
k1=1; k2=1; km1=1; e0=0.3
dudt=@(u) [ -k1*(e0-u(:,2)).*u(:,1)+km1*u(:,2) ...
            +k1*(e0-u(:,2)).*u(:,1)-(km1+k2)*u(:,2) ];

% Euler mid-point integration
eulerstep=@(u,dt) u+dt*dudt(u+(dt/2)*dudt(u));

% time 6 sufficient to get to slow manifold
t=linspace(0,6,101);
dt=t(2)-t(1);
m=24;
s=zeros(m,length(t));
c=zeros(m,length(t));

% ICs of trajectories are around a box
th=linspace(0,2*pi,m+1)';
u=[cos(th(2:end)),sin(th(2:end))];
u=[1 0]+[2 1.5].*u./max(abs(u),abs(u(:,[2 1])));
for j=1:length(t)
    s(:,j)=u(:,1); c(:,j)=u(:,2);
    u=eulerstep(u,dt);
    u(abs(u)>9)=nan;
end
finsize=norm(u)/m
% plot trajectories as black dots
clf()
%subplot(2,2,1)% gives about 79x65 mm
plot(s',c','k:')
xlabel('$s$'), ylabel('$c$')
title(['parameter $e_0=' num2str(e0) '$'])
axis equal 

% now compute and plot isochrons.  ICs on this grid
s0=linspace(-1,3,m);
c0=linspace(-1.5,1.5,m);
axis([min(s0) max(s0) min(c0) max(c0)])
[s,c]=meshgrid(s0,c0);
u=[s(:) c(:)];
for j=1:length(t)
    u=eulerstep(u,dt);
    u(abs(u)>9)=nan;
end
sFin=reshape(u(:,1),m,m);
sFinQuartiles=quantile(sFin(:),(0:4)/4)
% using contours at quantiles = each slice has approx equal area
hold on
contour(s0,c0,sFin,quantile(sFin(:),(0.5:10)/10))
colormap(0.8*jet)
hold off
% with no title, set position [? ? r r] 
% => width=15+195*r and height=12+148*r
set(gca,'Position',[0.1 0.6 0.33 0.33]) % gives about 78x64 mm
%set(gca,'Position',[0.1 0.4 0.55 0.55]) % gives about 122x96 mm
exportgraphics(gcf,[mfilename num2str(100*e0) '.pdf'] ...
              ,'ContentType','vector')
