% fig2 of 2503.18021v1 with mine
t=linspace(0,2);
alpha=5
gamma=1
x0=0.4
y0=1.2
x=(x0+gamma/(alpha-1)*y0)*exp(-t)+gamma*y0/(1-alpha)*exp(-alpha*t);
y=y0*exp(-alpha*t);
plot(t,x,'k' ...
    ,t,x0*exp(-t),'r' ...
    ,t,(x0+gamma/(alpha+1)*y0)*exp(-t),'b' ...
    ,t,(x0+gamma/(alpha-1)*y0)*exp(-t) ...
    )
ylim([0 0.7])
xlabel('time t'),ylabel('x')
legend('full solution','orthogonal proj','global error min','large time match')
r=5; set(gcf,'position',[300 100 60*r 45*r])
exportgraphics(gcf,'fig2.pdf')
