% Copyright (c) 2019 Burak Karahan
% Licensed under the MIT License.

% 'clc' Komut Penceresini temizler.

% Kapsam Degi�keni, Scriptler ve fonksiyonlar, Kalici degiskenler
% MEX fonksiyonlari, Global degi�kenler vb. temizler.
% 'Clear all', kod performansini dusurur ve genellikle gereksizdir.

% 'close all' Gizli olmayan tum figurleri siler.
clc; clear all; close all;

% Veri yapilari
% f: cozulmesi istenen fonksiyon
% a: kok bulunmasi istenen aral�ktaki alt sinir
% b: kok bulunmasi istenen aral�ktaki ust sinir
% c: a ve b'nin aritmatik ortalamasi
% hata: fonksiyonda c yi yerine koydugumuzda cikan sonuc, f(c)
% epsilon: problemde istenilen hata miktari
% i: tekrar (iterasyon) sayisi

f=@(x) x^2-4;
a = 0;
b = 32;
c = (a + b) / 2;
hata = abs(f(c));
epsilon = 0.000001;
i = 0;
    
if f(a)*f(b)>0 
    disp('Verilen aralikta bulunamadi :(')
else
    % hata, epsilon'dan buyuk oldugu surece donguye sok
    while hata > epsilon
      % i sayisini 1 artir
      i = i + 1;
      % i sayisini her seferinde yazdirmamasi icin komut pencerisi temizle. Gorsel amaclidir
      clc;
      % c sayisini guncelle
      c = (a + b) / 2;
      % yeni hata degerini bul
      hata = abs(f(c));
      if f(a)*f(c) < 0 
        b = c;
      else
        a = c;          
      end
    end
    % Degerleri yazdir
    fprintf("Deger: %f  \n", c);
    fprintf('Tekrar: %d\n', i);
end

