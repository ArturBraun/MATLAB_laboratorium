function [iss] = wyznaczISS(wektorDanych)
    tmp = sort(wektorDanych,'descend');
    trzyNajwiekszeWartosci = tmp(1:3);
    iss = trzyNajwiekszeWartosci(1)^2 + trzyNajwiekszeWartosci(2)^2 + trzyNajwiekszeWartosci(3)^2;
end