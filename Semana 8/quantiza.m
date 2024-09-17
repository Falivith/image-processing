function quantiza(entrada, bitsR, bitsG, bitsB)
    img = imread(entrada);
    img = im2double(img);

    R = img(:, :, 1);
    G = img(:, :, 2);
    B = img(:, :, 3);

    function canal_quantizado = quantizar_canal(canal, bits)
        niveis = 2^bits;
        passo = 1 / niveis;
        canal_quantizado = floor(canal / passo) * passo + passo / 2;
    end

    Rq = quantizar_canal(R, bitsR);
    Gq = quantizar_canal(G, bitsG);
    Bq = quantizar_canal(B, bitsB);

    img_quantizada = cat(3, Rq, Gq, Bq);

    figure;
    imshow(img_quantizada);
    title(['Quantizada com ', num2str(bitsR), ' bits em R, ', num2str(bitsG), ' bits em G, ', num2str(bitsB), ' bits em B']);

    imwrite(img_quantizada, ['imagem_quantizada_', num2str(bitsR), '_', num2str(bitsG), '_', num2str(bitsB), '.png']);
end

