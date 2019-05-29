clc;
clear all;

pkg load image;

Img = im2bw(imread('C:\Users\asus\Documents\SEMESTER 4\Pengolahan Citra\biner.jpg'), 0.5);
%argumen kedua adalah orde polinomial
%argumen ketiga untuk menghasilkan gambar, dapat ditiadakan
X = zermoment(Img, 4, true)