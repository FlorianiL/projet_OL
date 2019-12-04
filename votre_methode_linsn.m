% Vous devez implémenter ici votre méthode pour résoudre le problème
% 
%   min_{V >= 0} || M - U*V ||_1 tel que 

function V = votre_methode_linsn(M,U); 

[m,n] = size(M); 
[m,r] = size(U); 

% Construire c : matrice des coeffeicients de la fonction objectif

for i = 1 : n
  c[i] = 0;
end
for j = n+1 : n+m
  c[i] = 1;
end

% Construire A : matrice des coefficients des variables des contraintes
  %   Récupèrer les coefficients de M
for i = 1 : m
  for j = 1 : n
    A(i,j) = U(i,j);                                
    A(i+m,j) = - U(i,j);                          
  end
end

  %   Construire matrice identité
for i = 1 : n
  A(2*m+i,i) = 1;                                 
  A(2*m+n+i,i) = 1;
end

% Construire b : matrice des termes indépendants des contraintes
for i = 1 : m 
  b(i,1) = M(i,1);                            
end
l = 1;
for i = m+1 : 2*m
  b(i,1) = - M(l,1);                         
  l = l+1;
end

% Construire lb : matrice de caractères donnant le sens des inégalités
for i = 1 ; 2*m
  lb(i) = "L";
end

% Résoudre le problème pour chaque pixel: pour tout j,  
%   min_{V(:,j) >= 0} || M(:,j) - U*V(:,j) ||_1   
for j = 1 : n
    V(:,j) = lin_ls(M(:,j),U); 
end

%  Résoudre les sous problèmes du type 
% 
%  min_{x} || A*x - b ||_1 
% 
%  tel que  x >= 0. 

function x = lin_ls(b,A); 

[m,n] = size(A); 

% Formuler et résoudre le problème avec glpk
x = glpk(c, A, b, [], [], lb);