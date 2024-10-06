function hsi(imagem_rgb)
  img = imread(imagem_rgb);
  img = imresize(img, [512, 512]);

  img = im2double(img);
  R = img(:, :, 1);
  G = img(:, :, 2);
  B = img(:, :, 3);

  [rows, cols] = size(R);
  H = zeros(rows, cols);
  S = zeros(rows, cols);
  I = zeros(rows, cols);

  for i = 1:rows
    for j = 1:cols
      r = R(i, j);
      g = G(i, j);
      b = B(i, j);

      % Intensidade
      I(i, j) = (r + g + b) / (3);

      % Saturação
      min_rgb = min([r, g, b]);
      if I(i, j) == 0
        S(i, j) = 0;
      else
        S(i, j) = 1 - (min_rgb / I(i, j));
      end

      % Matiz
      num = 0.5 * ((r - g) + (r - b));
      den = sqrt((r - g)^2 + (r - b) * (g - b));
      if den == 0
        H(i, j) = 0;
      else
        theta = acos(num / den);
        if b > g
          H(i, j) = 2 * pi - theta;
        else
          H(i, j) = theta;
        end
      end

      % Normalizar o canal H para o intervalo [0, 1]
      H(i, j) = H(i, j) / (2 * pi);
    end
  end

  figure;

  subplot(1, 3, 1);
  imshow(H);
  title('Canal H (Matiz)');

  subplot(1, 3, 2);
  imshow(S);
  title('Canal S (Saturação)');

  subplot(1, 3, 3);
  imshow(I);
  title('Canal I (Intensidade)');
end

