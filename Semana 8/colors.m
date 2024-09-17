function colors(imagem_rgb)
    img = imread(imagem_rgb);

  img = im2double(img);

  R = img(:, :, 1);
  G = img(:, :, 2);
  B = img(:, :, 3);

  img_vermelha = cat(3, R, zeros(size(G)), zeros(size(B)));
  img_verde = cat(3, zeros(size(R)), G, zeros(size(B)));
  img_azul = cat(3, zeros(size(R)), zeros(size(G)), B);

  figure;

  subplot(2, 3, 1);
  imshow(img_vermelha);
  title('Vermelho');

  subplot(2, 3, 2);
  imshow(img_verde);
  title('Verde');

  subplot(2, 3, 3);
  imshow(img_azul);
  title('Azul');

  subplot(2, 3, 4);
  imshow(R);
  title('Intensidade Vermelho (Escala de Cinza)');

  subplot(2, 3, 5);
  imshow(G);
  title('Intensidade Verde (Escala de Cinza)');

  subplot(2, 3, 6);
  imshow(B);
  title('Intensidade Azul (Escala de Cinza)');
end

