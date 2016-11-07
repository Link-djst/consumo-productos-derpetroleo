
A = [4 -4 7 6 2; 278 -242 1430 908 40] ;


%disp(A)

x = A(1,:);
fx = A(2,:);
 
% No tienes que digitar modificar m�s nada.


%Cuerpo del programa
xa=x;fa=fx;

% Se forman las diferencias divididas
diferencias=zeros(length(x));
diferencias(:,1)=fx';

% Estos ciclos rerorren los datos de tal forma que se van creando nuevas lineas con las diferencias divididas, y luego estas se operan para hacer mas.
for k=2:length(x)
    for j=1:length(x)+1-k
        diferencias(j,k)=(diferencias(j+1,k-1)-diferencias(j,k-1))/(x(j+k-1)-x(j));
    end
end

% Se forma el polinomio
% Se recorre la distancia de los valores de x, menos 1 que siempre se ignora.
for j=1:length(x)-1
    % Se agarra el valor que toca de la tabla de diferencias divididas para convertirlo a cadena
    ds=num2str(abs(diferencias(1,j)));
    
    % Se identifica el signo del valor de x que toca para colocar en parentesis
    if j>1
      if x(j-1)<0
          signo1='+';
    else
          signo1='-';
       end
    end
    
    % Se identifica el signo del valor de la tabla de diferencias divididas.
    if diferencias(1,j)<0
       signo2='-';
    else
       signo2='+';
    end
    
    # El primer valor siempre es solo una constante, y el primer valor de la tabla de diferencias
    if j==1
       PolinomioFinal=num2str(diferencias(1,1));
     % El segundo lleva una constan
    elseif j==2
       % Se crea el contenido dentro del parentesis con un valor de x
       DentroParentesis=['(x' signo1 num2str(abs(x(j-1))) ')' ];
       % Y luego se une a la constante de las diferencias divididas que toca
       PoliParcial=[ds '*' DentroParentesis];
    PolinomioFinal=[PolinomioFinal signo2 PoliParcial];
    else
       DentroParentesis=[DentroParentesis '.*' '(x' signo1 num2str(abs(x(j-1))) ')' ];
       PoliParcial=[ds '*' DentroParentesis];
    PolinomioFinal=[PolinomioFinal signo2 PoliParcial];
    end
end
 
% Muestra de resultados
printf(" Valores de X ");
disp("");
disp(xa);
printf(" Valores de f(X) ");
disp("");
disp(fa);
printf("  Polinomio interpolacion Newton : ");
disp("");
disp(PolinomioFinal);
x=input('Ingrese el valor para probar: ');


xinterp=x;
yinterp=eval(PolinomioFinal);
fprintf(' F(%g) = %g n',x,yinterp);

% Grafica de los puntos
xg=linspace(min(xa),max(xa));
x=xg;yg=eval(PolinomioFinal);
plot(xg,yg,xa,fa,'.r',xinterp,yinterp,'or');
