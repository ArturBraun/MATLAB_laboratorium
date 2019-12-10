function F = szereg_opt(t, delta_t, n)

i = 0;                                                            
tt = t(1):delta_t:t(2);
k = 0:n-1;
F = zeros(size(tt));

for ii = tt                                                 
  i = i + 1;                                                                                                             
                                              
  F(i) = (4/pi) * sum(1 ./ (2.*k + 1) .* sin((4.*k + 2).*pi.*ii./(t(2).*2)),'all');
                                                                                                    
end 

%F = (4/pi) * sum(1 ./ (2.*k + 1) .* sin((4.*k + 2).*pi.*tt./(t(2).*2)),'all');


end