R = input('Prosze podac wartosc oporu R w omach: ');
Vo = input('Prosze podac wartosc amplitudy Vo w voltach: ');
f = input('Prosze podac wartosc czestotliwosci f w Hz: ');
No = input('Prosze podac liczbe okresow napiecia zasilajacego No: ');
delta_t = input('Prosze podac wartosc okresu probkowania w [s]: ');
C = input('Prosze podac wartosc pojemnosci C w faradach: ');

t = 0:delta_t:(No/f);
[Vs,Vr,Ic,Ir,Id,t_off,t_on] = prostownik1(R,C,Vo,f,No,delta_t);
[~,idx_t_off] = intersect(t,t_off);
[~,idx_t_on] = intersect(t,t_on);

figure(1);
subplot(2,1,1);
hold on;
plot(t,Vs,'b--','DisplayName','Vs');
plot(t,Vr,'r','DisplayName','Vr');
plot(t_off,Vs(idx_t_off),'m*');
%plot(t_on,Vs(idx_t_on),'g*');
plot(t_off,Vr(idx_t_off),'m*');
%plot(t_on,Vr(idx_t_on),'g*');
hold off;
title('Wykresy napieciowe');
xlabel('t[s]');
ylabel('U[V]');
%legend({'Vs','Vr','t_off','t_on'},'Location','southeast');
legend({'Vs','Vr','t_o_f_f'},'Location','southeast');

subplot(2,1,2);
hold on;
plot(t,Ir,'r','DisplayName','Ir');
plot(t,Ic,'k','DisplayName','Ic');
plot(t,Id,'b','DisplayName','Id');
plot(t_off,Ir(idx_t_off),'m*');
%plot(t_on,Ir(idx_t_on),'g*');
plot(t_off,Ic(idx_t_off),'m*');
%plot(t_on,Ic(idx_t_on),'g*');
plot(t_off,Id(idx_t_off),'m*');
%plot(t_on,Id(idx_t_on),'g*');
hold off
title('Wykresy pradowe');
xlabel('t[s]');
ylabel('I[A]');
%legend({'Ir','Ic','Id','t_off','t_on'},'Location','southeast');
legend({'Ir','Ic','Id','t_o_f_f'},'Location','southeast');

Usr = sum(Vr(idx_t_off(1):idx_t_off(2)))/(idx_t_off(2)-idx_t_off(1)+1);
Ut = (max(Vr(idx_t_off(1):idx_t_off(2)))-min(Vr(idx_t_off(1):idx_t_off(2))))/2;
kt = Ut/Usr;

fprintf('\nDla przedzialu czasu od t_a do t_d napiecie srednie wynosi %f [V],\namplituda tetnien wynosi %f [V], oraz wspolczynnik tetnien wynosi %f.\n\n',...
    Usr,Ut,kt);

