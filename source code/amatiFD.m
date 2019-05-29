function [] = amatiFD(berkas)
% AMATIFD Digunakan untuk mengamati deskriptor Fourier
% yang telah dinormalisasi.
Img = im2bw(imread(berkas),0.5);
K = inbound_tracing(Img);
F = perolehFD(K);
G = fiturFourier(F,30);
H = normalisasiFD(G);
bar(H);