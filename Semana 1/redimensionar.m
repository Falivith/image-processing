function novo_arquivo = redimensionar(nome_arquivo, tipo_interpolacao, escala_x, escala_y)
  % Verifica se o arquivo existe
  if exist(nome_arquivo, 'file') != 2
    error('Arquivo não encontrado: %s', nome_arquivo);
  end

  imagem_original = imread(nome_arquivo);
  [linhas, colunas] = size(imagem_original);

  novas_linhas = round(linhas * escala_y);
  novas_colunas = round(colunas * escala_x);

  imagem_redimensionada = zeros(novas_linhas, novas_colunas, 'uint8');

  if tipo_interpolacao == 1
    % Interpolação por vizinho mais próximo
    for i = 1:novas_linhas
      for j = 1:novas_colunas
        i_origem = round(i / escala_y);
        j_origem = round(j / escala_x);

        i_origem = min(max(i_origem, 1), linhas);
        j_origem = min(max(j_origem, 1), colunas);

        imagem_redimensionada(i, j) = imagem_original(i_origem, j_origem);
      end
    end
  elseif tipo_interpolacao == 2
    % Interpolação bilinear
    for i = 1:novas_linhas
      for j = 1:novas_colunas
        i_origem = (i - 0.5) / escala_y + 0.5;
        j_origem = (j - 0.5) / escala_x + 0.5;

        i1 = floor(i_origem);
        i2 = ceil(i_origem);
        j1 = floor(j_origem);
        j2 = ceil(j_origem);

        i1 = min(max(i1, 1), linhas);
        i2 = min(max(i2, 1), linhas);
        j1 = min(max(j1, 1), colunas);
        j2 = min(max(j2, 1), colunas);

        Q11 = double(imagem_original(i1, j1));
        Q12 = double(imagem_original(i1, j2));
        Q21 = double(imagem_original(i2, j1));
        Q22 = double(imagem_original(i2, j2));

        frac_i = i_origem - i1;
        frac_j = j_origem - j1;

        valor_interpolado = (1 - frac_i) * (1 - frac_j) * Q11 + ...
                            (1 - frac_i) * frac_j * Q12 + ...
                            frac_i * (1 - frac_j) * Q21 + ...
                            frac_i * frac_j * Q22;

        imagem_redimensionada(i, j) = round(valor_interpolado);
      end
    end
  else
    error('Tipo de interpolação inválido. Use 1 para vizinho mais próximo ou 2 para bilinear.');
  end

  [caminho, nome, extensao] = fileparts(nome_arquivo);
  novo_arquivo = fullfile(caminho, [nome '_redimensionado' extensao]);
  imwrite(imagem_redimensionada, novo_arquivo);
  disp(['Imagem redimensionada salva como: ' novo_arquivo]);
end
