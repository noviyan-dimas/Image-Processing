clc;
clear all;

pkg load image;

Img = im2bw(imread('C:\Users\asus\Documents\SEMESTER 4\Pengolahan Citra\biner.jpg'), 0.5); 

X = tandatangan(Img);


subplot(1,2,1);imshow(Img);
subplot(1,2,2);plot(X);