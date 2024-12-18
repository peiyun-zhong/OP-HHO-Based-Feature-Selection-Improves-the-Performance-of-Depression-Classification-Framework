
eeg_data=data1006hcue;

fs=250;

scales = 1:128;
wavelet = 'cmor1.5-1'; 

coeffs = cwt(eeg_data, scales, wavelet, 'SamplingPeriod', 1/fs);
f = scal2frq(scales, wavelet, 1/fs);

delta_range = [1 4]; % Delta
theta_range = [4 8]; % Theta
alpha_range = [8 13]; % Alpha
beta_range = [13 30]; % Beta
gamma_range = [30 80]; % Gamma

% compute energy
delta_energy = sum(abs(coeffs(f >= delta_range(1) & f <= delta_range(2),:)).^2, 1);
delta_energy_mean = mean(delta_energy);
theta_energy = sum(abs(coeffs(f >= theta_range(1) & f <= theta_range(2),:)).^2, 1);
theta_energy_mean = mean(theta_energy);
alpha_energy = sum(abs(coeffs(f >= alpha_range(1) & f <= alpha_range(2),:)).^2, 1);
alpha_energy_mean = mean(alpha_energy);
beta_energy = sum(abs(coeffs(f >= beta_range(1) & f <= beta_range(2),:)).^2, 1);
beta_energy_mean = mean(beta_energy);
gamma_energy = sum(abs(coeffs(f >= gamma_range(1) & f <= gamma_range(2),:)).^2, 1);
gamma_energy_mean = mean(gamma_energy);
FrequencyBands = {'Delta', 'Theta', 'Alpha', 'Beta', 'Gamma'};
EnergyMeans = [delta_energy_mean, theta_energy_mean, alpha_energy_mean, beta_energy_mean, gamma_energy_mean];

t = 0:1/fs:(length(eeg_data)-1)/fs; 
figure;
subplot(5,1,1);
plot(t, delta_energy);
title('Delta');
subplot(5,1,2);
plot(t, theta_energy);
title('Theta');
subplot(5,1,3);
plot(t, alpha_energy);
title('Alpha');
subplot(5,1,4);
plot(t, beta_energy);
title('Beta');
subplot(5,1,5);
plot(t, gamma_energy);
title('Gamma');
xlabel('t (s)');