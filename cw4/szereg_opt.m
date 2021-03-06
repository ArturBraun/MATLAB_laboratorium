function F = szereg_opt(t, delta_t, n)

%i = 0;                                                            
tt = t(1):delta_t:t(2);
k = 0:n-1;
%F = zeros(size(tt));

% for ii = tt                                                 
%   i = i + 1;                                                                                                             
%                                               
%   F(i) = (4/pi) * sum(1 ./ (2.*k + 1) .* sin((4.*k + 2).*pi.*ii./(t(2).*2)),'all');
%                                                                                                     
% end 

[K,TT] = meshgrid(k,tt);
F = ((4/pi) * sum(1 ./ (2.*K + 1) .* sin((4.*K + 2).*pi.*TT),2))';


% suma = @(ttt) (4/pi) * sum(1 ./ (2.*k + 1) .* sin((4.*k + 2).*pi.*ttt./(t(2).*2)),'all');
% F = arrayfun(suma,tt);

end