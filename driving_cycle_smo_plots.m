clc
% OBSERVERS PLOTS

% FIGURE MUST CONTAIN: 
% PLOT 1 - Vt estimations of the 3 observers
% PLOT 2 - Z estimations of the 3 observers (SOC estimation)
% PLOT 3 - Vp estimations of the 3 observers

f1 = figure(1); set(f1,'name','Baterry modeling - Vt'); % Setting figure name
plot(t,Vt,'--',t,Vt_hat_Luem,t,Vt_hat_Sli,t,Vt_hat_Super,'LineWidth',1.5); grid on;% ylim([3.5,5.5]); xlim([0, 5]); % Add grid 
[l1] = legend('$$V_t$$ Model','$$\hat{V}_t$$ Luenberger','$$\hat{V}_t$$ Classic S.M.',...
    '$$\hat{V}_t$$ Super Twisting',  'Interpreter', 'latex');
%l1.FontSize = 12;
[t1] = title('Terminal voltage $$V_t$$', 'Interpreter', 'latex');
%t1.FontSize = 12; set(t1, 'Interpreter', 'latex');
xlabel('time [s]', 'Interpreter', 'latex');
ylabel('Cell Voltage [V]', 'Interpreter', 'latex');
%%axis tight
ax = gca; ax.FontSize = 12;
ax.XAxis.Exponent = 0;

f2 = figure(2); set(f2,'name','Baterry modeling - Z'); % Setting figure name
plot(t,Z,'--',t,Z_hat_Luem,t,Z_hat_Sli,t,Z_hat_Super,'LineWidth',1.5); grid on; %ylim([0.8,2]); xlim([0, 5]); % Add grid 
[l2] = legend('$$Z$$ Model','$$\hat{Z}$$ Luenberger','$$\hat{Z}$$ Classic S.M.',...
    '$$\hat{Z}$$ Super Twisting',  'Interpreter', 'latex');
%l1.FontSize = 12;
[t2] = title('State of charge (SOC) $$Z$$', 'Interpreter', 'latex');
%t1.FontSize = 12; set(t1, 'Interpreter', 'latex');
xlabel('time [s]', 'Interpreter', 'latex');
ylabel('SOC [\%]', 'Interpreter', 'latex');
%%axis tight
ax = gca; ax.FontSize = 12;
ax.XAxis.Exponent = 0;

f3 = figure(3); set(f3,'name','Driving Cycle - UDDS'); % Setting figure name
subplot(211), plot(t,driving_cycle,'LineWidth',1.5); grid on;% ylim([3.5,5.5]); xlim([0, 5]); % Add grid 
%l1.FontSize = 12;
[t3] = title('UDDS Driving Cycle', 'Interpreter', 'latex');
%t1.FontSize = 12; set(t1, 'Interpreter', 'latex');
xlabel('time [s]', 'Interpreter', 'latex');
ylabel('Speed [km/h]', 'Interpreter', 'latex');
%%axis tight
ax = gca; ax.FontSize = 12;
ax.XAxis.Exponent = 0;

subplot(212), plot(t,-I,'LineWidth',1.5); grid on;% ylim([3.5,5.5]); xlim([0, 5]); % Add grid 
%l1.FontSize = 12;
[t4] = title('UDDS Current Profile', 'Interpreter', 'latex');
%t1.FontSize = 12; set(t1, 'Interpreter', 'latex');
xlabel('time [s]', 'Interpreter', 'latex');
ylabel('Current [A]', 'Interpreter', 'latex');
%%axis tight
ax = gca; ax.FontSize = 12;
ax.XAxis.Exponent = 0;

f4 = figure(4); set(f4,'name','Baterry modeling - Vt'); % Setting figure name
subplot(211),plot(t,Vt,'--',t,Vt_hat_Luem,t,Vt_hat_Sli,t,Vt_hat_Super,'LineWidth',1.5); grid on; ylim([3.5,5.5]); xlim([0, 5]); % Add grid 
[l1] = legend('$$V_t$$ Model','$$\hat{V}_t$$ Luenberger','$$\hat{V}_t$$ Classic S.M.',...
    '$$\hat{V}_t$$ Super Twisting',  'Interpreter', 'latex');
%l1.FontSize = 12;
[t1] = title('Terminal voltage $$V_t$$', 'Interpreter', 'latex');
%t1.FontSize = 12; set(t1, 'Interpreter', 'latex');
xlabel('time [s]', 'Interpreter', 'latex');
ylabel('Cell Voltage [V]', 'Interpreter', 'latex');
%%axis tight
ax = gca; ax.FontSize = 12;
ax.XAxis.Exponent = 0;

