%czyszczenie przestrzeni roboczej i zamykanie wszystkich wykresow 
clear
close
%Ustawianie wartosci parametrow T oraz A
T = 1;
A = 1;

%Glowna petla oraz pobieranie danych od uzytkownika
x = 1;
while x == 1
    %pobieranie danych od uzytkownika i odpowiednie zachowanie aplikacji
    %na ewentualne bledy pobranych danych
    try
        zacheta = sprintf('WprowadŸ wartoœæ kroku wyznaczania wartoœci funckji prostokatnej o okresie równym %d: ',T);
        dt = input(zacheta);
        if dt>T
            disp('UWAGA: Wprowadzi³eœ krok wiêkszy od okresu funkcji prostokatnej.');
            throw(ME)
        elseif dt<=0
            disp('UWAGA: Wprowadzi³eœ ujemny krok. Krok musi byc wiêkszy od zera.')
            throw(ME)
        else
            x = 0;
        end
    catch ME
        exit = input('Chcesz zakoñczyæ (T/N)? ','s');
        if strcmp(exit,'T') || strcmp(exit,'t')
            disp('Dzia³anie skryptu zosta³o zakoñczone!')
            x = -1;
        else
            disp('Ponownie wprowadŸ wartoœæ kroku')
        end
    end
end

%Wykonywanie sie dzialania programu w przypadku podania poprawnych danych
%przez uzytkownika

if x==0
    
    dt = 0.01;
    t = -1.1:dt:1.1;
    k = 1;
    n = 100;
    mseErr = 1;

    prostsyg = prostokat([-1.1 1.1], dt);

    while mseErr>0.02 && k<=100 && (1/dt)>=(2/T)
        %F = szeregF([-1.1 1.1], dt, k);
        F = szereg_opt([-1.1 1.1], dt, k);
        mseErr = mseError(F, prostsyg);
        k = k+1;
    end
    nmin = k;
end

for i=1:nmin
    tic;
    %F = szeregF([-1.1 1.1], dt, i);
    F = szereg_opt([-1.1 1.1], dt, i);
    czasOstatniegoWywolania = toc;
    
    plot(t,prostsyg,t,F);
    pause(0.1);
end

%Uzywane funkcje w programie

function mseErr = mseError(estymator, wartosc)

mseErr = sqrt(mean((estymator-wartosc).^2));

end

function prostsyg = prostokat(t, delta_t)

tt = t(1):delta_t:t(2);
prostsyg = sign(sin(tt));

end

function F = szeregF(t, delta_t, n)

i = 0;                                                            
tt = t(1):delta_t:t(2);
N = 0:n-1;
F = zeros(size(tt));

for ii = tt                                                 
  i = i + 1;                                                                                                             
  for k = N                                                 
    F(i) = F(i) + 1 / (2*k + 1) * sin(2*(2*k + 1)*pi*ii/(t(2)*2));
  end                                                             
  F(i) = F(i) * 4/pi;                                           
end                                                                

end