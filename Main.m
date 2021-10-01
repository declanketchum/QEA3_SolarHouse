tspan = linspace(0,7*60*60*24,7*60*60*24);
%t = linspace(0,7*60*60*24,7*60*60*24);
%Q_in_sun = -361*cos((pi*t)/(12 * 3600)) + 224*cos((pi*t)/(6 * 3600)) + 210;
%plot(t, Q_in_sun)




y_0= 17; %start temp of air
T_a = -3; %temp of air constant
m = 3000 * 5 * 5 * .1; %kg
c = 800; % j/kgK


h_f = 15; %
A_win = 2.6*2.6; %m^2
A_wall = 25*6 - A_win; % m^2 
A_f = 25; %m^2
L_wall = .3; %m 
L_win = .1; %m
h_wall_in = 15; %w/mk
h_wall_out = 30; %w/mk
K_win = .78; % w/mk %found online
h_win_out = .7; % w/m^2k
h_win_in = .7; % w/m^2
K_wall = .04; % w/mk

R_FtoA = 1/(h_f * A_f);
R_AirtoWall_in = 1/(h_wall_in * A_wall);
R_W  = L_wall/(K_wall * A_wall);
R_AtoWin_in = 1/(h_win_in*A_win);
R_win   = L_win/(K_win*A_win);
R_AtoWin_out = 1/(h_win_out*A_win);
R_AirtoWall_out = 1/(h_wall_out * A_wall); 


R_tot = R_FtoA + 1/((1/(R_AirtoWall_in + R_W + R_AirtoWall_out)) + (1/(R_AtoWin_in + R_win + R_AtoWin_out))); %thermal resistance

[t, y] = ode45(@(t,y) (-361*cos((pi*t)/(12 * 3600)) + 224*cos((pi*t)/(6 * 3600)) + 210)/(m*c) - (y - T_a)/(R_tot*m*c), tspan, y_0);
%dT_f/dt = Q_in_sun/(m*c) - (T_f - T_a)/(R_tot*m*c);

plot(t,y)

