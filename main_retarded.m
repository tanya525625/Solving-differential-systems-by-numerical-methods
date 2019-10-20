span_start = 0;
span_end = 40;
count = 500;
approx_init_1 = 1;
approx_init_2 = 0;
history_func = @history_func
retarded_func = @retarded_func1
t_retarded = pi/2;
args_count = 2;


diffEq1 = SolveDelayODE(span_start, span_end, count, t_retarded, approx_init_1,... 
                        approx_init_2, args_count, retarded_func,...
                        history_func);
                  
dy1 = diffEq1.ExplEuler;
show_plots_for_method(diffEq1.timespan, dy1, 'Explicit Euler')

dy2 = diffEq1.ImplEuler;
show_plots_for_method(diffEq1.timespan, dy2, 'Implicit Euler')

dy3 = diffEq1.symplecticEuler;
show_plots_for_method(diffEq1.timespan, dy3, 'symplectic Euler')

dy4 = diffEq1.StormerVerlet;
show_plots_for_method(diffEq1.timespan, dy4, 'Stormer-Verlet method')

dy5 = diffEq1.trapezoid_method;
show_plots_for_method(diffEq1.timespan, dy5, 'Trapezoid method');