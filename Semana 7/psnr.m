function psnr(arquivo1, arquivo2)
  mse_val = mse(arquivo1, arquivo2);

  pixel_max = 255;

  psnr_val = 10 * log10((pixel_max^2) / mse_val);

  fprintf('O valor de PSNR é: %f dB\n', psnr_val);
endfunction
