function [I_Proc] = procesar_imagen(I)
I_Proc=255-I;
I_Proc=rgb2gray(I_Proc);
threshold=OTSU(I_Proc);
I_Proc=I_Proc>threshold;
I_Proc = bwareaopen(I_Proc,15);
end