function ycbcr(entrada, bitsY, bitsCb, bitsCr)
    img_rgb = imread(entrada);
    img_rgb = im2double(img_rgb);

    img_ycbcr = rgb2ycbcr(img_rgb);

    Y = img_ycbcr(:, :, 1);
    Cb = img_ycbcr(:, :, 2);
    Cr = img_ycbcr(:, :, 3);

    % quantização utilizada será: QIMG = floor(IMG / Q) * Q + Q / 2,
    % onde Q = 1 / (2^bits - 1), baseado no número de bits para cada canal.

    function quantizado = quantizar_canal(canal, bits)
        Q = 1 / (2^bits - 1);
        quantizado = floor(canal / Q) * Q + Q / 2;
    end

    Yq = quantizar_canal(Y, bitsY);
    Cbq = quantizar_canal(Cb, bitsCb);
    Crq = quantizar_canal(Cr, bitsCr);

    img_ycbcr_quantizada = cat(3, Yq, Cbq, Crq);

    img_rgb_quantizada = ycbcr2rgb(img_ycbcr_quantizada);

    figure;
    subplot(1, 2, 1);
    imshow(img_rgb);
    title('Imagem Original');

    subplot(1, 2, 2);
    imshow(img_rgb_quantizada);
    title(['Imagem Quantizada: Y(', num2str(bitsY), ' bits), Cb(', num2str(bitsCb), ' bits), Cr(', num2str(bitsCr), ' bits)']);

    imwrite(img_rgb_quantizada, 'imagem_quantizada.png');
end

