clear all
clc	
syms x
%ВХІДНІ ДАННІ 
%межі
a = -pi;
b = pi;
%порядок ряду Фур'є
n = 30;
%точка, в якій обчислюється наближення рядом Фур'є
x = pi/2; 

%ЗАВДАННЯ 1
%графік функції на інтервалі (-pi; pi)
figure
f= @(x)(x.^2).*exp(-(x.^2)/2);
ezplot(f,[a,b]);
xlabel('x')
ylabel('y')
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
box off

%ЗАВДАННЯ 2
%обчислення коефіцієнтів ряду Фур'є
l = (b - a) / 2;
a0 = (1 / 2*l) * integral(@(x)(x.^2 .* exp(-x.^2 / 2)), 0, l);
an = zeros(1, n+1);
an(1) = a0 / 2;
for i = 1:n
    an_i = (2 / l) * integral(@(x)((x.^2 .* exp(-x.^2 / 2)) .* cos(i*pi*x/l)), 0, l);
    an(i+1) = an_i;
end

% ЗАВДАННЯ 3
s = zeros(1, length(x));
for i = 1:n
    s = s + an(i+1) .* cos(i*x*pi/l);
end
fx = a0 + s;
disp(['Коефіцієнти Фур`є a_n = ', num2str(an)]);
disp(['Наближення рядом Фур`є з точністю до порядку ', num2str(n), ' в точцi x = ', num2str(x), ' дорівнює ', num2str(fx)]);

%ЗАВДАННЯ 4
%графіки гармонік 
figure
k_n = 0:n;
stem(k_n, an);
title('Графік гармоніки a_n');

%ЗАВДАННЯ 5
f = @(x) (x.^2).*exp(-x.^2/2);
x = linspace(a, b, 50);
y_approx = zeros(size(x));
y_exact = zeros(size(x));
for i = 1:length(x)
    y_approx(i) = fx;
    y_exact(i) = f(x(i));
end
%обчислення відносної похибки наближення
error = abs((y_approx - y_exact) ./ y_exact);
%візуалізація відносної похибки наближення 
figure
plot(x, error, 'k', 'LineWidth', 2)
xlabel('x')
ylabel('Відносна похибка')
title('Відносна похибка наближення розкладом Фур`є')
grid on
print('output.pdf', '-dpdf')

%ЗАВДАННЯ 6
%запис результатів у файл
fileID = fopen('OutputLab1.txt', 'w');
fprintf(fileID, 'Порядок: %d\n', n);
fprintf(fileID, 'Обчислені коефіцієнти an: %s\n', num2str(an));
fprintf(fileID, 'Відносна похибка наближення:\n');
for i = 1:length(error)
    fprintf(fileID, '%f\n', error(i));
end
fclose(fileID);