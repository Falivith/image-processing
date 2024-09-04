function rejeita_faixa(imagem)
  img = imread(imagem);
  [rows, cols] = size(img);

  centro_x = cols / 2;
  centro_y = rows / 2;
  raio_interno = 30;
  raio_externo = 70;

  mascara = ones(rows, cols);

  for y = 1:rows
    for x = 1:cols
      distancia = sqrt((x - centro_x)^2 + (y - centro_y)^2);
      if distancia >= raio_interno && distancia <= raio_externo
        mascara(y, x) = 0;
      end
    end
  end

  figure;
  imshow(mascara, []);
  title('Máscara Rejeita Faixa');

  filtra(imagem, mascara);
end
