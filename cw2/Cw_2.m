%%
% Cwiczenie 2
% Autorzy: Ma³gorzata Lus, Artur Braun

%% Zad 4
load('LAnkle_tracking', 'LAnkle');
chwileCzasowe = LAnkle(:,4);
wspolrzednaZ = LAnkle(:,3);

hold on;
plot(chwileCzasowe,wspolrzednaZ);
title('wspolrzednaZ(czas)');
xlabel('czas');
ylabel('wspolrzednaZ');

[podporChwileCzasowe,podporWspolrzednaZ] = podpor(chwileCzasowe,wspolrzednaZ);
[wymachChwileCzasowe,wymachWspolrzednaZ] = wymach(chwileCzasowe,wspolrzednaZ);

plot(podporChwileCzasowe,podporWspolrzednaZ,'x');
plot(wymachChwileCzasowe,wymachWspolrzednaZ,'o');

%% Zad 3

try
Pacjent.imie = string(input('Podaj imie: ','s'));
Pacjent.nazwisko = string(input('Podaj nazwisko: ','s'));
Pacjent.cisnienieSkurczowe = double(input('Podaj cisnienie skurczowe: '));
if (Pacjent.cisnienieSkurczowe <= 0)
    error('LiczbaUjemna');
end
Pacjent.cisnienieRozkurczowe = double(input('Podaj cisnienie rozkurczowe: '));
if (Pacjent.cisnienieRozkurczowe <= 0)
    error('LiczbaUjemna');
end

if ((Pacjent.cisnienieSkurczowe <= 90) && (Pacjent.cisnienieRozkurczowe <= 60)) 
fprintf('Cisnienie krwi pacjenta %s %s\n wynosi %f/%f i jest %s\n\n',...
    Pacjent.imie,Pacjent.nazwisko,Pacjent.cisnienieSkurczowe,Pacjent.cisnienieRozkurczowe,'niskie'); 
elseif ((Pacjent.cisnienieSkurczowe <= 120) && (Pacjent.cisnienieRozkurczowe <= 80))
    fprintf('Cisnienie krwi pacjenta %s %s\n wynosi %f/%f i jest %s\n\n',...
    Pacjent.imie,Pacjent.nazwisko,Pacjent.cisnienieSkurczowe,Pacjent.cisnienieRozkurczowe,'idealne'); 
elseif ((Pacjent.cisnienieSkurczowe <= 140) && (Pacjent.cisnienieRozkurczowe <= 90))
    fprintf('Cisnienie krwi pacjenta %s %s\n wynosi %f/%f i jest %s\n\n',...
    Pacjent.imie,Pacjent.nazwisko,Pacjent.cisnienieSkurczowe,Pacjent.cisnienieRozkurczowe,'podwyzszone'); 
else
    fprintf('Cisnienie krwi pacjenta %s %s\n wynosi %f/%f i jest %s\n\n',...
    Pacjent.imie,Pacjent.nazwisko,Pacjent.cisnienieSkurczowe,Pacjent.cisnienieRozkurczowe,'wysokie'); 
end

catch 
    disp('BLAD -> Wartosc cisnienia musi byc dodatnia!');
end

%% Zad 2
try
    while 1
        liczba1 =  double(input('Podaj liczbe 1: '));
        liczba2 =  double(input('Podaj liczbe 2: '));
        znakDzialania = input('Podaj znak dzialania: ','s');

        switch znakDzialania
            case 'q'
                disp('Zakonczyles dzialanie skryptu');
                break
            case '+'
                fprintf('Wynik dzialania %f%s%f wynosi %f\n\n',...
                liczba1,znakDzialania,liczba2,liczba1+liczba2); 
            case '-'
                fprintf('Wynik dzialania %f%s%f wynosi %f\n\n',...
                liczba1,znakDzialania,liczba2,liczba1-liczba2); 
            case '*'
                fprintf('Wynik dzialania %f%s%f wynosi %f\n\n',...
                liczba1,znakDzialania,liczba2,liczba1*liczba2); 
            case '/'
                if (liczba2 == 0)
                   error('DzieleniePrzez0'); 
                end
                fprintf('Wynik dzialania %f%s%f wynosi %f\n\n',...
                liczba1,znakDzialania,liczba2,liczba1/liczba2);
            otherwise 
                error('NieznanyOperator');
        end
    end
catch blad
   switch blad.message
        case 'NieznanyOperator'
            disp('BLAD -> Podany operator jest nieznany!');
        case 'DzieleniePrzez0'
            disp('BLAD -> Dzielenie przez 0!');
    end    
end

%% Zad 1






