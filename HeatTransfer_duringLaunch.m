clc; clear;
%Heat transfer during launch

%Thermal Conductivity [W/mK]
k_n2 = 0.149445; %Liquid nitrogen
k_al = 152; %6061 Aluminum 
k_sofi = 0.0211; %Spray on Foam Insulation
k_bl = .044; %space blanket

%Heat transfer coefficient [W/m^2K]
h_air = 4.5*5.678263; %From ULA guide, converted to correct units
h_n2 = 120; %acquired from study found online
e_al = 0.09; %aluminum Emissivity, Unpolished
e_bc = .85; %beta cloth emissivity
a_bc = .3; %beta cloth absorbtance
a = 5.67e-8; %Stephan-Boltzman Constant
e_ne = 0.85; %nozzle extension emissivity


%Starting Temps [K]
T_n2 = 126;
T_ne = 1310.928; %nozzle extension

%radii [m]
r_n2 = 0.055499; % Interior tank radius
r_wallin = 0.009398+r_n2; % Outer tank radius
r_wallout = .004826+r_wallin;% inner jacket radius
r_out = .003175+r_wallout;% outer jacket radius
r_bl_out = 0.2032/2;% outer blanket radius (from bracket diameter from CAD

r_al = 0.009398+r_n2;
r_sofi = 0.0508+r_al;
r_bl = 125e-6+r_sofi;

%Other properties
L = 0.32512; %Length of the tank [m]
V = 1868.13; %Volume of Tank [mL]
rho_n2 = .807; %density of liquid nitrogen[g/mL]
W = V*rho_n2/1000; %Weight of liquid n2 [kg]
Q_lh = 199.1; %Latent Heat of Evaporation for liquid n2 [kJ/kg]
P = e_ne*a*T_ne^4; %Stefan-Boltzmann Law
Fij = 0.5; %View Factor
T_bl =((a_bc*P)/(e_bc*a))^(1/4); %Temperature on beta cloth

%Planar Resistances
RP_conv_n2 = 1/(h_n2*pi*(r_n2^2));
RP_cond_al = log(r_al/r_n2)/(pi*(r_al^2)*k_al);
RP_cond_sofi = log(r_sofi/r_al)/(pi*(r_al^2)*k_sofi);
RP_cond_bl = log(r_bl/r_sofi)/(pi*(r_al^2)*k_bl);
RP_conv_air = 1/(h_air*pi*(r_al^2));

%radiative resistances
r_bc = ((1-e_bc)/(e_bc*(pi*r_bl_out*2*L)))+(1/(pi*r_bl_out*2*L)); %blanket
r_j = ((1-e_al)/(e_al*(pi*r_out*2*L)))+((1-e_al)/(e_al*(pi*r_wallout*2*L))); %jacket
r_t = ((1-e_al)/(e_al*(pi*r_wallin*2*L)))+(1/(pi*r_wallin*2*L)); %tank

%heat transfer rate [J/s]
%qrcyl = (a*((T_bl^4)-(T_n2^4)))/(r_bc+r_j+r_t)
qrplane = (T_bl-T_n2)/(RP_conv_n2+RP_cond_al+RP_cond_sofi+RP_conv_air+RP_cond_bl)
qtotal = (qrplane)

%Boiloff Rates
Kq = qtotal/1000;
boiloffrate = Kq/Q_lh;
holdtime = ((W/boiloffrate)/60)/60
Holddays = holdtime/24


