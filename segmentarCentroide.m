function  segmentarCentroide(I,dirSalidaG,dirSalidaP,nombre)

[C] = bwlabel(I);
cimg = regionprops(C,'centroid','Image');
r=zeros(1,numel(cimg));

for x = 1: numel(cimg)
    r(x)=cimg(x).Centroid(2);
end

final=sort(r);
minimo=final(1);
maximo=final(numel(cimg));
centro=(maximo+minimo)/2;


for x = 1: numel(cimg)
    
    if cimg(x).Centroid(2)<centro
        imwrite(cimg(x).Image,strcat(dirSalidaG,'C',int2str(x),nombre));
    else
        %Escribir imagen 
        imwrite(cimg(x).Image,strcat(dirSalidaP,'C',int2str(x),nombre));
    end

end

end