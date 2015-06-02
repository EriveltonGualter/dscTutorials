function [ddx,ddq] = autoGen_cartPoleDynamics(q,dq,F,T,m1,m2,g,l)
%AUTOGEN_CARTPOLEDYNAMICS
%    [DDX,DDQ] = AUTOGEN_CARTPOLEDYNAMICS(Q,DQ,F,T,M1,M2,G,L)

%    This function was generated by the Symbolic Math Toolbox version 6.2.
%    27-May-2015 01:06:02

t2 = cos(q);
t3 = sin(q);
t4 = t2.^2;
t5 = m1+m2-m2.*t4;
t6 = 1.0./t5;
t7 = dq.^2;
t8 = l.^2;
ddx = (t6.*(F.*l-T.*t2+m2.*t3.*t7.*t8+g.*l.*m2.*t2.*t3))./l;
if nargout > 1
    t9 = m2.^2;
    ddq = -(1.0./l.^2.*t6.*(-T.*m1-T.*m2+g.*l.*t3.*t9+F.*l.*m2.*t2+g.*l.*m1.*m2.*t3+t2.*t3.*t7.*t8.*t9))./m2;
end
