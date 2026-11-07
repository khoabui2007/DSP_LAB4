n_x = 0:4;
x = [1, 2, -3, 2, 1];
Lx = length(x);

n_h = 0:2;
h = [1, 0, -1];
Lh = length(h);

Ly = Lx + Lh - 1;
n_y = 0:Ly-1;


y_fold = zeros(1, Ly);
for i = 0:Ly-1
    sum_val = 0;
    for k = 0:Lh-1
        idx_x = i - k; 
        if (idx_x >= 0 & idx_x < Lx) then
            sum_val = sum_val + h(k+1) * x(idx_x+1);
        end
    end
    y_fold(i+1) = sum_val;
end
disp("Kết quả bằng phương pháp Folding & Shifting:");
disp(y_fold);


X_matrix = zeros(Ly, Lh);

for i = 1:Lh
    X_matrix(i : i+Lx-1, i) = x';
end

y_matrix = X_matrix * h';
disp("Kết quả bằng phương pháp Matrix:");
disp(y_matrix');

y_conv = y_fold;
E_x = x.^2;
E_y = y_conv.^2;

figure();

subplot(4,1,1);
plot2d3(n_x, x, style=2);
plot(n_x, x, 'bo', 'MarkerFaceColor', 'b');
a = gca();
a.x_location = "origin";
title("$x(n)$", "fontsize", 4);
xlabel("$n$", "fontsize", 3);
ylabel("$Amplitude$", "fontsize", 3);


subplot(4,1,2);
plot2d3(n_y, y_conv, style=5);
plot(n_y, y_conv, 'ro', 'MarkerFaceColor', 'r');
a = gca();
a.x_location = "origin";
title("$y(n) = x(n) * h(n)$", "fontsize", 4);
xlabel("$n$", "fontsize", 3);
ylabel("$Amplitude$", "fontsize", 3);


subplot(4,1,3);
plot2d3(n_x, E_x, style=2);
plot(n_x, E_x, 'bo', 'MarkerFaceColor', 'b');
a = gca();
a.x_location = "origin";
title("$Energy\ E_x(n)$", "fontsize", 4);
xlabel("$n$", "fontsize", 3);
ylabel("$Energy$", "fontsize", 3);


subplot(4,1,4);
plot2d3(n_y, E_y, style=5);
plot(n_y, E_y, 'ro', 'MarkerFaceColor', 'r');
a = gca();
a.x_location = "origin";
title("$Energy\ E_y(n)$", "fontsize", 4);
xlabel("$n$", "fontsize", 3);
ylabel("$Energy$", "fontsize", 3);
