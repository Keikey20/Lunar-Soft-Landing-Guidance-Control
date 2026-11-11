clc;
clear;
close all;

run extractparameters.m

% Simulation settings%
r0 = 1753e3;
beta0 = 1e-10;
alpha0 = deg2rad(5);
Vx0 = 0;
Vy0 = 1692;
Vz0 = 0;
m0 = 600;
t0 = 0;
time = 600;

%%Thrust Sensitivity%%
F_nom = paramat.F;
F_set = F_nom * [0.9 1 1.1];

figure('Name','Thrust vs Altitude'); hold on;
figure('Name','Thrust vs Velocity'); hold on;
figure('Name','Thrust vs Mass'); hold on;
figure('Name','Thrust vs Angle'); hold on;

for F = F_set
    paramat.F = F;
    X0 = [Vx0; Vy0; Vz0; r0; beta0; alpha0; m0];
    [t, state, others] = rk4_method(@Differential_Eq, t0, X0, time, paramat);

    % Unpack
    r = state(4,:) - paramat.RL;
    v_total = sqrt(state(1,:).^2 + state(2,:).^2 + state(3,:).^2);
    m = state(7,:);
    psi = rad2deg(others(1,:));

    % Plot
    figure(findobj('Name','Thrust vs Altitude'));
    plot(t, r, 'DisplayName', sprintf('F = %.0f', F));

    figure(findobj('Name','Thrust vs Velocity'));
    plot(t, v_total, 'DisplayName', sprintf('F = %.0f', F));

    figure(findobj('Name','Thrust vs Mass'));
    plot(t, m, 'DisplayName', sprintf('F = %.0f', F));

    figure(findobj('Name','Thrust vs Angle'));
    plot(t(1:end-1), psi, 'DisplayName', sprintf('F = %.0f', F));
end

% Beautify
figs = findall(groot,'Type','figure');
for f = figs'
    figure(f);
    xlabel('Time (s)'); grid on; legend show;
end

%%Sensitivity%%
Isp_nom = paramat.Isp;
Isp_set = Isp_nom * [0.9 1 1.1];

figure('Name','Isp vs Altitude'); hold on;
figure('Name','Isp vs Velocity'); hold on;
figure('Name','Isp vs Mass'); hold on;
figure('Name','Isp vs Angle'); hold on;

for Isp = Isp_set
    paramat.Isp = Isp;
    X0 = [Vx0; Vy0; Vz0; r0; beta0; alpha0; m0];
    [t, state, others] = rk4_method(@Differential_Eq, t0, X0, time, paramat);

    r = state(4,:) - paramat.RL;
    v_total = sqrt(state(1,:).^2 + state(2,:).^2 + state(3,:).^2);
    m = state(7,:);
    psi = rad2deg(others(1,:));

    figure(findobj('Name','Isp vs Altitude'));
    plot(t, r, 'DisplayName', sprintf('Isp = %.0f', Isp));

    figure(findobj('Name','Isp vs Velocity'));
    plot(t, v_total, 'DisplayName', sprintf('Isp = %.0f', Isp));

    figure(findobj('Name','Isp vs Mass'));
    plot(t, m, 'DisplayName', sprintf('Isp = %.0f', Isp));

    figure(findobj('Name','Isp vs Angle'));
    plot(t(1:end-1), psi, 'DisplayName', sprintf('Isp = %.0f', Isp));
end

for f = findall(groot,'Type','figure')'
    figure(f);
    xlabel('Time (s)'); grid on; legend show;
end