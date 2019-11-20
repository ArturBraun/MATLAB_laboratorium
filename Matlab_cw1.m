%%Laboratorium 1

% Autorzy:
% Artur Braun 293 300
% Ma³gorzata Lus 293 316

%% Zad 4
%a)
rlos = rand(11)*5-2;
%b)
Rlos = fix(rlos);
%c)
rlosGtRlos = rlos > Rlos;
%d)

%e)

%% Zad 5
syms x y z
eqn1 = 3*x+2*y-z==-18;
eqn2 = 3*x-8*y-7*z==38;
eqn3 = -22*x+18*y-30*z==6;
[A,B] = equationsToMatrix([eqn1, eqn2, eqn3], [x, y, z]);
X = linsolve(A,B);

if(A(1,1)*A(2,1)+A(1,2)*A(2,2)+A(1,3)*A(2,3) == 0 && A(1,1)*A(3,1)+A(1,2)*A(3,2)+A(1,3)*A(3,3) == 0 && A(2,1)*A(3,1)+A(2,2)*A(3,2)+A(2,3)*A(3,3) == 0)
    saLubNieSa = 'sa';
else 
    saLubNieSa = 'nie sa';
end
fprintf('Plaszczyzny obrazowania %s ortogonalne.\n Wspolrzedne przeciecia obrazow warstwowych wynosza: %f (x), %f (y), %f (z).\n', ...
    saLubNieSa, double(X(1)), double(X(2)), double(X(3))); 

%% Zad 6
while(1)
   a = double(input("Dlugosc promienia a: "));
   b = double(input("Dlugosc promienia b: "));
   c = double(input("Dlugosc promienia c: "));
   
   if(a>0 && b>0 && c>0)
       break;
   else
       disp("Blad -> Wszystkie promienie musza miec wartosci dodatnie !!!");
       disp("");
   end
end
V = (4/3)*pi*a*b*c;
fprintf('Objetosc lewej komory serca o promieniach: a = %f mm, b = %f mm, c = %f mm\nwynosci %f mm szesciennych co odpowiada %f ml\n',...
    a, b, c, V, V); 

%% Zad 7
load('knee_flexion','left_knee_flexion');
min_kat_radiany = min(left_knee_flexion(:,2));
[max_kat_radiany,rzad_max_wartosci] = max(left_knee_flexion(:,2));
chwila_czasowa_max_wartosci = left_knee_flexion(rzad_max_wartosci,1);
zakres_katowy = rad2deg(max_kat_radiany-min_kat_radiany);

fprintf('Zakres wartosci kata zgiecia kolana wynosi %f stopni.\nMaksymalna wartosc kata zgiecia kolana wynosi %f stopni i wystepuje po %f sekundach\n',...
    zakres_katowy,rad2deg(max_kat_radiany),chwila_czasowa_max_wartosci); 



