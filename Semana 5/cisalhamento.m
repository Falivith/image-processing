function cisalhamento(imagem, cv, ch)
  img = imread(imagem);

  [rows, cols] = size(img);

  T = [1  ch  0;
       cv  1  0;
       0   0  1];

  nova_img = zeros(rows, cols);
  for v = 1:rows
    for w = 1:cols
      [x, y] = afim(v, w, T);

      if x >= 1 && x <= rows && y >= 1 && y <= cols
        nova_img(round(x), round(y)) = img(v, w);
      end
    end
  end

  cisalhada = strcat('cisalhada_', imagem);
  imwrite(uint8(nova_img), cisalhada);
end

