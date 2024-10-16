function [bpp, PSNR_val] = compc_cp(image_path, qualidade)
    img_data = imread(image_path);

    [~, name, ~] = fileparts(image_path);
    output_filename = [name, '_q', num2str(qualidade), '.jpg'];

    imwrite(img_data, output_filename, 'jpg', 'Quality', qualidade);

    img_jpg = imread(output_filename);

    imshow(img_jpg);
    title(['Imagem com qualidade ', num2str(qualidade)]);

    img_info = imfinfo(output_filename);
    compressed_file_size = img_info.FileSize;
    num_pixels = img_info.Width * img_info.Height;
    bpp = (compressed_file_size * 8) / num_pixels;

    PSNR_val = calculate_psnr(img_data, img_jpg);

    fprintf('Taxa de compressão (bpp): %.2f bits por pixel\n', bpp);
    fprintf('Valor de PSNR: %.2f dB\n', PSNR_val);
end

