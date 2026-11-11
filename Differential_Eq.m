function [dstate,others] = Differential_Eq(t,state,paramat,b)
%%state vectors%%
Vx = state(1);
Vy = state(2);
Vz = state(3);
r = state(4);
beta = state(5);
alpha = state(6);
m = state(7);

%%parameters%%
psi0 = paramat.psi0;
phi0 = paramat.phi0;
F = paramat.F;
Vxf = paramat.Vxf;
Vyf = paramat.Vyf;
Vzf = paramat.Vzf;
rf = paramat.rf;
C = paramat.C;
miu = paramat.miu;

%%Thrust angle%%
if b ==1
dyqian= [psi0;phi0];
F_angle = control_law(state,paramat,dyqian);
end
if b > 1
dyqian=evalin('base',"dylast");
F_angle = control_law(state,paramat,dyqian);
end
psi = F_angle(1);
phi = F_angle(2);

%%Dynamics model%%
dVx = F*cos(psi)/m - miu/r^2 +(Vy^2+Vz^2)/r;
dbeta = Vy/r;
dalpha = Vz/(r*sin(beta));
dVy = F*sin(psi)*cos(phi)/m - Vx*Vy/r^2 + Vz^2/(r*tan(beta));
dVz = F*sin(psi)*sin(phi)/m - Vx*Vz/r^2 + Vy*Vz/(r*tan(beta));
dr = Vx;
dm =  -F/C;

others = [psi;phi;r*cos(beta);r*sin(beta)*cos(alpha);r*sin(beta)*sin(alpha)];

%%State eq
dstate = [dVx;dVy;dVz;dr;dbeta;dalpha;dm];

end