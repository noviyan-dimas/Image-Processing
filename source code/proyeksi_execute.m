clc;
clear all;

pkg load image;

Img2 = im2bw(imread('C:\Users\asus\Documents\SEMESTER 4\Pengolahan Citra\biner.jpg'), 0.5);
[V, H] = proyeksi(Img2);

figure(1);
bar(H)
figure(2);
bar(V)