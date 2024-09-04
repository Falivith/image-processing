function ajuste(arquivo, tipo)
  imagem = imread(arquivo);

  switch tipo
    case 0
      imagem_ajustada = imagem;
      imwrite(imagem_ajustada, ['intens_identidade.bmp']);

    case 1
      min_val = double(min(imagem(:))) / 255;
      max_val = double(max(imagem(:))) / 255;
      imagem_ajustada = imadjust(imagem, [min_val; max_val], [0; 1]);
      imwrite(imagem_ajustada, ['intens_max_min.bmp']);

    case 2
      gama_valores = [0.5, 1, 2];
      for i = 1:length(gama_valores)
        gama = gama_valores(i);
        imagem_ajustada = imadjust(imagem, [], [], gama);
        imwrite(imagem_ajustada, ['intens_corr_gama' num2str(gama) '.bmp']);
      endfor

    otherwise
      imagem_ajustada = imagem;
      imwrite(imagem_ajustada, [nome_arquivo '_ajustada' ext]);
  endswitch
endfunction

