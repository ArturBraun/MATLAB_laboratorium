clear all
close

T = 1;
A = 1;

x = 1;
while x == 1
    try
        zacheta = sprintf('Wprowad� warto�� kroku wyznaczania warto�ci funckji prostokatnej o okresie r�wnym %d: ',T);
        dt = input(zacheta);
        if dt>T
            disp('UWAGA: Wprowadzi�e� krok wi�kszy od okresu funkcji prostokatnej.');
            throw(ME)
        elseif dt<=0
            disp('UWAGA: Wprowadzi�e� ujemny krok. Krok musi byc wi�kszy od zera.')
            throw(ME)
        else
            x = 0;
        end
    catch ME
        exit = input('Chcesz zako�czy� (T/N)? ','s');
        if strcmp(exit,'T') || strcmp(exit,'t')
            disp('Dzia�anie skryptu zosta�o zako�czone!')
            x = -1;
        else
            disp('Ponownie wprowad� warto�� kroku')
        end
    end
end

if x==0
    
    dt = 0.01;
    t = -1.1:dt:1.1
    k = 1;
    n = 100;
    mseErr = 1;

    prostsyg = prostokat([-1.1 1.1], dt);

    while mseErr>0.02 && (k<=100 || % TODO krytrium wynikaj�ce z twierdzenia o pr�bkowaniu
        F = szeregF([-1.1 1.1], dt, k);
        mseErr = mseError(F, prostsyg)
        k = k+1;
    end
    nmin = k;
end

for i=1:nmin
    F = szeregF([-1.1 1.1], dt, i);
    plot(t,prostsyg,F);
    pause(0.1);
end


function mseErr = mseError(estymator, wartosc)

sqrt(mean((estymator-wartosc)^2));

end

function prostsyg = prostokat(t, delta_t)

tt = t(1):delta_t:t(2);
prostsyg = sign(sin(tt));

end

function FF = szeregF(t, delta_t, n)

i = 0;                                                            
tt = t(1):delta_t:t(2);
N = 0:n-1;
F = zeros(size(tt));

for ii = tt                                                 
  i = i + 1;                                                                                                             
  for k = N                                                 
    F(i) = F(i) + 1 / (2*k + 1) * sin(2*2*k + 1*pi*i);
  end                                                             
  F(i) = F(i) * 4/pi;                                           
end                                                                

end