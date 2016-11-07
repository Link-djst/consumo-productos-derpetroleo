clc %permite borrar el area de trabajo
clear %permite borrar las variables almacenadas

fprintf('INTERPOLACION "POLINIMIO DE LAGRAGE"\n\n\n');
A = [0 -3 2 -4;0 -84 26 -196];

x = A(1,:);
Fx = A(2,:);


printf(" Valores de X ");
disp("");
disp(x);
printf(" Valores de f(X) ");
disp("");
disp(Fx);

n=length(x);

xa = x;

larange = '';
for j=1:n
  
  Superior ="";
  for i=1:n
    if(i!=j)
      if (x(i)>0)
        signo = '-';
      else
        signo = '+';
      end
      if (i==1)||((i==2)&&(j==1))
        Superior = [Superior '(x' signo num2str(abs(x(i))) ')'];
      else
        Superior = [Superior '.*(x' signo num2str(abs(x(i))) ')'];
      
      end
    end
  end
 
 
  
  Inferior=1;
  for i=1:n
    if(i!=j)
      Inferior=Inferior*(x(j)-x(i)); %calculo del producto 3 inferior de L
    end
  end
  
  
  if ((Fx(j)*Inferior)>0)
     signo2 = '+';
  else
     signo2 = '-';
  end
  if (j==1)
    larange= [larange num2str(abs(Fx(j)/ Inferior)) '*' Superior];
  else
    larange= [larange signo2 num2str(abs(Fx(j)/ Inferior)) '*' Superior];
  end
  
  
  
 end
fprintf('\n POLINOMIO INTERPOLANTE: \n')
disp(larange);
x=input('\nIngrese el punto a aproximar: ');
disp('\nLa aproximacion a f(x) es:')
y=eval(larange); %evaluar el punto en el polinomio
disp(y);

xinterp=x;
yinterp=eval(larange);


% Grafica de los puntos
xg=linspace(min(xa),max(xa));
x=xg;
yg=eval(larange);

plot(xg,yg,xa,Fx,'.r',xinterp,yinterp,'or');
