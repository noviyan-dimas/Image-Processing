clc;
clear all;

Img2 = im2bw(imread('C:\Users\asus\Documents\SEMESTER 4\Pengolahan Citra\biner.jpg'), 0.5);
konveksitas(Img2)