% codigo basado en la implementacion de OTSU de Shirley 2013
% http://www.mathworks.com/matlabcentral/fileexchange/42635-otsu-binarization

% Esta funcion recibe una imagen a escala de grises I y retorna el valor de
% umbral obtenido mediante OTSU maximizacion interclase.

function threshold = OTSU(I)
    n=imhist(I);
    N=sum(n);
    max=0;

    for i=1:256
        P(i)=n(i)/N;
    end

    for T=2:255
        w0=sum(P(1:T));
        w1=sum(P(T+1:256));
        u0=dot([0:T-1],P(1:T))/w0;
        u1=dot([T:255],P(T+1:256))/w1;
        sigma=w0*w1*((u1-u0)^2);
        if sigma>max
            max=sigma;
            threshold=T-1;
        end
    end
end