n = 0:4;
x = [1, 2, -3, 2, 1];
h = [1, 0, -1, -1, 1];
N = length(x);


y_fold = zeros(1, N);
for i = 0:N-1
    sum_val = 0;
    for k = 0:N-1
        idx = pmodulo(i - k, N) + 1;
        sum_val = sum_val + h(k+1) * x(idx);
    end
    y_fold(i+1) = sum_val;
end
disp("Kết quả bằng phương pháp Folding & Shifting:");
disp(y_fold);


X_c = zeros(N, N);
for i = 1:N
    for j = 1:N
        idx = pmodulo((i-1) - (j-1), N) + 1;
        X_c(i, j) = x(idx);
    end
end

y_matrix = X_c * h';
disp("Kết quả bằng phương pháp Matrix:");
disp(y_matrix');


E_x = x.^2;
E_y = y_fold.^2;

figure();


subplot(4,1,1);
plot2d3(n, x, style=2);
plot(n, x, 'bo', 'MarkerFaceColor', 'b');
a = gca();
a.x_location = "origin";
title("$x(n)$", "fontsize", 4);
xlabel("$n$", "fontsize", 3);
ylabel("$Amplitude$", "fontsize", 3);


subplot(4,1,2);
plot2d3(n, y_fold, style=5);
plot(n, y_fold, 'ro', 'MarkerFaceColor', 'r');
a = gca();
a.x_location = "origin";
title("$y(n) = x(n) * h(n)$", "fontsize", 4);
xlabel("$n$", "fontsize", 3);
ylabel("$Amplitude$", "fontsize", 3);


subplot(4,1,3);
plot2d3(n, E_x, style=2);
plot(n, E_x, 'bo', 'MarkerFaceColor', 'b');
a = gca();
a.x_location = "origin";
title("$Energy\ E_x(n)$", "fontsize", 4);
xlabel("$n$", "fontsize", 3);
ylabel("$Energy$", "fontsize", 3);


subplot(4,1,4);
plot2d3(n, E_y, style=5);
plot(n, E_y, 'ro', 'MarkerFaceColor', 'r');
a = gca();
a.x_location = "origin";
title("$Energy\ E_y(n)$", "fontsize", 4);
xlabel("$n$", "fontsize", 3);
ylabel("$Energy$", "fontsize", 3);
