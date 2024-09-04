function novo_arquivo = distancias(nome_arquivo, Xp, Yp, Xq, Yq)
  if exist(nome_arquivo, 'file') != 2
    error('Arquivo não encontrado: %s', nome_arquivo);
  end

  imagem_original = imread(nome_arquivo);

  pb_imagem = im2bw (imagem_original);

  imshow(pb_imagem)


end
