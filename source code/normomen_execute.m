clc;
clear all;

pkg load image;

Img = im2bw(imread('C:\Users\asus\Documents\SEMESTER 4\Pengolahan Citra\biner.jpg'), 0.5);
A = normomen(Img, 1, 0);
B = normomen(Img, 1, 1);
C = normomen(Img, 0, 2);
D = normomen(Img, 2, 0);
E = normomen(Img, 0, 3);
F = normomen(Img, 3, 0);
G = normomen(Img, 1, 2);
H = normomen(Img, 2, 1);

disp(["momen pusat ternormalisasi orde 10 = ", num2str(A)]);
disp(["momen pusat ternormalisasi orde 11 = ", num2str(B)]);
disp(["momen pusat ternormalisasi orde 02 = ", num2str(C)]);
disp(["momen pusat ternormalisasi orde 20 = ", num2str(D)]);
disp(["momen pusat ternormalisasi orde 03 = ", num2str(E)]);
disp(["momen pusat ternormalisasi orde 30 = ", num2str(F)]);
disp(["momen pusat ternormalisasi orde 12 = ", num2str(G)]);
disp(["momen pusat ternormalisasi orde 21 = ", num2str(H)]);