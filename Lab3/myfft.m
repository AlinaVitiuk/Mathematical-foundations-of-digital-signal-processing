% Швидке перетворення Фур'є за допомогою алгоритму Кулі-Тьюкі
function X =myfft(x)
    n = length(x);
    if n == 1
        X = x;
    else
        even = fft(x(1:2:end));
        odd = fft(x(2:2:end));
        factor = exp(-2i * pi / n * (0:n/2-1));
        X = [even + factor .* odd, even - factor .* odd];
    end
end
