function wynikLogiczny = crtquaify(ocenaNYHA, wymiarLVEDD, czasQRS, objetoscLVEF)
wynikLogiczny = [];
if(floor(ocenaNYHA) ~= ocenaNYHA || wymiarLVEDD < 0 || czasQRS < 0 || objetoscLVEF < 0 )
    return;
end
if ((ocenaNYHA == 3 || ocenaNYHA == 4) && wymiarLVEDD > 55 && czasQRS > 150 && objetoscLVEF < 35) 
    wynikLogiczny = true;
    return;
end
wynikLogiczny = false;
end