function filtra(imagem, mascara)
  img = imread(imagem);

  % 2. Aplicar a Transformada de Fourier à imagem
  transformada = fft2(img);

  % 3. Posicionar a frequência zero no centro
  transformada_centrada = fftshift(transformada);

  % 4. Exibir e salvar o espectro de Fourier
  espectro = log(abs(transformada_centrada) + 1); % +1 para evitar log(0)
  imshow(mat2gray(espectro), []);
  [~, nome_base, ~] = fileparts(imagem);
  espectro_nome = sprintf('espectro_%s.png', nome_base);
  imwrite(mat2gray(espectro), espectro_nome);

  % 5. Aplicar a máscara/filtro utilizando multiplicação
  transformada_filtrada = transformada_centrada .* mascara;

  % 6. Colocar o espectro novamente na posição original
  transformada_descentralizada = ifftshift(transformada_filtrada);

  % 7. Reconstruir a imagem filtrada usando a Transformada de Fourier Inversa
  inversa = ifft2(transformada_descentralizada);
  img_filtrada = abs(inversa); % Pegar apenas a parte real para a imagem filtrada

  % 8. Exibir a nova imagem filtrada
  figure;
  imshow(mat2gray(img_filtrada), []);
  title('Imagem Filtrada');

  % 9. Salvar a imagem filtrada
  img_filtrada_nome = sprintf('filtrada_%s.png', nome_base);
  imwrite(mat2gray(img_filtrada), img_filtrada_nome);

  % 10. Retornar o nome do arquivo gerado
  img_filtrada = img_filtrada_nome;
end
