clc;
clear all;

Img = im2bw(imread('C:\Users\asus\Documents\SEMESTER 4\Pengolahan Citra\biner.jpg'), 0.5);
Kontur = inbound_tracing(Img);
F = perolehFD(Kontur); 
[m,n]=size(Img); 

B = m * n;
A = length(F);

disp(["jumlah deskriptor fourier = ", num2str(A)])
disp(["jumlah data pada citra sebanyak = ", num2str(B), " buah"])

subplot(1,2,1);imshow(Img);
subplot(1,2,2);plotFD(F);