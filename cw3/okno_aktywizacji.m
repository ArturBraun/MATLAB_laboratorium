function [poziomNiski,poziomWysoki] = okno_aktywizacji(sygnalCalkowity,wydajnoscSkanowania,dlugoscFazyPrzygotowawczej)
    sygnalFazyPrzygotowawczej = sygnalCalkowity(1:5000,1);
    poziomWysoki = max(sygnalFazyPrzygotowawczej);
    minimalnyOkres = 1300;
    liczbaZnalezionychMaskimow = 0;
    maksima = [];
    
    for i = 3:dlugoscFazyPrzygotowawczej-2
        wartoscProbkiMinusDwa = dlugoscFazyPrzygotowawczej(i-2);
        wartoscProbkiMinusJeden = dlugoscFazyPrzygotowawczej(i-1);
        wartoscProbkiPlusJeden = dlugoscFazyPrzygotowawczej(i+1);
        wartoscProbkiPlusDwa = dlugoscFazyPrzygotowawczej(i+2);
        wartoscProbki = dlugoscFazyPrzygotowawczej(i);
        
        if(wartoscProbkiMinusDwa < wartoscProbki && wartoscProbkiMinusJeden < wartoscProbki...
        && wartoscProbkiPlusJeden <= wartoscProbki && wartoscProbkiPlusDwa <= wartoscProbki)
            liczbaZnalezionychMaskimow = liczbaZnalezionychMaskimow + 1;
            maksima(liczbaZnalezionychMaskimow) = i;
        end
        
        
    end
    
end