function img_abertura = abertura(caminho_imagem, ES)
    img_gray = imread(caminho_imagem);
    threshold = 0.3;
    imagem_bin = im2bw(img_gray, threshold);

    if nargin < 2
        ES = [1 1 1; 1 1 1; 1 1 1];
    end

    img_erodida = erosao(imagem_bin, ES);
    img_abertura = dilata(img_erodida, ES);

    output_filename = 'imagem_abertura.png';
    imwrite(uint8(img_abertura) * 255, output_filename);
end
