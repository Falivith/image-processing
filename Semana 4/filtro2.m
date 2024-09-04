function filtro2(arquivo, tipo)
  imagem = imread(arquivo);
  imagem = double(imagem);

  filtro_suavizacao = [0 1 0; 1 1 1; 0 1 0] / 5;
  filtro_realce = [0 1 0; 1 -4 1; 0 1 0];
  filtro_passa_baixas = (1/44) * [0 0 -4 0 0; 0 0 10 0 0; -4 10 20 10 -4; 0 0 10 0 0; 0 0 -4 0 0];

  switch tipo
    case 'suavizacao'
      imagemFiltrada = filter2(filtro_suavizacao, imagem, 'same');
      titulo = 'Imagem Suavizada';
    case 'realce'
      imagemFiltrada = filter2(filtro_realce, imagem, 'same');
      imagemFiltrada = imagem - (imagemFiltrada * 0.4);  % Ajuste de contraste
      titulo = 'Imagem com Realce';
    case 'passa_baixas'
      imagemFiltrada = filter2(filtro_passa_baixas, imagem, 'same');
      titulo = 'Imagem com Filtro Passa-Baixas';
    otherwise
      error('Tipo de filtro desconhecido.');
  end

  imagemFiltrada = uint8(imagemFiltrada);

  figure;
  subplot(1, 2, 1);
  imshow(uint8(imagem));
  title('Imagem Original');

  subplot(1, 2, 2);
  imshow(imagemFiltrada);
  title(titulo);

  imwrite(imagemFiltrada, 'imagem_filtrada.png');
end

