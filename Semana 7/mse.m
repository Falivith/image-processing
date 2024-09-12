function mse_val = mse(arquivo1, arquivo2)
  % Carregar as imagens
  imagem1 = imread(arquivo1);
  imagem2 = imread(arquivo2);

  % Garantir que as imagens tenham o mesmo tamanho
  if (size(imagem1) != size(imagem2))
    error('As imagens devem ter a mesma resolução.');
  endif

  % Calcular a diferença ao quadrado
  erro_quadratico = (double(imagem1) - double(imagem2)) .^ 2;

  % Calcular o valor médio do erro quadrático
  mse_val = mean(erro_quadratico(:));

  % Imprimir o valor de MSE
  fprintf('O valor de MSE é: %f\n', mse_val);
endfunction

