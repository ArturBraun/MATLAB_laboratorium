%% Porownanie czasow dzialania obu kodow
clear;
close;

tic; 
tabmnoz_a = tabmnoz_a(200);
czas_tabmnoz_a = toc

tic; 
tabmnoz_b = tabmnoz_b(200);
czas_tabmnoz_b = toc

czas_tabmnoz_b / czas_tabmnoz_a

%% Uzyskanie wykresu
clear;
close;

czas_a = zeros(1,200);
czas_b = zeros(1,200);
for i=1:200
    tic;
    for licznik = 1:1000
    tabmnoz_a(i);
    end
    czas_a(i) = toc/1000;
    
    tic;
    for licznik = 1:1000
    tabmnoz_b(i);
    end
    czas_b(i) = toc/1000;
end

figure(1);
hold on;
plot(1:200,czas_a,'b');
plot(1:200,czas_b,'m');
title('czas(N)');
xlabel('N');
ylabel('czas');
%legend('petla for', 'bez petli');
hold off;



