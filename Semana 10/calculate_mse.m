function mse_val = calculate_mse(image1, image2)

    if size(image1, 3) == 3
        image1 = rgb2gray(image1);
    end

    if size(image2, 3) == 3
        image2 = rgb2gray(image2);
    end

    if ~isequal(size(image1), size(image2))
        error('As imagens devem ter o mesmo tamanho para calcular o MSE.');
    end

    mse_val = sum((double(image1(:)) - double(image2(:))).^2) / numel(image1);
end
