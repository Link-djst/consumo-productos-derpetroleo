function [a] = regression( X, Y, N)
  format long
  m = [];
  xf = [];
  y_average = sum(Y)/length(Y)
  %a = [a0, a1,.., an]

  %crear la matriz segun el N orden
  for idx = 0:N
      m = [m, X.^idx];
  end

  %obtener los parametros
  mt = transpose(m);
  mt_m = (mt*m);
  mt_y = mt*Y;
  a = mt_m\mt_y;

  %calcular el resultado
  r = m*a;

  %calcular error
  R_tot = transpose(r - y_average)*(r - y_average)
  R_res = transpose(r - Y)*(r - Y)
  R_squared = 1 - R_res/R_tot
  %plotear info
  fig = figure()
  set(fig, 'color', 'white')
  plot(X, Y, 'r*')
  hold on
  grid on
  plot(X, r)

end
