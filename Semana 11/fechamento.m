function img_fechamento = fechamento(caminho_imagem, ES)
    img_gray = imread(caminho_imagem);
    threshold = 0.4;
    imagem_bin = im2bw(img_gray, threshold);

    if nargin < 2
        ES = [1 1 1; 1 1 1; 1 1 1];
    end

    img_dilatada = dilata(imagem_bin, ES);
    img_fechamento = erosao(img_dilatada, ES);

    output_filename = 'imagem_fechamento.png';
    imwrite(uint8(img_fechamento) * 255, output_filename);
end
