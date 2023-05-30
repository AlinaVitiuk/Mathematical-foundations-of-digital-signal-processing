% Генерація випадкової послідовності
clear all
n = 2;
N = 100 + n;
x = rand(1, N);

% Доповнюємо вхідний сигнал нулями до степеня 2
M = 2^nextpow2(N);
x = [x, zeros(1, M - N)];

% Обчислення ШПФ та оцінка часу обчислення
tic;
X = myfft(x);
elapsed_time = toc;

% Оцінка кількості операцій
add_operations = N;
mult_operations = 4*N;

fprintf('Час обчислення: %.10fс\n', elapsed_time);
fprintf('Кількість операцій множення: %.0f\n', mult_operations);
fprintf('Кількість операцій додавання: %.0f\n\n', add_operations);
for i = 1:length(X)
    fprintf('C_%d = %.10f + %.10fi\n', i-1, real(X(i)), imag(X(i)));
end

% Обчислення спектра амплітуд та фаз та побудова графіків
amp_spectrum = abs(X);
phase_spectrum = angle(X);
freq_axis = 0:M-1;

figure;
subplot(1, 2, 1);
stem(freq_axis, amp_spectrum, 'k');
title('Амплітудний спектр');
xlabel('Частота');
ylabel('Амплітуда');

subplot(1, 2, 2);
stem(freq_axis, phase_spectrum, 'k');
title('Фазовий спектр');
xlabel('Частота');
ylabel('Фаза');
