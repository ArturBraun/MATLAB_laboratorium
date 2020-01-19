function [Vs,Vr,Ic,Ir,Id,t_off,t_on] = prostownik1(R,C,Vo,f,No,delta_t)
    wlaczenieDiody = 1; 
    w = 2*pi*f;
    t = 0:delta_t:(No/f);
    Vs = Vo*sin(w*t);
    Vr = Vs;
    Ir = Vr/R;
    Ic = w*C*Vo*cos(w*t);
    Id = zeros(1,length(Ic));
    chwileWylaczania = 0;
    chwileWlaczania = 0;
    %chwileDiody = 0;
    
    for czasAktualny = 1:length(t)
       if wlaczenieDiody && Ir(czasAktualny)+Ic(czasAktualny) <= 0
            wlaczenieDiody = 0;
            chwileWylaczania = chwileWylaczania + 1;
            t_off(chwileWylaczania) = t(czasAktualny);
        end
        if wlaczenieDiody==0
            Vr(czasAktualny) = Vo*sin(w*t_off(chwileWylaczania))*exp((t_off(chwileWylaczania)-t(czasAktualny))/(R*C));
            Ir(czasAktualny) = Vr(czasAktualny)/R;
            Ic(czasAktualny) = -Ir(czasAktualny);
        else
            Id(czasAktualny) = Ic(czasAktualny)+Ir(czasAktualny);
        end
        if wlaczenieDiody == 0 && Vs(czasAktualny)>Vr(czasAktualny)
            wlaczenieDiody = 1;
            chwileWlaczania = chwileWlaczania+1;
            t_on(chwileWlaczania) = t(czasAktualny);
        end 
    end
  
