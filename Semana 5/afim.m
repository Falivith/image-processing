function [x, y] = afim(v, w, T)

  % Pra não ter que passar toda vez pelo arg
  if nargin < 3
    T = [cos(pi/4) -sin(pi/4) 2;
         sin(pi/4)  cos(pi/4) 3;
         0          0         1];
  end

  coords_entrada = [v; w; 1];

  coords_saida = T * coords_entrada;

  x = coords_saida(1);
  y = coords_saida(2);
end

