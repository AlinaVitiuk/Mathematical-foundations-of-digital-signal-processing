% Підпрограма для обчислення кількості операцій
function [num_mult, num_add] = um_mult_add(k, x)
    N = length(x);
    num_mult = 4 * N;
    num_add = N - 1;
    fprintf("Кількість операцій множення: %d\n", num_mult);
    fprintf("Кількість операцій додавання: %d\n\n", num_add);
end