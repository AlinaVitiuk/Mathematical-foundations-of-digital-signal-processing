clear all
n = 2;
N = 50 + n;

% Генерація довільного вектора f
f = rand(N,1) + 1i * rand(N,1);
% Обчислення коефіцієнтів Фур'є та часу обчислення
tic;
for k = 0:N-1
C(k+1) = fourier_coefficient(k, f);
end
elapsed_time = toc;
 
% Обчислення спектру амплітуд та фаз та побудова графіків
amp_spectrum = abs(C);
phase_spectrum = angle(C);
freq_axis = 0:N-1;

subplot(1, 2, 1);
stem(freq_axis, amp_spectrum, 'black');
title('Амплітудний спектр');
xlabel('Частота');
ylabel('Амплітуда');

subplot(1, 2, 2);
stem(freq_axis, phase_spectrum, 'black');
title('Фазовий спектр');
xlabel('Частота');
ylabel('Фаза');

disp(['Час обчислення: ', num2str(elapsed_time)]);
num=um_mult_add(k, f);
%fprintf("Кількість операцій множення: %d\n", num_mult);
%fprintf("Кількість операцій додавання: %d\n\n", num_add);

for k = 0:N-1
fprintf("C_%d = %.6f + %.6fi\n", k, real(C(k+1)), imag(C(k+1)));
end