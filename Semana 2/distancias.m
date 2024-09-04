function [D4, D8, DE, DM, newFile] = distancias(arquivo, Xp, Yp, Xq, Yq)

    img = imread(arquivo);
    bin_img = im2bw(img);

    x1 = Xp;
    y1 = Yp;
    x2 = Xq;
    y2 = Yq;

    D4 = abs(x1 - x2) + abs(y1 - y2);
    D8 = max(abs(x1 - x2), abs(y1 - y2));
    DE = sqrt((x1 - x2)^2 + (y1 - y2)^2);

    % Acho que é a distância média (M dá a entender que é isso, acho que não
    % tava na aula que falamos disso, sorry)
    DM = (D4 + D8 + DE) / 3;

    conectados = false;

    % Se os pontos forem da mesma cor...
    if bin_img(x1, y1) == bin_img(x2, y2)
        conectados = pathfinding(bin_img, [x1 y1], [x2 y2]);
    end

    % Cria o nome do novo arquivo
    [pathstr, name, ext] = fileparts(arquivo);
    newFile = fullfile(pathstr, [name '_binarizada' ext]);

    imwrite(bin_img, newFile);

    fprintf('Distância D4: %d\n', D4);
    fprintf('Distância D8: %d\n', D8);
    fprintf('Distância Euclidiana: %f\n', DE);
    fprintf('Distância Média: %f\n', DM);
    fprintf('Arquivo Binarizado: %s\n', newFile);

    if(conectados)
        fprintf('São pontos conectados');
    end
end

% Função busca em largura (BFS - Breadth-First Search) que resolve o subproblema de pathfinding pra saber
% se os pontos estão conectados. Houve uso de IA aqui, hehe. Mas entendi a ideia.
function conectado = pathfinding(bin_img, P, Q)
    conectado = false;

    [rows, cols] = size(bin_img);

    fila = [P];
    visitado = false(rows, cols);
    visitado(P(1), P(2)) = true;

    movimentos = [0 1; 1 0; 0 -1; -1 0];

    while ~isempty(fila)
        ponto = fila(1, :);
        fila(1, :) = [];

        for i = 1:size(movimentos, 1)
            novo_ponto = ponto + movimentos(i, :);
            if novo_ponto(1) > 0 && novo_ponto(1) <= rows && novo_ponto(2) > 0 && novo_ponto(2) <= cols
                if ~visitado(novo_ponto(1), novo_ponto(2)) && bin_img(novo_ponto(1), novo_ponto(2)) == bin_img(P(1), P(2))
                    if isequal(novo_ponto, Q)
                        conectado = true;
                        return;
                    end
                    fila = [fila; novo_ponto];
                    visitado(novo_ponto(1), novo_ponto(2)) = true;
                end
            end
        end
    end
end
