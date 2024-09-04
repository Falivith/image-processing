function histograma(arquivo)
  img = imread(arquivo);

  imhist(img);
  title('Histograma Original');

  #cgc(getCurrentFigure) retorna a figura gráfica atual
  saveas(gcf, 'histograma_original.png');

  img_alargada = imadjust(img, stretchlim(img), [0 1]);
  imwrite(img_alargada, 'imagem_contraste_certo.png');

  imhist(img_alargada);
  title('Histograma da Imagem com Contraste Alargado');
  saveas(gcf, 'histograma_alargado.png');
end
