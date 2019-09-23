span_start = 0;
span_end = 20;
count = 100;
h = (span_end-span_start)/count;
t = span_start:h:span_end;
approx_init_1 = 1;
approx_init_2 = 0;
x0 = [approx_init_1, approx_init_2];
inv_func = @retarded_func1

dy1 = ExplEuler(inv_func, t, h, x0);
figure('Name','Explicit Euler');
title('Explicit Euler')
plot(t, dy1)

dy2 = ImplEuler(inv_func, t, h, x0);
figure('Name','Implicit Euler');

title('Implicit Euler')
plot(t, dy2)

dy3 = symplecticEuler(inv_func, t, h, x0);
figure('Name','Symplectic Euler');
hold on;
grid on;
title('Symplectic Euler')
plot(t, dy3)
plot(t, sin(t), '--')
plot(t, cos(t), '--')

dy4 = StormerVerlet(inv_func, t, h, x0);
figure('Name','Stormer-Verlet method');

hold on;
grid on;
title('Stormer-Verlet method')
plot(t, dy4)
plot(t, sin(t), '--')
plot(t, cos(t), '--')