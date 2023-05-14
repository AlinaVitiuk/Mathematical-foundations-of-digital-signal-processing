% Підпрограма для обчислення коефіцієнта Фур'є C_k
function Ck = fourier_coefficient(k, x)
    Ak = fourier_coefficient_k(k, real(x));
    Bk = fourier_coefficient_k(k, imag(x));
    Ck = Ak + 1i * Bk;
end