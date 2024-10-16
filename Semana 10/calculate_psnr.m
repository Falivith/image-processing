function psnr_val = calculate_psnr(arquivo1, arquivo2)
    mse_val = calculate_mse(arquivo1, arquivo2);
    pixel_max = 255;
    psnr_val = 10 * log10((pixel_max^2) / mse_val);
end
