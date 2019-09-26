span_start = 0;
span_end = 20;
count = 100;
approx_init_1 = 1;
approx_init_2 = 0;
investigated_func = @func;


diffEq1 = SolveDiffEq(span_start, span_end, count, approx_init_1,... 
                      approx_init_2, investigated_func);
                  

dy1 = diffEq1.ExplEuler;
make_plot(diffEq1.timespan, dy1, 'Explicit Euler')


dy2 = diffEq1.ImplEuler;
make_plot(diffEq1.timespan, dy2, 'Implicit Euler')


dy3 = diffEq1.symplecticEuler;
make_plot(diffEq1.timespan, dy3, 'Symplectic Euler')
plot(diffEq1.timespan, sin(diffEq1.timespan), '--')
plot(diffEq1.timespan, cos(diffEq1.timespan), '--')


dy4 = diffEq1.StormerVerlet;
make_plot(diffEq1.timespan, dy4, 'Stormer-Verlet method')
plot(diffEq1.timespan, sin(diffEq1.timespan), '--')
plot(diffEq1.timespan, cos(diffEq1.timespan), '--')