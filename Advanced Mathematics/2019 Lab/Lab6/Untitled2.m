syms t
Ta=-sqrt(3)*csch(sqrt(3)*t)^2*[(6*coth(sqrt(3)*t)*cos(t))/sqrt((coth(sqrt(3)*t)^2-1)*(3/4));
                              (6*coth(sqrt(3)*t)*sin(t))/sqrt((coth(sqrt(3)*t)^2-1)*(3/4));
                              4 ]
Tc=[-4*sqrt(3)*sin(t)*sqrt((coth(sqrt(3)*t)^2-1));
    4*sqrt(3)*cos(t)*sqrt((coth(sqrt(3)*t)^2-1));
    0]
T=Ta+Tc
T=T'
T*T'
g=sqrt(T*T')
s=int(g,0,1)
