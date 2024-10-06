function gerar_ruido(imagemEntrada)
    img = imread(imagemEntrada);

    % gaussiano média 0 variância 0.01
    gaussian_noise_1 = imnoise(img, 'gaussian', 0, 0.01);
    imwrite(gaussian_noise_1, 'gaussian_0_0_01.png');

    % gaussiano media 30 e variância 0.01
    img_bright_30 = im2double(img) + 30/255;
    gaussian_noise_2 = imnoise(img_bright_30, 'gaussian', 0, 0.01);
    imwrite(gaussian_noise_2, 'gaussian_30_0_01.png');

    % gaussiano media 50 e variância 0.05
    img_bright_50 = im2double(img) + 50/255;
    gaussian_noise_3 = imnoise(img_bright_50, 'gaussian', 0, 0.05);
    imwrite(gaussian_noise_3, 'gaussian_50_0_05.png');

    % poisson
    poisson_noise = imnoise(img, 'poisson');
    imwrite(poisson_noise, 'poisson.png');

    % salt & pepper afetando 2% dos pixels
    salt_pepper_noise_2 = imnoise(img, 'salt & pepper', 0.02);
    imwrite(salt_pepper_noise_2, 'salt_pepper_2pct.png');

    %  salt & pepper afetando 10% dos pixels
    salt_pepper_noise_10 = imnoise(img, 'salt & pepper', 0.10);
    imwrite(salt_pepper_noise_10, 'salt_pepper_10pct.png');
end

