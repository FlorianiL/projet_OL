% Affichage d'images à partir d'une matrice
%
% a = affichage(V,lig,Li,Co)
%
% Input.
%   V              : (m x r) matrice dont les colonnes sont des images
%                     vectorisées
%  lig             : nombre d'images par ligne à afficher
%   (Co,Li)        : taille des images 
%
% Output.
%   Affiche les colonnes de V comme des images

function a = affichage(V,lig,Li,Co)

if nargin == 4
    bw = 0;
end

V = max(V,0); [m,r] = size(V); 
for i = 1 : r
    V(:,i) = V(:,i)/(max(V(:,i))+1e-6);
end
Vaff = []; warning('off');
for i = 1 : r
        ligne = floor((i-1)/lig)+1; col = i - (ligne-1)*lig;
        Vaff((ligne-1)*Li+1:ligne*Li,(col-1)*Co+1:col*Co) = reshape(V(:,i),Li,Co)/max(V(:,i));
end
[m,n] = size(Vaff);
for i = 1 : n/Co-1
        Vaff = [Vaff(:,1:Co*i+i-1) ones(m,1) Vaff(:,Co*i+i:end)];
end
[m,n] = size(Vaff);
for i = 1 : m/Li-1
        Vaff = [Vaff(1:Li*i+i-1,:); ones(1,n); Vaff(Li*i+i:end,:)];
end

figure; imshow(1-Vaff,[0 1]); colormap(gray); 
    
warning('on');
a = 1;