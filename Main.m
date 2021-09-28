t = linspace(0,7*60*60*24,7*60*60*24);
Q_in_sun = -361*cos((pi*t)/(12 * 3600)) + 224*cos((pi*t)/(6 * 3600)) + 210;
plot(t, Q_in_sun)





%dT_f/dt = Q_in_sun/(m*c) - (T_f - T_a)/(R_tot*m*c);






