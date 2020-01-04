function [Vs,Vr,Ic,Ir,Id,t,t_a] = prostownik(R,C,Vo,f,No,delta_t)
    t_a = [];
    t = 0:delta_t:(No/f);
    Vs = zeros(1,length(t));
    Vr = zeros(1,length(t));
    Ic = zeros(1,length(t));
    Ir = zeros(1,length(t));
    Id = zeros(1,length(t));
    w = 2*pi*f;
    
    Ir(1) = Vo*sin(w*t(1))/R;
    Ic(1) = w*C*Vo*cos(w*t(1));
    Vs(1) = Vo*sin(w*t(1));
    Vr(1) = Vo*sin(w*t(1));
    i = 2;
    
    while (i <= length(t))        
        Ir(i) = Vo*sin(w*t(i))/R;
        Ic(i) = w*C*Vo*cos(w*t(i));
        Id(i) = Ir(i)+Ic(i);
        Vs(i) = Vo*sin(w*t(i));
        if(Ir(i) <= -Ic(i)) && ~(Ir(i-1) <= -Ic(i-1))
            t_a(end+1) = t(i);
        end
        if(Ir(i) > -Ic(i)) && (Vs(i-1) >= Vr(i-1))
            Vr(i) = Vo*sin(w*t(i));
        else
            Vr(i) = Vo*sin(w*t_a(end))*exp((t_a(end)-t(i))/(R*C)); 
        end        
        i = i + 1;
    end
end