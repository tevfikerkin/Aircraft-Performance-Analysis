function Print_Mat(filename_mat,MainMatrix)

hh='.mat';
matfile=strcat(filename_mat,hh);
save(matfile,'MainMatrix');
end