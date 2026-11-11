function F_angle = control_law(state, paramat, F_angle0)
    psi0 = F_angle0(1);
    phi0 = F_angle0(2);

    % --- State Variables ---
    Vx = state(1); Vy = state(2); Vz = state(3);
    r = state(4); beta = state(5); alpha = state(6);
    m = state(7);

    % --- Parameters ---
    miu = paramat.miu;
    F = paramat.F;
    Vxf = paramat.Vxf;
    Vyf = paramat.Vyf;
    Vzf = paramat.Vzf;
    rf = paramat.rf;

    % --- Compute aF and aH ---
    aF = F / m;
    aH = aF / sqrt(2);

    % --- Estimate time-to-go ---
    tgo = sqrt((Vy - Vyf)^2 + (Vz - Vzf)^2) / aH;

    % --- Polynomial fit (radial trajectory) ---
    k2 = 3*(rf - r)/(tgo^2) - 2*Vx/tgo;
    k3 = -2*(rf - r)/(tgo^3) + Vx/(tgo^2);
    a = 2*k2 + 6*k3*tgo;

    % --- Compute safe angles ---
    test1 = (a + miu/r^2 - ((Vy^2 + Vz^2)/r)) / aF;
    test2 = (Vyf - Vy)/sqrt((Vzf - Vz)^2 + (Vyf - Vy)^2);

    % --- Clamp values ---
    test1 = min(max(test1, -1), 1);
    test2 = min(max(test2, -1), 1);

    psi = acos(test1);
    phi = acos(test2);

    F_angle = [psi; phi];
end
