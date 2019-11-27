function [wyChwileCzasowe,wyWspolrzednaZ]=wymach(weChwileCzasowe,weWspolrzednaZ)
%PODPOR - funckja zwracajaca wektor wspolrzednych oraz chwil czasu dla wymachu
%wyChwileCzasowe -> wyjsciowe chwile czasowe dla wymachu
%weChwileCzasowe -> wejsciowe chwile czasowe - wszytskie z pomiarow, conajmniej 3
%analogicznie do weWspolrzednaZ i wyWspolrzednaZ
%zakladamy ze pierwsza i ostatnia chwila nie jest wymachem
wyChwileCzasowe = []; wyWspolrzednaZ = [];

if ((length(weWspolrzednaZ) < 3) || (length(weChwileCzasowe) < 3 ))
    disp('Blad -> Podane macierze maja zly rozmiar');
    return %obsluga bledow
end

for i = 2:length(weWspolrzednaZ)- 1
    %Aby zawsze miec jedna wartosc poprzednia i nastepna
    tmpPoprzedni = weWspolrzednaZ(i-1);
    tmpNastepny = weWspolrzednaZ(i+1);
    
    if((weWspolrzednaZ(i) > tmpPoprzedni) && (weWspolrzednaZ(i) > tmpNastepny)) 
        wyWspolrzednaZ(length(wyWspolrzednaZ)+1) = weWspolrzednaZ(i);
        wyChwileCzasowe(length(wyChwileCzasowe)+1) = weChwileCzasowe(i);
    end
end

end
