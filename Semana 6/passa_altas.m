function passa_altas(imagem)
  img = imread(imagem);
  [rows, cols] = size(img);

  centro_x = cols / 2;
  centro_y = rows / 2;

  raio = 50;

  mascara = zeros(rows, cols);
  for y = 1:rows
    for x = 1:cols
      distancia = sqrt((x - centro_x)^2 + (y - centro_y)^2);
      if distancia >= raio
        mascara(y, x) = 1;
      end
    end
  end

  figure;
  imshow(mascara, []);
  title('Máscara Passa-Altas');

  filtra(imagem, mascara);
end

