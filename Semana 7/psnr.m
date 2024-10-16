function psnr_val = calculate_psnr(arquivo1, arquivo2)
    mse_val = immse(arquivo1, arquivo2);  % Usar immse para calcular MSE
    pixel_max = 255;  % Considerando imagem de 8 bits (0 a 255)
    psnr_val = 10 * log10((pixel_max^2) / mse_val);  % Cálculo do PSNR
end
