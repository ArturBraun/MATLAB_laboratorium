function [chwileCzasowe,wektorLogiczny] = alerthr(wartosciHR, f)
    chwileCzasowe = []; wektorLogiczny = [];
    
    if isempty(wartosciHR)
        disp('BLAD -> zostala podana pusta macierz jako argument funckji');
        return;
    end
    
    chwileCzasowe = -2;
    liczbaWykrytychChwil = 0;
    
    for i = 6:length(wartosciHR)
       srednia = (wartosciHR(i-1)+wartosciHR(i-2)+wartosciHR(i-3)+wartosciHR(i-4)+wartosciHR(i-5))/5;
       
       % ceil() -> zaokragla wynik do gory
       if srednia*1.2 < wartosciHR(i)
           liczbaWykrytychChwil = liczbaWykrytychChwil + 1;
           chwileCzasowe(liczbaWykrytychChwil) = ceil((i*(1/f))/60); 
           wektorLogiczny(liczbaWykrytychChwil) = 1;
       
       elseif srednia*0.8 > wartosciHR(i)
           liczbaWykrytychChwil = liczbaWykrytychChwil + 1;
           chwileCzasowe(liczbaWykrytychChwil) = ceil((i*(1/f))/60);
           wektorLogiczny(liczbaWykrytychChwil) = -1;
       end
       
    end
end