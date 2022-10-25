clc ;
close all
clear all ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--*Vehicle dynamic//bleu car//--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Rr=0.33;               % Radius of car wheel in m ;
Td=3.6*pi*Rr/30;       %Speed shaft rotation of MG2 in tr/min -> True speed in km/h


%%           %%---------------------------------%%
m=860;%;                 % Vehicle mass without ESS (kg)
g=9.8;               % Force to the gravity in m/s^2
r=0.33;               % Radius of car wheel in m;
%W=310;            % Battery massor HESS (kg)%4kg for PMSM losses
%m=W+m;
Jve=m*r^2;          %Inertia
%--------------------------------------------------------------------------

rho=1.2;                  % Air density (kg/m^3) kg/m^3
S=2.75;                     % Frontal area ...master-torque area in m^2 = vehicle width (1.49) * vehicle height (1.73)
Cx=0.3;                  % air penetration coefficient
C1=1.6e-6;               %Dynamic tire rolling coefficient ....coefficient of rolling resistance in curves  
C0=0.008;                %Static tire rolling coefficient ...rolling resistance coefficient
gr=0.256;                %transmission reduction ratio
kmm=1.1;                 % coefficient
E = 374;                 %supply voltage of the actuator       
%%%%%%%%%******************************************************************
%************************** Design and dynamics modeling for electric vehicle applications  %**************************
%%%%%%% Question 1:  %%%%%%%
%Check that the parameters of the Simulink model match the model you are currently viewing.

%%%%%%% Question2:  %%%%%%%
%What are the inputs and outputs of this model?

%%%%%%% Question3:  %%%%%%%
%By using the above relationships and data, build a Simulink model of vehicle dynamics as illustrated in Figure 3. 

%%%%%%% Question4:  %%%%%%%
% Create a "Subsystem" block. Put it in the following form.
%sim Dynamic_model_of_BOLLORE_BLUECAR

%%%%%%% Question5:  %%%%%%%
%First of all, you set a constant speed setpoint assuming that the electrical power of the battery is ideal and therefore does not discharge over time. This will be your direct output from this first model. Put it in the following form.

%%%%%%% Question6:  %%%%%%%
%Change the two parameters previously announced and check the mechanical torque, power, and energy for simulation time of 10s. 
%sim Dynamic_model_of_BOLLORE_BLUECAR

%%%%%%% Question7:  %%%%%%%
%Complete the following table for a vehicle mass previously announced m=860kg.
%sim Dynamic_model_of_BOLLORE_BLUECAR

%%%%%%% Question8:  %%%%%%%
%Repeat the operation for a vehicle mass m=1200kg..
%sim Dynamic_model_of_BOLLORE_BLUECAR

%%%%%%% Question9:  %%%%%%%
% What can you conclude from this? Explain the difference?.

%%%%%%% Question10:  %%%%%%%
%By using a step block as an input speed with following parameters (step time, t=5s  & sample time 0.05). Complete the following table for m=860kg.
%sim Dynamic_model_of_BOLLORE_BLUECAR

%%%%%%% Question11:  %%%%%%%
%What can you conclude from this? Explain the difference?.

%%%%%%% Question12:  %%%%%%%
%In the vehicle model, it is designed to calculate the amount of energy consumed following the driving cycle. The amount of energy consumed determines the charge state of the battery and the energy consumption values at 100 km.
%-	Open the drive cycle file, after that, you may need to use the 'install.m' script to make sure all the toolbox directories are on your MATLAB search path.
%-	Open the Simulink of drive cycle, put it in the following form with NEDC cycle (t= 1180s).
%-	What are the outputs/units of this model, you may need to use the “look under mask simulink”
%
%-	Find the following characteristics for NEDC and HIGHWAY driving cycles : (Total time, distance, maximal speed , maximal acceleration/deceleration) 
%sim Dynamic_model_of_BOLLORE_BLUECAR

%%%%%%% Question13:  %%%%%%%
%By using the drive cycle with vehicle model, complete the following table for a vehicle mass previously announced m=860kg.
%sim Dynamic_model_of_BOLLORE_BLUECAR
%Time
%Range
%Total energy Consumption 
 %KWh
%Traction Energy Gain 
%
%Braking Energy Gain
%
%Total Energy Consumption Gain
%KWh
%Maximum of traction power
%W
%Maximum of braking power
%W

%%%%%%% Question14:  %%%%%%%
%Repeat the operation for a vehicle mass m=860kg +mbat= 300kg.
%sim Dynamic_model_of_BOLLORE_BLUECAR

%%%%%%% Question15:  %%%%%%%
%What can you conclude from this? Explain the difference?.
%sim Dynamic_model_of_BOLLORE_BLUECAR