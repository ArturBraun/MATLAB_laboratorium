load('phaseI_data2.mat');
poziomyDawek = cell2mat(phaseI_data(1));
poziomToksycznosci = cell2mat(phaseI_data(2));
dawka = poziomyDawek(1);

iteracja = 0;
iloscZwiekszenMnoznika = 0;
wyborMnoznika = [1.67,1.5,1.4,1.33];
while (1)
    iteracja = iteracja + 1;
    
    if iloscZwiekszenMnoznika+1 > 3
        mnoznik = wyborMnoznika(4);
    elseif iloscZwiekszenMnoznika+1 == 1
        mnoznik = wyborMnoznika(1);
    elseif iloscZwiekszenMnoznika+1 == 2
        mnoznik = wyborMnoznika(2);
    elseif iloscZwiekszenMnoznika+1 == 3
        mnoznik = wyborMnoznika(3);
    end
    
    tmp = sort(poziomToksycznosci(iteracja,:)); 
    
    if tmp(3)~=1
        dawka = dawka*mnoznik;
        iloscZwiekszenMnoznika = iloscZwiekszenMnoznika + 1;
    elseif (tmp(3) == 1 && tmp(2) == 0)
        %dawka pozostaje na tym samym poziomie -> nic sie nie dzieje
    else
        dawka = dawka/mnoznik;
        if iteracja == 1
           dawka = 0; 
        end
        break;
    end    
end

fprintf('Dawka wyznaczona dla II-ej fazy badan cytoksyny, wyznaczona na podstawie wynikow I-ej\nfazy badan wynosi %f [mg]\n\n',...
dawka); 

