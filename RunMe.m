% Recovering the constitutive materials in a hyperspectral image 
close all; clc; 

% Load the input matrix: 128x128 pixels, 100 longueurs d'onde 
load Hubble; 

% Affichage de 10 images parmi les 100
affichage(M(1:10:end,:)',5,33,33);  
title('Images à différentes longueurs d''onde'); 

% Signature des matériaux constitutifs
figure; plot(U); 
title('signatures spectrales des 8 matériaux constitutifs'); 

% Résolution du problème
% 
%    min_{ X >= 0 } || M - U*X||_1 
% 
% afin de classifier les pixels en fonction des matériaux qu'ils
% contiennent. 

X = votre_methode_linsn(M,U); 

% Affichage des matériaux dans l'image hyperspectrale
affichage(X',4,33,33); 