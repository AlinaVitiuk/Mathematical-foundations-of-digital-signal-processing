% Підпрограма для обчислення k-го члена ряду Фур'є
function [c] = fourier_coefficient_k(k, x)
    N = length(x);
    n = 0:N-1;
    c = exp(-2i * pi * k * n / N);
    c = dot(x, c);
end