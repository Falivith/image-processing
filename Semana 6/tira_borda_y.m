function tira_borda_y(imagem)
  [rows, cols] = size(imread(imagem));
  mascara = ones(rows, cols);
  mascara(:, cols/2-10:cols/2+10) = 0; % Elimina uma faixa vertical central
  filtra_freq(imagem, mascara);
end