subplot(212), plot(t,Z,'--',t,Z_hat_Luem,t,Z_hat_Sli,t,Z_hat_Super,'LineWidth',1.5); grid on; ylim([0.8,1.2]); xlim([0, 5]); % Add grid 
[l2] = legend('$$Z$$ Model','$$\hat{Z}$$ Luenberger','$$\hat{Z}$$ Classic S.M.',...
    '$$\hat{Z}$$ Super Twisting',  'Interpreter', 'latex');
%l1.FontSize = 12;
[t2] = title('State of charge (SOC) $$Z$$', 'Interpreter', 'latex');
%t1.FontSize = 12; set(t1, 'Interpreter', 'latex');
xlabel('time [s]', 'Interpreter', 'latex');
ylabel('SOC [\%]', 'Interpreter', 'latex');
%%axis tight
ax = gca; ax.FontSize = 12;
ax.XAxis.Exponent = 0;

%{
subplot(212), plot(t,Vt,'--',t,Vt_hat_Luem,t,Vt_hat_Sli,t,Vt_hat_Super); grid on; ylim([3.5,5.5]); xlim([0, 5]); % Add grid 
[l2] = legend('$$V_t$$ Model','$$\hat{V}_t$$ Luemberger','$$\hat{V}_t$$ Classic S.M.',...
    '$$\hat{V}_t$$ Super Twisting',  'Interpreter', 'latex');
%l1.FontSize = 12;
[t2] = title('Terminal voltage $$V_t$$', 'Interpreter', 'latex');
%t1.FontSize = 12; set(t1, 'Interpreter', 'latex');
xlabel('time [s]', 'Interpreter', 'latex');
ylabel('Cell Voltage [V]', 'Interpreter', 'latex');
%%axis tight
ax = gca; ax.FontSize = 12;
ax.XAxis.Exponent = 0;
%}


% ERROR CALCULATIONS

E_vt1 = Vt - Vt_hat_Luem;
E_vt2 = Vt - Vt_hat_Sli;
E_vt3 = Vt - Vt_hat_Super;

E_z1 = Z - Z_hat_Luem;
E_z2 = Z - Z_hat_Sli;
E_z3 = Z - Z_hat_Super;

E_vp1 = Vp - Vp_hat_Luem;
E_vp2 = Vp - Vp_hat_Sli;
E_vp3 = Vp - Vp_hat_Super;

% CALCULATING ISE

% Vt ISE
ise_vt1 = trapz(t,(E_vt1.^2)); %ISE LUEMBERGER
ise_vt2 = trapz(t,(E_vt2.^2)); %ISE SLIDING MODE
ise_vt3 = trapz(t,(E_vt3.^2)); %ISE SUPER TWISTING

% Z ISE
ise_z1 = trapz(t,(E_z1.^2)); %ISE LUEMBERGER
ise_z2 = trapz(t,(E_z2.^2)); %ISE SLIDING MODE
ise_z3 = trapz(t,(E_z3.^2)); %ISE SUPER TWISTING

% Vp ISE
ise_vp1 = trapz(t,(E_vp1.^2)); %ISE LUEMBERGER
ise_vp2 = trapz(t,(E_vp2.^2)); %ISE SLIDING MODE
ise_vp3 = trapz(t,(E_vp3.^2)); %ISE SUPER TWISTING

% CALCULATING IAE

% Vt IAE
iae_vt1 = trapz(t,abs(E_vt1)); %IAE LUEMBERGER
iae_vt2 = trapz(t,abs(E_vt2)); %IAE SLIDING MODE
iae_vt3 = trapz(t,abs(E_vt3)); %IAE SUPER TWISTING

% Z IAE
iae_z1 = trapz(t,abs(E_z1)); %IAE LUEMBERGER
iae_z2 = trapz(t,abs(E_z2)); %IAE SLIDING MODE
iae_z3 = trapz(t,abs(E_z3)); %IAE SUPER TWISTING

% Vp IAE
iae_vp1 = trapz(t,abs(E_vp1)); %IAE LUEMBERGER
iae_vp2 = trapz(t,abs(E_vp2)); %IAE SLIDING MODE
iae_vp3 = trapz(t,abs(E_vp3)); %IAE SUPER TWISTING

Table = [ ise_vt1 iae_vt1 ise_vt2 iae_vt2 ise_vt3 iae_vt3 ;...
          ise_z1 iae_z1 ise_z2 iae_z2 ise_z3 iae_z3 ;...
          ise_vp1 iae_vp1 ise_vp2 iae_vp2 ise_vp3 iae_vp3]
