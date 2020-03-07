%Heat transfer
clc;clear;

%Thermal Conductivity [W/mK]
k_n2 = 0.149445; %Liquid nitrogen
k_al = 152; %6061 Aluminum 
k_sofi = 0.0211; %Spray on Foam Insulation
k_bl = .044; %space blanket

%Heat transfer coefficient [W/m^2K]
h_air = 4.5*5.678263; %From ULA guide, converted to correct units
h_n2 = 120; %acquired from study found online

%Starting Temps [K]
T_n2 = 126;
T_air = (296+286)/2; %highest outside temp during day

%radii [m]
r_n2 = 0.055499;
r_al = 0.009398+r_n2;
r_sofi = 0.1016+r_al;
r_bl = 125e-6+r_sofi;

%Other properties
L = 0.32512; %Length of the tank [m]
V = 1868.13; %Volume of Tank [mL]
rho_n2 = .807; %density of liquid nitrogen[g/mL]
W = V*rho_n2/1000; %Weight of liquid n2 [kg]
Q_lh = 199.1; %Latent Heat of Evaporation for liquid n2 [kJ/kg]
Lift = 7; %Wattage pulled out of liquid nitrogen by cryocooler 


%Resistances
%Refer to drawing
R_conv_n2 = 1/(h_n2*2*pi*r_n2*L);
R_cond_al = log(r_al/r_n2)/(2*pi*k_al*L);
R_cond_sofi = log(r_sofi/r_al)/(2*pi*k_sofi*L);
R_cond_bl = log(r_bl/r_sofi)/(2*pi*k_bl*L);
R_conv_air = 1/(h_air*2*pi*r_bl*L);

RP_conv_n2 = 1/(h_n2*pi*(r_n2^2));
RP_cond_al = (r_al-r_n2)/(pi*(r_al^2)*k_al);
RP_cond_sofi = (r_sofi-r_al)/(pi*(r_al^2)*k_sofi);
RP_cond_bl = (r_bl-r_sofi)/(pi*(r_al^2)*k_bl);
RP_conv_air = 1/(h_air*pi*(r_al^2));

%heat transfer rate [J/s]
% new method, full composite cylnder and plane
qrcyl = (T_air-T_n2)/(R_conv_n2+R_cond_al+R_cond_sofi+R_cond_bl+R_conv_air)
qrplane = (T_air-T_n2)/(RP_conv_n2+RP_cond_al+RP_cond_sofi+RP_cond_bl+RP_conv_air)
qtotal = (qrcyl+qrplane) - Lift
Kq = qtotal/1000;
boiloffrate = Kq/Q_lh
holdtime = ((W/boiloffrate)/60)/60
Holddays = holdtime/24

% old method, temperature increments
T_s_bl = T_air - ((T_air-T_n2)*R_conv_air)/(R_conv_n2+R_cond_al+R_cond_sofi+R_cond_bl+R_conv_air);
T_s_sofi = T_air - ((T_air-T_n2)*(R_conv_air+R_cond_sofi))/(R_conv_n2+R_cond_al+R_cond_sofi+R_cond_bl+R_conv_air);
T_s_al = T_air - ((T_air-T_n2)*(R_conv_air+R_cond_sofi+R_cond_bl))/(R_conv_n2+R_cond_al+R_cond_sofi+R_cond_bl+R_conv_air);
T_s_n2 = T_air - ((T_air-T_n2)*(R_conv_air+R_cond_sofi+R_cond_bl+R_conv_n2))/(R_conv_n2+R_cond_al+R_cond_sofi+R_cond_bl+R_conv_air);

%Why would you use all of the resistances for the heat transfer rate btw
%just the al and nitrogen
qr = (T_s_al-T_n2)/(R_conv_n2+R_cond_al+R_cond_sofi+R_cond_bl+R_conv_air)
Q_lh_tot = Q_lh*W*1000; %Total amount of heat for evaporation [J]

Qr = qr*86400; %total amount of heat transferred in days [J]

min_day_req = Q_lh_tot/Qr;







