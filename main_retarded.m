span_start = 0;
span_end = 40;
count = 500;
approx_init_1 = 1;
approx_init_2 = 0;
history_func = @history_func
retarded_func = @retarded_func1
t_retarded = 2*pi;
args_count = 2;


diffEq1 = SolveDelayODE(span_start, span_end, count, t_retarded, approx_init_1,... 
                      approx_init_2, args_count, retarded_func,...
                      history_func);
                  
dy1 = diffEq1.ExplEuler;
make_plot(diffEq1.timespan, dy1, 'Explicit Euler');

dy2 = diffEq1.ImplEuler;
make_plot(diffEq1.timespan, dy2, 'Implicit Euler')

dy3 = diffEq1.symplecticEuler;
make_plot(diffEq1.timespan, dy3, 'Symplectic Euler')
% plot(diffEq1.timespan, sin(diffEq1.timespan), '--')
% plot(diffEq1.timespan, cos(diffEq1.timespan), '--')

dy4 = diffEq1.StormerVerlet;
make_plot(diffEq1.timespan, dy4, 'Stormer-Verlet method')
% plot(diffEq1.timespan, sin(diffEq1.timespan), '--')
% plot(diffEq1.timespan, cos(diffEq1.timespan), '--')