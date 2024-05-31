% Constants
q = 1.602176634e-19; % Electron charge (C)
k = 1.380649e-23; % Boltzmann constant (J/K)
T = 298; % Temperature (K)

% Solar Panel Parameters
Ns = 36; % Number of cells in series
Np = 1; % Number of cells in parallel
Voc = 21.6; % Open circuit voltage (V)
Isc = 5.45; % Short circuit current (A)
a = 1.3; % Ideality factor

% Derived Parameters
Vt = k * T / q; % Thermal voltage
Rs = 0.2; % Series resistance (ohms)
Rsh = 200; % Shunt resistance (ohms)
Io = Isc / (exp(Voc / (a * Ns * Vt)) - 1); % Diode saturation current
Iph = Isc; % Photo-generated current

% Voltage Range for I-V Curve
V = linspace(0, Voc, 100); % Voltage range from 0 to Voc

% Calculate I-V Characteristics
I = zeros(size(V)); % Initialize current array
for i = 1:length(V)
    I(i) = Iph - Io * (exp((V(i) + I(i) * Rs) / (a * Ns * Vt)) - 1) - (V(i) + I(i) * Rs) / Rsh;
end

% Plot I-V Characteristics
figure;
subplot(2, 1, 1);
plot(V, I, 'b', 'LineWidth', 2);
xlabel('Voltage (V)');
ylabel('Current (I)');
title('I-V Characteristics of PV Panel');
grid on;

% Calculate P-V Characteristics
P = V .* I;

% Plot P-V Characteristics
subplot(2, 1, 2);
plot(V, P, 'r', 'LineWidth', 2);
xlabel('Voltage (V)');
ylabel('Power (P)');
title('P-V Characteristics of PV Panel');
grid on;