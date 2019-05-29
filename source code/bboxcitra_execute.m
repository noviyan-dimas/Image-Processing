clc;
clear all;

pkg load image;

Img = im2bw(imread('C:\Users\asus\Documents\SEMESTER 4\Pengolahan Citra\biner.jpg'),0.5);
[rasio, X1, X2, Y1, Y2] = bboxcitra(Img)