% ladowanie danych z pliku
load('ais.mat');
% Sprawdzanie poprawnoœci nazw danych pól
poprawneNazwyPol = {'head','face','chest','abdomen','extremities','external'}';
%fieldnames(S) - zwraca nazwy pol z struktury S jako typ cell
%strcmp(A,B) - porownuje wartosci pol w A z B i zwraca tablice logiczna
%ismember(C,D) - sprawdza czy C nale¿y do D i zwraca 1 kiedy nale¿y, lub 0
if (ismember(0,strcmp(poprawneNazwyPol,fieldnames(ais)))) 
    disp('BLAD -> nazwy pol struktury danych nie sa zgodne z nastepujacymi nazwami: head, face, chest, abdomen, extremities, external'); 
else
    [rozmiarX,rozmiarY] = size(ais);
    rozmiarZaladowanychStruktur = rozmiarX*rozmiarY;
    pobraneDaneZeStruktur = zeros(rozmiarZaladowanychStruktur,6);
    
    for i = 1:rozmiarZaladowanychStruktur
        pobraneDaneZeStruktur(i,:) = [ais(i).head, ais(i).face, ais(i).chest,...
        ais(i).abdomen, ais(i).extremities,ais(i).external];
        
        ais(i).iss = wyznaczISS(pobraneDaneZeStruktur(i,:));
        
        fprintf('[%d]Pacjent:\nhead: %d \nface: %d \nchest: %d \nabdomen: %d',...
        i,ais(i).head, ais(i).face, ais(i).chest, ais(i).abdomen); 
        fprintf('\nextremities: %d \nexternal: %d \niss: %d\n\n',...
        ais(i).extremities,ais(i).external, ais(i).iss);    
    end
    save('iis.mat','ais');
end