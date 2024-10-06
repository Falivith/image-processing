function wavelets(arquivo_imagem)
  imagem = imread(arquivo_imagem);
  # não consegui importar o dwt2
  [cA_haar, cH_haar, cV_haar, cD_haar] = dwt2(imagem, 'haar', 'mode', 'per');
  [cA_db10, cH_db10, cV_db10, cD_db10] = dwt2(imagem, 'db10', 'mode', 'per');
endfunction
