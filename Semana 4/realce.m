function realce(arquivo, tipo)
  imagem = imread(arquivo);
  imagem = double(imagem);

  [linhas, colunas] = size(imagem);

  mascara = [0 1 0; 1 -4 1; 0 1 0];

  imagemRealcada = zeros(linhas, colunas);

  for i = 2:linhas-1
    for j = 2:colunas-1
      janela = imagem(i-1:i+1, j-1:j+1);
      valorRealce = sum(sum(janela .* mascara));
      imagemRealcada(i, j) = valorRealce;
    end
  end

  imagemRealcada = uint8(imagemRealcada);
  imagemComRealce = uint8(imagem - (imagemRealcada * 0.4));

  figure;
  subplot(1, 3, 1);
  imshow(uint8(imagem));
  title('Imagem Original');

  subplot(1, 3, 2);
  imshow(imagemComRealce);
  title('Imagem com Realce');

  subplot(1, 3, 3);
  imshow(imagemRealcada);
  title('Máscara de Realce');

  imwrite(imagemComRealce, 'imagem_realcada.png');
end

