%%
% Cwiczenie 2
% Autorzy: Ma³gorzata Lus, Artur Braun

%% Zad 1
daneZPliku = importdata('heart1.txt');
[chwileCzasowe,wektorLogiczny] = alerthr(daneZPliku,1/60);
if ~isempty(chwileCzasowe) && ~isempty(wektorLogiczny)
    for i = 1:length(chwileCzasowe)
        if wektorLogiczny(i) == 1
            fprintf('UWAGA! W %d minucie wystapil %s czestotliwosci\nrytmu serca.\n\n',...
    chwileCzasowe(i), 'wzrost'); 
        else
            fprintf('UWAGA! W %d minucie wystapil %s czestotliwosci\nrytmu serca.\n\n',...
    chwileCzasowe(i), 'spadek'); 
        end    
    end
elseif chwileCzasowe == -2 
    disp('UWAGA! Nie stwierdzono gwaltownej zmiany czestotliwosci rytmu serca.');
end
