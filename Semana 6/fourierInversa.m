function fourierInversa(arquivo)
  img = imread(arquivo);
  transformada = fft2(img);

  inversa = ifft2(transformada);
  img_reconstruida = abs(inversa);

  figure;

  subplot(1, 2, 1);
  imshow(img, []);
  title('Imagem Original');

  subplot(1, 2, 2);
  imshow(img_reconstruida, []);
  title('Imagem Reconstruída');

  [~, nome_base, ~] = fileparts(arquivo);
  output_name = sprintf('fourier_inv_%s.png', nome_base);

  imwrite(mat2gray(img_reconstruida), output_name);
end
