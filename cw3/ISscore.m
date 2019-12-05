% ladowanie danych z pliku
load('ais.mat');
% Sprawdzanie poprawnoœci nazw danych pól
poprawneNazwyPol = {'head','face','chest','abdomen','extremities','external','iss'}';
%fieldnames(S) - zwraca nazwy pol z struktury S jako typ cell
%strcmp(A,B) - porownuje wartosci pol w A z B i zwraca tablice logiczna
%ismember(C,D) - sprawdza czy C nale¿y do D i zwraca 1 kiedy nale¿y, lub 0
if (ismember(0,strcmp(poprawneNazwyPol(1:6),fieldnames(ais)))) 
    disp('BLAD -> nazwy pol struktury danych nie sa zgodne z nastepujacymi nazwami: head, face, chest, abdomen, extremities, external'); 
else
    [rozmiarX,rozmiarY] = size(ais);
    rozmiarZaladowanychStruktur = rozmiarX*rozmiarY;
    pobraneDaneZeStruktur = zeros(rozmiarZaladowanychStruktur,6);
    
    for i = 1:rozmiarZaladowanychStruktur
        pobraneDaneZeStruktur(i,:) = [ais(i).(poprawneNazwyPol{1}), ais(i).(poprawneNazwyPol{2}), ais(i).(poprawneNazwyPol{3}),...
        ais(i).(poprawneNazwyPol{4}), ais(i).(poprawneNazwyPol{5}),ais(i).(poprawneNazwyPol{6})];
        
        ais(i).(poprawneNazwyPol{7}) = wyznaczISS(pobraneDaneZeStruktur(i,:));
        
        fprintf('[%d]Pacjent:\nhead: %d \nface: %d \nchest: %d \nabdomen: %d',...
        i,ais(i).(poprawneNazwyPol{1}), ais(i).(poprawneNazwyPol{2}), ais(i).(poprawneNazwyPol{3}), ais(i).(poprawneNazwyPol{4})); 
        fprintf('\nextremities: %d \nexternal: %d \niss: %d\n\n',...
        ais(i).(poprawneNazwyPol{5}),ais(i).(poprawneNazwyPol{6}), ais(i).(poprawneNazwyPol{7}));    
    end
    save('iis.mat','ais');
end