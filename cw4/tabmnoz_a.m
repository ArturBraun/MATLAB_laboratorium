function tabliczkaMnoz = tabmnoz_a(N)
tabliczkaMnoz = zeros(N,N);
for rzad = 1:N
    for kolumna = 1:N
        
    tabliczkaMnoz(rzad,kolumna) = rzad*kolumna;
    
    end
    
end

end