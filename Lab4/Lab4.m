% Задані параметри
A = 5.0;  % Амплітуда синусоїди
n = 2;  % Параметр n
phi = pi / 4;  % Зсув по фазі
N = n * 1000;  % Кількість значень у послідовності

% Генерація тестової послідовності з випадковими спотвореннями
x = linspace(0, 4, N);  % Інтервал x для вимірювання значень
y_exact = A * sin(n * x + phi);  % Точне значення без спотворень
deviation = (rand(1, N) - 0.5) * 0.1 * A;  % Випадкове спотворення
y = y_exact + deviation;  % Загальна послідовність зі спотвореннями

% Обчислення середніх значень
arithmetic = mean(y);
harmonic = N / sum(1 ./ y);
geometric = prod(y(y > 0)) ^ (1 / sum(~isnan(y)));

% Вивід результатів
fprintf('\nАрифметичне середнє: %f\n', arithmetic);
fprintf('Гармонійне середнє: %f\n', harmonic);
fprintf('Геометричне середнє: %f\n', geometric);

% Виведення графіку
plot(x, y, 'Color', [0.8500 0.3250 0.0980], 'DisplayName', 'Зі спотвореннями');
hold on;
plot(x, y_exact, 'Color', 'b', 'DisplayName', 'Точне значення');
line([min(x), max(x)], [0, 0], 'Color', 'k', 'DisplayName', 'Вісь x'); % Додана лінія вісі x
xlabel('x');
ylabel('y');
legend('show');
hold off;

% Обчислення точного значення та порівняння з наближеним
exact = A * sin(n * x + phi);
absolute_error = abs(y - exact);
relative_error = absolute_error ./ abs(exact);

% Порівняння максимумів і мінімумів похибок
max_absolute_error = max(absolute_error);
min_absolute_error = min(absolute_error);
max_relative_error = max(relative_error);
min_relative_error = min(relative_error);

fprintf('\nМаксимальна абсолютна похибка: %f\n', max_absolute_error);
fprintf('Мінімальна абсолютна похибка: %f\n', min_absolute_error);
fprintf('\nМаксимальна відносна похибка: %f\n', max_relative_error);
fprintf('Мінімальна відносна похибка: %f\n', min_relative_error);
