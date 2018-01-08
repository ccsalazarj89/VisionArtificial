

%s=strcat('placa',int2str(1),'.yuli')
% I = imread('images\placa3.jpg');
% Ibw = im2bw(I);
% 
% I=procesar_imagen(I);
% 
% Ilabel = bwlabel(Ibw);
% stat = regionprops(Ilabel,'centroid');
% imshow(I); hold on;
% for x = 1: numel(stat)
%     plot(stat(x).Centroid(1),stat(x).Centroid(2),'ro');
% end


close all
clear all
clc

imagen=imread('images\PlacaPrueba.jpg');

I=procesar_imagen(imagen);

 [A] = bwlabel(I);
    img = regionprops(A,'Area','Image');
    max=max(max([img.Area]));
    idx=find([img.Area]==max);
    imgRestar=ismember(A,idx);
    I=I-imgRestar;
    
    [L] = bwlabel(I);
    imgPropiedades = regionprops(L,'Area','Image');
    x=1:length(imgPropiedades);
    bar(x,[imgPropiedades.Area]),title('Area vs Region');

Ipequenas=segmentar(I,'P');
Igrandes=segmentar(I,'G');


%%figure,colormap('gray'),imshow(prueba);


figure,colormap('gray'),imshow(Ipequenas);
subplot(2,2,1), colormap('gray'),imshow(imagen),title('Original')
subplot(2,2,2), colormap('gray'),imshow(I),title('Binarizada');
subplot(2,2,3), colormap('gray'),imshow(Ipequenas),title('Letras pequeñas');
subplot(2,2,4), colormap('gray'),imshow(Igrandes),title('Letras grandes');