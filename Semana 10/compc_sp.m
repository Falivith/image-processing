function bpp = compc_sp(image_url)
    [~, name, ext] = fileparts(image_url);
    img_data = imread(image_url);

    output_filename = [name, 'semperda_png.png'];
    imwrite(img_data, output_filename, 'png');

    img_info = imfinfo(output_filename);
    compressed_file_size = img_info.FileSize;

    num_pixels = img_info.Width * img_info.Height;
    bpp = (compressed_file_size * 8) / num_pixels;  % Multiplicar por 8 para converter bytes em bits

    img_loaded = imread(output_filename);
    is_equal = isequal(img_data, img_loaded);

    if is_equal
        fprintf('As imagens são iguais.\n');
    else
        fprintf('As imagens são diferentes.\n');
    end

    fprintf('Taxa de compressão em bits por pixel: %.2f bpp\n', bpp);
end

