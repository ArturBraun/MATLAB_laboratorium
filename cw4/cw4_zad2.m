%% Porownanie czasow dzialania obu kodow
clear;
close;

tic; 
tabmnoz_a = tabmnoz_a(5);
czas_tabmnoz_a = toc

tic; 
tabmnoz_b = tabmnoz_b(5);
czas_tabmnoz_b = toc

czas_tabmnoz_a - czas_tabmnoz_b

%% Uzyskanie wykresu
clear;
close;

czas_a = zeros(1,200);
for i=1:200
    tic;
    tabmnoz_a(i);
    czas_a(i) = toc;
end

czas_b = zeros(1,200);
for i=1:200
    tic;
    tabmnoz_b(i);
    czas_b(i) = toc;
end

figure(1);
hold on;
plot(1:200,czas_a,'b');
plot(1:200,czas_b,'m');
title('czas(N)');
xlabel('N');
ylabel('czas');
legend('petla for', 'bez petli');
hold off;



