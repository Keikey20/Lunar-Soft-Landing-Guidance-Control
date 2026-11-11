%%Get parameters%%
run extractparameters.m

%%Initial parameters
r0 = 1753e3;
beta0 = 1e-10*180/pi;
alpha0 = (5*pi/180);
Vx0 = 0;
Vy0 = 1692*0.9;
Vz0 = 0;
m0 = 600;
t0 = 0;

%%Parameters matrix%%
X0 = [Vx0;Vy0;Vz0;r0;beta0;alpha0;m0];

%%Simulation time%%
time = 100;
