function img_erodida = erosao(caminho_imagem)
    img_gray = imread(caminho_imagem);

    threshold = 0.5;
    imagem_bin = im2bw(img_gray, threshold);

    e_estruturante = [1 1 1; 1 1 1; 1 1 1];

    [m, n] = size(e_estruturante);
    origem_ES = floor(size(e_estruturante) / 2);

    [linhas, colunas] = size(imagem_bin);

    img_erodida = false(linhas, colunas);

    for i = 1:linhas
        for j = 1:colunas
            x_start = i - origem_ES(1);
            x_end = i + origem_ES(1);
            y_start = j - origem_ES(2);
            y_end = j + origem_ES(2);

            if x_start >= 1 && x_end <= linhas && y_start >= 1 && y_end <= colunas
                regiao = imagem_bin(x_start:x_end, y_start:y_end);

                if all(regiao(e_estruturante == 1))
                    img_erodida(i, j) = 1;
                end
            end
        end
    end

    output_filename = 'imagem_erodida.png';
    imwrite(uint8(img_erodida) * 255, output_filename);

    img_erodida = output_filename;
end

