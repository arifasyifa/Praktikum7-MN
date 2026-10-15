clc; clear; close all;

%% ================= DATA PERSAMAAN =================
% Soal 1: 3x^3 - 5x^2 + 4x - 7 = 1
% Soal 2: e^x - x^2 = 0       -> e^x = x^2
% Soal 3: log(x+2) + 2x - 3 = 0 -> log(x+2) = 3 - 2x

% f(x) = ruas kiri - ruas kanan (untuk grafik tunggal)
f     = {@(x) 3*x.^3 - 5*x.^2 + 4*x - 7 - 1, ...
         @(x) exp(x) - x.^2, ...
         @(x) log(x+2) + 2*x - 3};

% dua kurva untuk grafik ganda
g1    = {@(x) 3*x.^3 - 5*x.^2 + 4*x - 7, ...
         @(x) exp(x), ...
         @(x) log(x+2)};
g2    = {@(x) 1 + 0*x, ...
         @(x) x.^2, ...
         @(x) 3 - 2*x};

lab1  = {'y = 3x^3-5x^2+4x-7', 'y = e^x', 'y = log(x+2)'};
lab2  = {'y = 1', 'y = x^2', 'y = 3-2x'};

xr    = {0:0.01:2.6, ...                 % rentang x tiap soal
         -2:0.01:2, ...
         -1.9:0.01:3};

tebak = [1.5, -0.5, 1];                  % tebakan awal (lihat dari grafik)

% akar hanya untuk menandai titik di grafik (jawaban tugas tetap dari biseksi/regula falsi)
akar = zeros(1,3);
for k = 1:3
    akar(k) = fzero(f{k}, tebak(k));
end


%% ================= BAGIAN B: GRAFIK GANDA =================
% Dua kurva, akar = titik potong keduanya
figure('Name', 'Grafik Ganda', 'Position', [50 100 1200 350]);

for k = 1:3
    x = xr{k};
    ypot = g1{k}(akar(k));                               % nilai y di titik potong
    subplot(1,3,k);
    plot(x, g1{k}(x), 'b', 'LineWidth', 1.5); hold on;
    plot(x, g2{k}(x), 'g', 'LineWidth', 1.5);
    plot(akar(k), ypot, 'ro', 'MarkerFaceColor', 'r');   % titik potong
    yl = ylim;
    text(akar(k), yl(1) + 0.8*(yl(2)-yl(1)), ...
         sprintf('(%.3f; %.3f)', akar(k), ypot), ...
         'Color', 'r', 'HorizontalAlignment', 'center');
    hold off; grid on;
    title(['Persamaan ' num2str(k) ': GRAFIK GANDA']);
    xlabel('x'); ylabel('y');
    legend(lab1{k}, lab2{k}, 'Location', 'northwest');
end
