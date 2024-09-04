function suaviza(arquivo, tipo)
  imagem = imread(arquivo);

  [linhas, colunas] = size(imagem)

  mascara = [1 2 1; 2 4 2; 1 2 1];
  mascara = mascara / 16;

  disp(mascara)

  for i = 2:linhas-1
    for j = 2:colunas-1

      janela = imagem(i-1:i+1, j-1:j+1);

      valorSuavizado = sum(sum(janela .* mascara));

      imagemSuavizada(i, j) = valorSuavizado;
    end
  end
  imagemSuavizada = uint8(imagemSuavizada);

  subplot(1, 2, 1);
  imshow(imagem);
  title('Imagem Original');

  subplot(1, 2, 2);
  imshow(imagemSuavizada);
  title('Imagem Suavizada');

  imagemSuavizada = uint8(imagemSuavizada);
  imwrite(imagemSuavizada, 'imagem_suavizada.png');
end

