function [F] = perolehFD(Kontur)
% PEROLEHFD Memperoleh deskriptor Fourier berdasarkan
% kontur suatu bentuk.
% Masukan: Kontur = kontur objek
% Keluaran: F = deskriptor Fourier
jum = length(Kontur);
% Atur supaya jumlah elemen genap
  if rem(jum, 2) == 1
    Kontur = [Kontur; Kontur(1,:)];
  end
% Peroleh bentuk Fourier kontur
K = Kontur(:, 2) - i * Kontur(:,1);
F = fft(K);
