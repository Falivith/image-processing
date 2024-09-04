function fourier(arquivo)
  img = imread(arquivo);
  transformada = fft2(img);

  trans_abs = abs(transformada);
  trans_log = log(trans_abs);
  trans_shift = log(abs(fftshift(transformada)));

  figure;

  subplot(1, 3, 1);
  imshow(trans_abs, []);
  title('Módulo');

  subplot(1, 3, 2);
  imshow(trans_log, []);
  title('Módulo Log()');

  subplot(1, 3, 3);
  imshow(trans_shift, []);
  title('Módulo Log() Centralizado');

  [~, nome_base, ~] = fileparts(arquivo);
  output_name = sprintf('fourier_%s.png', nome_base);

  imwrite(mat2gray(trans_shift), output_name);
end
