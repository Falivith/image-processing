function restaura(imagemEntrada, N, tipoFiltro)
    img = imread(imagemEntrada);
    img = im2double(img);

    if strcmp(tipoFiltro, 'average')
        filtro = fspecial('average', [N N]);
        img_filtrada = imfilter(img, filtro, 'replicate');
    elseif strcmp(tipoFiltro, 'mediana')
        img_filtrada = medfilt2(img, [N N]);
    else
        error('Tipo de filtro inválido. Use ''average'' ou ''mediana''.');
    end

    img_filtrada = im2uint8(img_filtrada);
    [pathstr, name, ext] = fileparts(imagemEntrada);
    figura_out = fullfile(pathstr, [name, '_', tipoFiltro, '_', num2str(N), ext]);

    imwrite(img_filtrada, figura_out);
    disp(['Imagem restaurada salva como: ', figura_out]);
end

