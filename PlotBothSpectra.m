clc;
clear all;
%close all

%input data
U10 = 25;   %Wind speed at 10m in m/s
U19half = 1.026 * U10;
g=9.814;     %Gravitational acceleration  m/s^2

Hs = 0.22 * (U10 ^ 2) / g;
Tm = (2 * pi * U19half) / (0.877 * g);  %Peak period (s)    wp = 0.877g / U19.5 so we solve for Tm with w = 2pi * f = 2pi/T
% Hs=12; %                                                                         significant wave height (m)
%Tm=10*(0.327*exp(-0.315*3.3)+1.17); %                                            Peak period (s)                       Tm=Tp=T0
% Tm=10*(0.327*exp(-0.315*1)+1.17); %     
% Tz=10;                          %                                                zero-crossing period (s)
Omega=0.01:0.01:5;
Cap = 5;                           %this is the maximum considered Omega
%type 1 is Jonswap and type 2  Pierson-Moskowitz
[S1, Amp1, t1]=SeaSpectrum('Omega', Omega ,'Hs', Hs,'Tm' ,Tm, 'Type', 1, 'TEnd',3600*3/15,'Cap',Cap,'PlotSpectrum',2, 'U10', U10);


%%
[S2, Amp2, t2]=SeaSpectrum('Omega', Omega ,'Hs', Hs,'Tm' ,Tm, 'Type', 2, 'TEnd',3600*3/15,'Cap',Cap,'PlotSpectrum',2, 'U10', U10);
figure
hold on 
plot(Omega,S1)
xlabel('Omega (rad/s)');
ylabel('Spectrum (m^2.s)');
grid;
hold on
plot(Omega,S2)
legend( 'Jonswap',  'Pierson-Moskowitz')