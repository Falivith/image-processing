function mse_val = mse(arquivo1, arquivo2)
  imagem1 = imread(arquivo1);
  imagem2 = imread(arquivo2);

  if (size(imagem1) != size(imagem2))
    error('As imagens devem ter a mesma resolução.');
  endif

  erro_quadratico = (double(imagem1) - double(imagem2)) .^ 2;

  mse_val = mean(erro_quadratico(:));

  fprintf('O valor de MSE é: %f\n', mse_val);
endfunction

