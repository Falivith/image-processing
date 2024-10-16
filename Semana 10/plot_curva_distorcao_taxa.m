function plot_curva_distorcao_taxa(image_path)
    qualidades = [0, 20, 40, 60, 80, 100];

    bpps = zeros(1, length(qualidades));
    psnrs = zeros(1, length(qualidades));

    for i = 1:length(qualidades)
        [bpp, psnr_val] = compc_cp(image_path, qualidades(i));
        bpps(i) = bpp;
        psnrs(i) = psnr_val;
    end

    figure;
    plot(bpps, psnrs, '-o', 'LineWidth', 2, 'MarkerSize', 8);
    xlabel('Bits per Pixel (bpp)');
    ylabel('PSNR (dB)');
    title('Curva Taxa vs Distorção');
    grid on;
end

