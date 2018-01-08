function [nuevaImg] = segmentar(I,parametro)
%% L es una matriz de las componentes conexa, cant es la cantidad de componentes que se hallaron 
[L] = bwlabel(I);
imgPropiedades = regionprops(L,'Area','Image');

cantidad=length(imgPropiedades);

   %% maximo=max(max([imgPropiedades.Area]));
    minimo=min(min([imgPropiedades.Area]));
    
   %% maximo=max(max([imgPropiedades.Area]));

    imgAreas=sort([imgPropiedades.Area],'ascend');
    sum=0;
     for i=1:cantidad %Que machete tan bravo !
         sum=sum + imgAreas(i);
     end
     promedio=sum/(cantidad);

    if parametro=='P'
        idx=find([imgPropiedades.Area]>=minimo & [imgPropiedades.Area]<= floor(promedio));
        BW=ismember(L,idx);
        nuevaImg = BW;
    else
        idx=find([imgPropiedades.Area]>=floor(promedio) & [imgPropiedades.Area]<=imgAreas(cantidad));
        BW=ismember(L,idx);
        nuevaImg = BW;
    end
end

