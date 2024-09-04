function tira_borda_y(imagem)
  img = imread(imagem);
  [rows, cols] = size(img);
  mascara = ones(rows, cols);

  largura_borda = 20;
  faixa_inicial = rows/2 - largura_borda/2;
  faixa_final = rows/2 + largura_borda/2;

  mascara(faixa_inicial:faixa_final, :) = 0;

  figure;
  imshow(mascara, []);
  title('Máscara Remove Borda Vertical');

  filtra(imagem, mascara);
end

