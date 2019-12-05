function [poziomNiski,poziomWysoki] = okno_aktywizacji(sygnalCalkowity,wydajnoscSkanowania,dlugoscFazyPrzygotowawczej)
    sygnalFazyPrzygotowawczej = sygnalCalkowity(1:dlugoscFazyPrzygotowawczej,1);
    poziomWysoki = max(sygnalFazyPrzygotowawczej);
    
    iloscWyznaczanych = ceil((wydajnoscSkanowania/100) * dlugoscFazyPrzygotowawczej); %zaokraglenie w gore
    posortowanySygnalFazyPrzygotowawczej = sort(sygnalFazyPrzygotowawczej,'descend'); %sortowanie malejaco
    
    poziomNiski = posortowanySygnalFazyPrzygotowawczej(iloscWyznaczanych);    
    
end