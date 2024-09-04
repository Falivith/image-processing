function filtra(imagem, mascara)
  img = imread(imagem);
  transformada = fft2(img);

  transformada_centrada = fftshift(transformada);

  espectro = log(abs(transformada_centrada) + 1);
  [~, nome_base, ~] = fileparts(imagem);
  espectro_nome = sprintf('espectro_%s.png', nome_base);
  imwrite(mat2gray(espectro), espectro_nome);

  transformada_filtrada = transformada_centrada .* mascara;

  transformada_descentralizada = ifftshift(transformada_filtrada);

  inversa = ifft2(transformada_descentralizada);
  img_filtrada = abs(inversa);

  figure;
  imshow(mat2gray(img_filtrada), []);
  title('Imagem Filtrada');

  img_filtrada_nome = sprintf('filtrada_%s.png', nome_base);
  imwrite(mat2gray(img_filtrada), img_filtrada_nome);

  img_filtrada = img_filtrada_nome;
end
