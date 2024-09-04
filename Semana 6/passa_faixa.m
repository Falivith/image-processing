function passa_faixa(imagem)
  [rows, cols] = size(imread(imagem));
  [X, Y] = meshgrid(1:cols, 1:rows);
  centro_x = cols / 2;
  centro_y = rows / 2;
  raio_interno = 30;
  raio_externo = 70;
  distancia = sqrt((X - centro_x).^2 + (Y - centro_y).^2);
  mascara = (distancia >= raio_interno) & (distancia <= raio_externo); % Passa-faixa
  filtra_freq(imagem, mascara);
end
