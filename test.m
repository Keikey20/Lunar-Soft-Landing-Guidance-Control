a = others(9,end)
Vx = state(1,61619);
Vy = state(2,61619);
Vz = state(3,61619);
r = state(4,61619);
aF = others(6,end)
wz= a + Vx/r^2 - ((Vy^2 + Vz^2)/r)/aF;
Vx/r^2