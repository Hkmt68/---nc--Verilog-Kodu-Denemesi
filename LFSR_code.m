clear; clc;

x = de2bi(12345, 32);
file_id = fopen('matlab_lfsr_out.txt', 'w');

for i = 1:200
    feedback = xor(x(32), xor(x(21), xor(x(2), x(1))));
    x = [feedback, x(1:31)];
    output = x(32);
    fprintf(file_id, '%d\r\n', output);
end

fclose(file_id);
