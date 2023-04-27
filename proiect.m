clc 
clear all
close all
%% oglindirea imaginilor dupa axele x si y
filepath='C:\Users\Petruca Bianca Ioana\Desktop\UTCN\anul 4\semestrul 2\Analiza și Prelucrarea Imaginilor Biomedicale\Proiect\ct\';
I= imread([filepath '1 (141).png']);
I2= flipud(I); %orizontal
I3= fliplr(I); % vertical
subplot(2,2,1);imshow(I); title 'normal'; 
subplot(2,2,2); imshow(I2); title 'orizontal';
subplot(2,2,3); imshow(I3); title 'vertical'
% imwrite(I3,'vertical.jpg')
%% umplerea golurilor
I4 = imfill(I,'holes');
figure; imshow(I4); title 'umplerea golurilor'
%% delimitarea obiectelor folosind lapacianul 
ES= strel('arbitrary',eye(8));
dil=imdilate(I,ES);
figure; imshow(dil); title 'dilatare';
erod=imerode(I,ES);
figure; imshow(erod); title 'erodare';
% lm= dil +dil2 - (2*I);
% figure; imshow(lm); title 'laplacian morfo'
GI = I-erod; figure; imshow(GI); title 'gradientul interior';
GE = dil- I;
lm= GE + GI;
figure; imshow(lm); title 'delimitarea obiectelor folosind laplacianul morfologic';
