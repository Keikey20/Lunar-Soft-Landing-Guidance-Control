function tgo = compute_tgo(r, u, v, w, m, F)
% compute time-to-go for soft landing guidance
% r=radius, u=radial speed, v,w=lateral speeds, m=mass, F=thrust

  % thrust accel
  aT = F / m;
  % ideal lateral accel magnitude
  aH = aT / sqrt(2);
  % compute tgo, avoid divide-by-zero
  tgo = sqrt( (v).^2 + (w).^2 ) ./ max(aH,1e-6);
  % floor at a small positive number
  tgo = max(tgo,1e-3);
end
