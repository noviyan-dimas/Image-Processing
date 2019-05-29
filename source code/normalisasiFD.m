function [G] = normalisasiFD(F)
% NORMALISASIFD Digunakan untuk melakukan normalisasi
% agar FD bebas dari transalasi, rotasi,
% penyekalaan, dan perubahaan titik awal.
G = F;
% Mengatur agar bebas terhadap penyekalaan
m = abs(G(1)); % Ambil komponen kedua
G = G ./ m; % Lakukan normalisasi
% Mengatur agar bebas rotasi dan perubahan titik awal
G = abs(G);