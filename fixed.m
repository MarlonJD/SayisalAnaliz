% Copyright (c) 2019 Burak Karahan
% Licensed under the MIT License.

% 'clc' Komut Penceresini temizler.

% Kapsam Degiþkeni, Scriptler ve fonksiyonlar, Kalici degiskenler
% MEX fonksiyonlari, Global degiþkenler vb. temizler.
% 'Clear all', kod performansini dusurur ve genellikle gereksizdir.

% 'close all' Gizli olmayan tum figurleri siler.
clc; clear all; close all;

% Veri yapilari
% g: cozulmesi istenen fonksiyonda x'in yalnýz býrakilmis hali, x = g(x)
% x0: kok bulunmasi istenen aralýktaki alt sinir
% x1: kok bulunmasi istenen aralýktaki ust sinir
% i: tekrar (iterasyon) sayisi
% hata: x1 ile x0 arasindaki fark (mutlak deger icinde)
% epsilon: problemde istenilen hata miktari
% maxTekrar: izin verilen en fazla tekrar sayisi

% f(x) = cosx - x*e^x
g=@(x) cos(x) / exp(x);

x0 = 0;
x1 = g(x0);
i = 0;
hata = abs(x1-x0);
epsilon = 0.001;
maxTekrar = 1000;

% hata, epsilon'dan buyuk oldugu surece donguye sok
while (hata > epsilon && i < maxTekrar)
    % i sayisini 1 artir
    i = i + 1;
    % x1 degiskenine x2 degiskeninin degeri ata
    x0 = x1;
    % x2 degiskeninin degerini, g(x1) fonskyinonunun sonucu yap
    x1 = g(x0);
    % yeni hata degerini bul
    hata = abs(x1-x0);
end

% Degerleri yazdir
fprintf("Deger: %f  \n", x0);
fprintf('Tekrar: %d\n', i);
fprintf('Hata: %d\n', hata);

% Baska kullanabileceginiz ornek fonskiyonlar
% exp(x), e^x (e uzeri x) ifade eder

% cos(x) - x * exp(x) = 0; sonuc, 0.518269
% x^4-x-10 = 0; sonuc, 1.855466
% x-exp(-x) = 0
% exp(-x) * (x2-5x+2) + 1= 0
% x-sin(x)-(1/2)= 0
% exp(-x) = 3log(x)