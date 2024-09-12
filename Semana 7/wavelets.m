function wavelets(arquivo_imagem)
  imagem = imread(arquivo_imagem);

  [cA_haar, cH_haar, cV_haar, cD_haar] = dwt2(imagem, 'haar', 'mode', 'per');
  [cA_db10, cH_db10, cV_db10, cD_db10] = dwt2(imagem, 'db10', 'mode', 'per');

  figure;

  subplot(2, 4, 1); imshow(imagem, []); title('Imagem Original');
  subplot(2, 4, 2); imshow(cA_haar, []); title('cA (Haar)');
  subplot(2, 4, 3); imshow(cH_haar, []); title('cH (Haar)');
  subplot(2, 4, 4); imshow(cV_haar, []); title('cV (Haar)');
  subplot(2, 4, 5); imshow(cD_haar, []); title('cD (Haar)');

  subplot(2, 4, 6); imshow(cA_db10, []); title('cA (db10)');
  subplot(2, 4, 7); imshow(cH_db10, []); title('cH (db10)');
  subplot(2, 4, 8); imshow(cV_db10, []); title('cV (db10)');
  subplot(2, 4, 9); imshow(cD_db10, []); title('cD (db10)');
endfunction
