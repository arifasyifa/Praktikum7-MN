clc; clear; close all;

%% ================= DATA PERSAMAAN ===============
f     = {@(x) 3*x.^3 - 5*x.^2 + 4*x - 7, ...
         @(x) exp(x) - x.^2, ...
         @(x) log(x+2) + 2*x - 3};

c     = [1, 0, 0];                       % ruas kanan (y = c)

xr    = {0:0.01:2.6, ...                 % rentang x tiap soal
         -2:0.01:2, ...
         -1.9:0.01:3};

tebak = [1.5, -0.5, 1];                  % tebakan awal (lihat dari grafik)

judul = {'3x^3 - 5x^2 + 4x - 7 = 1', ...
         'e^x - x^2 = 0', ...
         'log(x+2) + 2x - 3 = 0'};

% akar hanya untuk menandai titik di grafik (jawaban tugas tetap dari biseksi/regula falsi)
akar = zeros(1,3);
for k = 1:3
    g = f{k};  ck = c(k);
    akar(k) = fzero(@(x) g(x) - ck, tebak(k));
end


%% ================= BAGIAN A: GRAFIK TUNGGAL =================
% Grafik f(x) - c, akar = titik potong dengan sumbu x
figure('Name', 'Grafik Tunggal', 'Position', [50 100 1200 350]);

for k = 1:3
    g = f{k};  x = xr{k};
    subplot(1,3,k);
    plot(x, g(x) - c(k), 'b', 'LineWidth', 1.5); hold on;
    plot(x, zeros(size(x)), 'k');                        % garis y = 0
    plot(akar(k), 0, 'ro', 'MarkerFaceColor', 'r');      % titik akar
    yl = ylim;
    text(akar(k), yl(1) + 0.8*(yl(2)-yl(1)), ...
         sprintf('akar \\approx %.4f', akar(k)), ...
         'Color', 'r', 'HorizontalAlignment', 'center');
    hold off; grid on;
    title(['Persamaan ' num2str(k) ': GRAFIK TUNGGAL']);
    xlabel('x'); ylabel('f(x)');
    legend('f(x)', 'Location', 'northwest');
end
