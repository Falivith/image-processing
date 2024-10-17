function img_dilatada = dilata(imagem_bin, ES)
    if ischar(imagem_bin)
        img_gray = imread(imagem_bin);
        threshold = 0.4;
        imagem_bin = im2bw(img_gray, threshold);
    end

    if nargin < 2
        ES = [1 1 1; 1 1 1; 1 1 1];
    end

    [m, n] = size(ES);
    origem_ES = floor(size(ES) / 2);
    [linhas, colunas] = size(imagem_bin);
    img_dilatada = false(linhas, colunas);

    for i = 1:linhas
        for j = 1:colunas
            x_start = i - origem_ES(1);
            x_end = i + origem_ES(1);
            y_start = j - origem_ES(2);
            y_end = j + origem_ES(2);

            if x_start >= 1 && x_end <= linhas && y_start >= 1 && y_end <= colunas
                regiao = imagem_bin(x_start:x_end, y_start:y_end);
                if any(regiao(ES == 1))
                    img_dilatada(i, j) = 1;
                end
            end
        end
    end

    output_filename = 'imagem_dilatada.png';
    imwrite(uint8(img_dilatada) * 255, output_filename);
end

