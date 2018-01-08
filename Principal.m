close all
clear all
clc


%Fecha       :20-11-2015
%Autores     :Yuliana Laverde Rodriguez & Christian Salazar Jaramillo
%Descripcion :Algoritmo que procesa una imagen de placas vehiculares
%             con el fin de detectar cuales son las letras grandes y las 
%             letras pequeñas.

dirEntrada = 'images\';
dirSalidaGrandesArea    ='ALetrasGrandes\';
dirSalidaPequenasArea   ='ALetrasPequenas\';
dirSalidaGrandesCentro  ='CLetrasGrandes\' ;
dirSalidaPequenasCentro ='CLetrasPequenas\';


files = dir(strcat(dirEntrada,'*.jpg'));
filesAGrandes=dir();
filesAPequenas=dir();

[f, c] = size(files);

disp('Procesando...');

for i=1:f
    clear idx;
    clear img;
    clear max;
    clear imgRestar;
    
    LeerImagen=strcat(dirEntrada,files(i).name);
    
    nombrer=strcat(files(i).name);
    rutaG=strcat(dirSalidaGrandesArea,nombrer);
    rutaP=strcat(dirSalidaPequenasArea,nombrer);
    
    imagen=imread(LeerImagen);
    I=procesar_imagen(imagen);
    
    %%Por caracteristica de área.
    
    [A] = bwlabel(I);
    img = regionprops(A,'Area','Image');
    max=max(max([img.Area]));
    idx=find([img.Area]==max);
    imgRestar=ismember(A,idx);
    I=I-imgRestar;
    
    Ipequenas=segmentar(I,'P');
    imwrite(Ipequenas,rutaP);
    Igrandes=segmentar(I,'G');
    imwrite(Igrandes,rutaG); 
    
     %%Por caracteristica de centroide
    
    segmentarCentroide(I,dirSalidaGrandesCentro,dirSalidaPequenasCentro,files(i).name);
    
end

disp('Terminado');



