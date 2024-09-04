function imfronteira = fronteira(arquivo, tipo, Xp, Yp)
  img = imread(arquivo);

  img_bin = im2bw(img);

  [linhas, colunas] = size(img_bin);
  imfronteira = zeros(linhas, colunas);

  if Xp < 1 || Xp > linhas || Yp < 1 || Yp > colunas
    error('Coordenadas fora dos limites da imagem.');
  end

  queue = [Xp, Yp];
  visited = false(linhas, colunas);
  visited(Xp, Yp) = true;

  while ~isempty(queue)
    [x, y] = queue(1, :);
    queue(1, :) = [];

    if tipo == 0 && img_bin(x, y) == 1
      imfronteira(x, y) = 1;
    elseif tipo == 1 && img_bin(x, y) == 0
      imfronteira(x, y) = 1;
    end

    neighbors = [x-1, y; x+1, y; x, y-1; x, y+1];
    for k = 1:size(neighbors, 1)
      nx = neighbors(k, 1);
      ny = neighbors(k, 2);

      if nx >= 1 && nx <= linhas && ny >= 1 && ny <= colunas && ~visited(nx, ny)
        if tipo == 0 && img_bin(nx, ny) == 1
          queue = [queue; nx, ny];
          visited(nx, ny) = true;
        elseif tipo == 1 && img_bin(nx, ny) == 0
          queue = [queue; nx, ny];
          visited(nx, ny) = true;
        end
      end
    end
  end

  imfronteira = ~imfronteira;

  if(tipo == 1)
    imwrite(imfronteira, 'fronteira_externa.png');
  elseif(tipo == 0)
    imwrite(imfronteira, 'fronteira_interna.png');
  end

end
