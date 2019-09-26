span_start = 0;
span_end = 20;
count = 100;
approx_init_1 = 1;
approx_init_2 = 0;
investigated_func = @func;


diffEq1 = SolveDiffEq(span_start, span_end, count, approx_init_1,... 
                      approx_init_2, investigated_func);
                  

dy1 = diffEq1.ExplEuler;
figure('Name','Explicit Euler');
hold on;
grid on;
title('Explicit Euler')
plot(diffEq1.timespan, dy1)   


dy2 = diffEq1.ImplEuler;
figure('Name','Implicit Euler');
hold on;
grid on;
title('Implicit Euler')
plot(diffEq1.timespan, dy2)


dy3 = diffEq1.symplecticEuler;
figure('Name','Symplectic Euler');
hold on;
grid on;
title('Symplectic Euler')
plot(diffEq1.timespan, sin(diffEq1.timespan), '--')
plot(diffEq1.timespan, cos(diffEq1.timespan), '--')
plot(diffEq1.timespan, dy3)


dy4 = diffEq1.StormerVerlet;
figure('Name','Stormer-Verlet method');
hold on;
grid on;
title('Stormer-Verlet method')
plot(diffEq1.timespan, sin(diffEq1.timespan), '--')
plot(diffEq1.timespan, cos(diffEq1.timespan), '--')
plot(diffEq1.timespan, dy4)