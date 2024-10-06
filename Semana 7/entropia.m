function entropia(arquivo_imagem)
  imagem = imread(arquivo_imagem);
  histograma = imhist(imagem);
  total_pixels = numel(imagem);
  probabilidade = histograma / total_pixels;
  probabilidade(probabilidade == 0) = [];

  H = -sum(probabilidade .* log2(probabilidade));
  fprintf('A entropia da imagem é: %f\n', H);

  figure;
  bar(0:255, histograma);
  title('Histograma da Imagem');
  xlabel('Intensidade de Pixels');
  ylabel('Frequência');
endfunction
