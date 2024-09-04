function passa_baixas(imagem)
  [rows, cols] = size(imread(imagem));
  [X, Y] = meshgrid(1:cols, 1:rows);
  centro_x = cols / 2;
  centro_y = rows / 2;
  raio = 50; % Raio da região passa-baixas
  distancia = sqrt((X - centro_x).^2 + (Y - centro_y).^2);
  mascara = distancia <= raio; % Mantém apenas as frequências baixas
  filtra_freq(imagem, mascara);
end
