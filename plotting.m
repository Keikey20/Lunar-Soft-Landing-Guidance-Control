clc;
close all;
clear;

%% Load simulation data
load state.mat
load others.mat
load t.mat

% Unpack state variables
Vx = state(1,:);
Vy = state(2,:);
Vz = state(3,:);
r = state(4,:);
m = state(7,:);

% Unpack others
psi = others(1,:);
phi = others(2,:);
x = others(3,:);
y = others(4,:);
z = others(5,:);

%% Figure 1: Velocities over Time
figure(1);
plot(t, Vx, 'r', t, Vy, 'b', t, Vz, 'g', 'LineWidth', 1.5);
xlabel('Time (s)');
ylabel('Velocity (m/s)');
legend('Vx','Vy','Vz');
title('Velocity Components over Time');
grid on;

%% Figure 2: 3D Trajectory
figure(2);
plot3(y/1000, z/1000, x/1000, 'k', 'LineWidth', 2);
hold on;
scatter3(y(1)/1000, z(1)/1000, x(1)/1000, 50, 'r', 'filled');
scatter3(y(end)/1000, z(end)/1000, x(end)/1000, 50, 'b', 'filled');
xlabel('Y (km)'); ylabel('Z (km)'); zlabel('X (km)');
title('3D Trajectory of Lunar Lander');
legend('Trajectory', 'Start', 'End');
grid on; axis equal;

%% Figure 3: Mass over Time
figure(3);
plot(t, m, 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Mass (kg)');
title('Mass Variation over Time');
grid on;

%% Figure 4: Altitude vs Time
figure(4);
RL = 1738e3;  % Moon radius (m)
plot(t, r - RL, 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Altitude (m)');
title('Altitude Above Moon Surface');
grid on;

%% Figure 5: Ground Track (XZ-plane)
figure(5);
plot(x/1000, z/1000, 'LineWidth', 2);
xlabel('X (km)');
ylabel('Z (km)');
title('Ground Track on Lunar Surface (XZ plane)');
grid on; axis equal;

%% Figure 6: Thrust Angle ψ (psi) and φ (phi)
figure(6);
subplot(2,1,1);
plot(t(1:end-1), rad2deg(psi), 'r', 'LineWidth', 1.5);
xlabel('Time (s)');
ylabel('\psi (deg)');
title('Thrust Angle \psi Over Time');
grid on;

subplot(2,1,2);
plot(t(1:end-1), rad2deg(phi), 'b', 'LineWidth', 1.5);
xlabel('Time (s)');
ylabel('\phi (deg)');
title('Thrust Angle \phi Over Time');
grid on;

%% Figure 7: Total Speed Magnitude
figure(7);
v_total = sqrt(Vx.^2 + Vy.^2 + Vz.^2);
plot(t, v_total, 'k', 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Speed (m/s)');
title('Total Speed of the Lander');
grid on;
