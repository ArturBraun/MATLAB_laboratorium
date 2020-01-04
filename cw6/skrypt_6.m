R = input('Prosze podac wartosc oporu R w omach: ');
Vo = input('Prosze podac wartosc amplitudy Vo w voltach: ');
f = input('Prosze podac wartosc czestotliwosci f w Hz: ');
No = input('Prosze podac liczbe okresow napiecia zasilajacego No: ');
delta_t = input('Prosze podac wartosc okresu probkowania: ');
C = input('Prosze podac wartosc pojemnosci C w faradach: ');

[Vs,Vr,Ic,Ir,Id,t,t_a] = prostownik(R,C,Vo,f,No,delta_t);
[~,idx_t_a] = intersect(t,t_a);

figure(1);
nexttile;
hold on;
plot(t,Vs,'b--','DisplayName','Vs');
plot(t,Vr,'r','DisplayName','Vr');
plot(t_a,Vs(idx_t_a),'m*');
plot(t_a,Vr(idx_t_a),'m*');
hold off;
title('Wykresy napieciowe');
xlabel('t[s]');
ylabel('U[V]');
legend({'Vs','Vr','t_a'},'Location','southeast');

nexttile;
hold on;
plot(t,Ir,'r','DisplayName','Ir');
plot(t,Ic,'k','DisplayName','Ic');
plot(t,Id,'c','DisplayName','Id');
plot(t_a,Ir(idx_t_a),'m*');
plot(t_a,Ic(idx_t_a),'m*');
plot(t_a,Id(idx_t_a),'m*');
hold off
title('Wykresy pradowe');
xlabel('t[s]');
ylabel('I[A]');
legend({'Ir','Ic','Id','t_a'},'Location','southeast');

Usr = sum(Vr(idx_t_a(1):idx_t_a(2)))/(idx_t_a(2)-idx_t_a(1)+1);
Ut = (max(Vr(idx_t_a(1):idx_t_a(2)))-min(Vr(idx_t_a(1):idx_t_a(2))))/2;
kt = Ut/Usr;

fprintf('\nDla przedzialu czasu od t_a do t_d napiecie srednie wynosi %f,\namplituda tetnien wynosi %f, oraz wspolczynnik tetnien wynosi %f.\n\n',...
    Usr,Ut,kt);

