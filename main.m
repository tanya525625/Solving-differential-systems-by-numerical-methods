span_start = 0;
span_end = 100;
count = 1000;
h = (span_end-span_start)/count;
t = a:h:b;
approx_init_1 = 1;
approx_init_2 = 0;
x0 = [approx_init_1, approx_init_2];

dy1 = ExplEuler(@func, t, h, x0);
figure('Name','Explicit Euler');
title('Explicit Euler')
plot(t, dy1)

dy2 = ImplEuler(@func, t, h, x0);
figure('Name','Implicit Euler');
title('Implicit Euler')
plot(t, dy2)