%%Impulse parameters%%
F = 1500;
Isp = 300;
gE = 9.8;
C = Isp*gE;

%%Moon parameters%%
miu = 4.88775e12;
RL = 1738e3;

%%Terminal parameters%%
rf = 1740e3;
Vxf = 0;
Vyf = 0;
Vzf = 0;

%%Initial control angle%%
psi0 = 90*pi/180;
phi0 = 0*pi/180;

%%data storage%%
paramat = struct('F',F,'Isp',Isp,'gE',gE,'C',C,'miu',miu,'RL',RL,'rf',rf,'Vxf',Vxf,'Vyf',Vyf,'Vzf',Vzf,'psi0',psi0,'phi0',phi0);
save(fullfile(tempdir,'paramat.mat'),'paramat');
