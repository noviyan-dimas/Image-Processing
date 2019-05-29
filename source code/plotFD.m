function [] = plotFD(F)
% PLOTFD Menampilkan kontur berdasarkan deskriptor Fourier.
% Masukan: F = Deskriptor Fourier
jum = length(F);
if jum > 0
 G = ifft(F); % Transformasi balik
 G = [G; G(1)]; % Tambahkan elemen pertama
 plot(G);
 axis off;
end