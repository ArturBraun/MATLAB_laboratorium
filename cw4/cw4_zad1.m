%N=100;

czas_c = zeros(1,10);
czas_e = zeros(1,10);
czas_g = zeros(1,10);
wspol_e_c = zeros(1,10);
wspol_g_c = zeros(1,10);
    
for N = 100:100:1000    
    % Podpunkt a
    A = rand(N,N);
    
    % Podpunkt b
    B = A;

    % Podpunkt c -> porzadek wierszowy
    tic;
    for licznik = 1:1000
        for rzad = 1:N
            for kolumna = 1:N
               if B(rzad,kolumna) > 0.5
                   B(rzad,kolumna) = 1;
               end
            end
        end
    end
    czas_c(N/100) = toc/1000;

    % Podpunkt d
    C = A;

    % Podpunkt e -> porzadek kolumnowy
    tic;
    for licznik = 1:1000
        for kolumna = 1:N
           for rzad = 1:N
              if C(rzad,kolumna) > 0.5
                   C(rzad,kolumna) = 1;
              end
           end
        end
    end
    czas_e(N/100) = toc/1000;

    % Podpunkt f
    D = A;

    % Podpunkt g
    tic;
    for licznik = 1:1000
        D(D>0.5) = 1;
    end
    czas_g(N/100) = toc/1000;
    
    % Wspolczynnik poprawy efektywnosci kodu    
    % wpolczynnik e/c
    wspol_e_c(N/100) = czas_e(N/100)/czas_c(N/100);
    % wpolczynnik g/c
    wspol_g_c(N/100) = czas_g(N/100)/czas_c(N/100);

end

figure(1)
plot(100:100:1000,czas_c,'*--r');
hold on;
plot(100:100:1000,czas_e,'*--b');
plot(100:100:1000,czas_g,'*--m');
hold off;
xlabel('N');
ylabel('czas');
legend('podpunkt C','podpunkt E','podpunkt G');

% %wykres dla podpunktu c
% figure(1)
% plot(100:100:1000,czas_c,'*--r');
% title('Podpunkt C');
% xlabel('N');
% ylabel('czas');
% 
% %wykres dla podpunktu e
% %figure(2)
% plot(100:100:1000,czas_e,'*--b');
% title('Podpunkt E');
% xlabel('N');
% ylabel('czas');
% 
% %wykres dla podpunktu g
% figure(3)
% plot(100:100:1000,czas_g,'*--m');
% title('Podpunkt G');
% xlabel('N');
% ylabel('czas');




    