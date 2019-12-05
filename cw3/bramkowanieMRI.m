% findpeaks(bellows) -> funkcja wbudowana w matlabie

load('bellows.mat');
dlugoscFazyPrzygotowawczej = input('Wprowadz dlugosc fazy roboczej (w probkach): ');
wydajnoscSkanowania = input('Wprowadz pozadana wydajnosc skanowania: ');

[poziomNiski,poziomWysoki] = okno_aktywizacji(bellows,wydajnoscSkanowania,dlugoscFazyPrzygotowawczej);

rzeczywistaWydajnoscSkanowania = (length(bellows(bellows > poziomNiski & bellows < poziomWysoki))/length(bellows))*100;

fprintf('Wartosc poziomu niskiego wynosi %f, a wysokiego %f.\nRzeczywista wydajnosc skanowania wynosi %f%%.\n\n',...
    poziomNiski, poziomWysoki, rzeczywistaWydajnoscSkanowania); 



