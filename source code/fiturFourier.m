function [G] = fiturFourier(F, n)
% FITURFOURIER Memperoleh fitur Fourier sebanyak n buah.
% Masukan:
% F : Deskriptor Fourier yang lengkap
% n : Jumlah fitur yang dikehendaki
% Keluaran:
% G : Deskriptor Fourier sebanyak n buah
jum = length(F);
if jum > n
 K1 = fftshift(F);
 delta = round((jum-n) / 2);
 K2 = K1(1 + delta : n+delta);
 G = ifftshift(K2);
else
 G = F;
end
