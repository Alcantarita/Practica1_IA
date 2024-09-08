% Aldo Alcantara Martinez  Grupo6CV3
% Codigo Busqueda valores
% Definir la función f(x, y)
f = @(x, y) (1.5 - x + x .* y).^2 + ...
            (2.25 - x + x .* y.^2).^2 + ...
            (2.625 - x + x .* y.^3).^2;

% Rango de valores para x e y
x_range = linspace(-4.5, 4.5, 100);
y_range = linspace(-4.5, 4.5, 100);

% Crear una malla de valores para x e y
[X, Y] = meshgrid(x_range, y_range);

% Evaluar la función en la malla
Z = f(X, Y);

% Graficar la superficie de la función
figure;
surf(X, Y, Z, 'EdgeColor', 'none');
colorbar;
title('Superficie de la función f(x, y)');
xlabel('x');
ylabel('y');
zlabel('f(x, y)');
view(150, 30);

% Realizar la búsqueda aleatoria
max_iter = 10000;
x_min = 0; y_min = 0; f_min = Inf; % Inicializar con valores máximos

for i = 1:max_iter
    % Generar valores aleatorios para x e y en el rango [-4.5, 4.5]
    x = -4.5 + (9.0) * rand();
    y = -4.5 + (9.0) * rand();
    
    % Evaluar la función f(x, y)
    f_value = f(x, y);
    
    % Si encontramos un nuevo mínimo, lo guardamos
    if f_value < f_min
        f_min = f_value;
        x_min = x;
        y_min = y;
    end
end

% Mostrar el valor mínimo encontrado
fprintf('Valor mínimo encontrado: x = %.6f, y = %.6f, f(x, y) = %.6f\n', x_min, y_min, f_min);

% Añadir el punto mínimo encontrado a la gráfica
hold on;
plot3(x_min, y_min, f_min, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
legend('Superficie de f(x, y)', 'Mínimo encontrado');

% Añadir una gráfica de contorno
figure;
contour(X, Y, Z, 50);
colorbar;
hold on;
plot(x_min, y_min, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
title('Contorno de la función f(x, y)');
xlabel('x');
ylabel('y');
legend('Contorno de f(x, y)', 'Mínimo encontrado');
