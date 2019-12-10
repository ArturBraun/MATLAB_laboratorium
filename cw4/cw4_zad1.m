
for N = 100:100:1000
    % Podpunkt a
    A = rand(N,N);

    % Podpunkt b
    B = A;

    % Podpunkt c
    tic;
    for rzad = 1:N
        for kolumna = 1:N
           if B(rzad,kolumna) > 0.5
               B(rzad,kolumna) = 1;
           end
        end
    end
    czas_c = toc;

    % Podpunkt d
    C = A;

    % Podpunkt e
    tic;

    czas_e = toc;

    % Podpunkt f
    D = A;

    % Podpunkt g
    tic;
    D(D>0.5) = 1;
    czas_g = toc;

end






    