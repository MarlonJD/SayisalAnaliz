% Copyright (c) 2019 Burak Karahan
% Licensed under the MIT License.


% 'clc' Komut Penceresini temizler.

% Kapsam Degiþkeni, Scriptler ve fonksiyonlar, Kalici degiskenler
% MEX fonksiyonlari, Global degiþkenler vb. temizler.
% 'Clear all', kod performansini dusurur ve genellikle gereksizdir.

% Gizli olmayan tum figurleri siler.

clc;clear all;close all;

% Veri yapilari
% hata: x1 ve x0 arasindaki fark, her dongude yeni deger alir
% epsilon: problemde istenilen hata miktari
% i: tekrar (iterasyon) sayisi
% x0: bulunmasi istenen aralýktaki alt sinir
% x1: newton-raphson yontemine gore bir sonraki kok
% f: cozulmesi istenen fonksiyonlar
% f1: cozulmesi istenen fonksiyonun turevi

hata = 0.1
epsilon=0.0001;
i = 0
x0=0;
f=@(x) 3-2^x-exp(-x);
f1=@(x) exp(-x)-2;

% hata, epsilon'dan buyuk oldugu surece donguye sok
while(hata > epsilon)
    % i sayisini 1 artir
    i = i + 1
    % i sayisini her seferinde yazdirmamasi icin komut pencerisi temizle. Gorsel amaclidir
    clc;
    % Newton-Raphson'a gore x1 degeri
    x1 = x0 - f(x0) / f1(x0);
    % simdiki hata degerini hesapla
    hata = abs(x1-x0);
    % x0, x1'e esit olsun ki sonraki x1 degeri yeni deger alsin.
    x0 = x1;
end

% Degerleri yazdir
fprintf("Deger: %f.20  \n", x0);
fprintf('Tekrar: %d\n', i);
