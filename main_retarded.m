span_start = 0;
span_end = 40;
count = 1000;
approx_init_1 = 1;
approx_init_2 = 0;
approx_init = [approx_init_1, approx_init_2];
history_func = @history_func;
retarded_func = @retarded_func1;
inv_func2 = @retarded_func_scalar;
t_retarded = pi/2;
args_count = 2;


diffEq1 = SolveDelayODE(span_start, span_end, count, t_retarded, approx_init,... 
                        args_count, retarded_func,...
                        history_func);
                    
approx_init = 1;
args_count = 1;
diffEq2 = SolveDelayODE(span_start, span_end, count, t_retarded, approx_init,... 
                        args_count, inv_func2,...
                        @history_scalar);
                  
dy1 = diffEq1.ExplEuler;
show_plots_for_method(diffEq1.timespan, dy1, 'Explicit Euler')

dy2 = diffEq1.ImplEuler;
show_plots_for_method(diffEq1.timespan, dy2, 'Implicit Euler')

% dy3 = diffEq2.symplecticEuler;
% show_plots_for_method(diffEq1.timespan, dy3, 'symplectic Euler')
% 
% dy4 = diffEq2.StormerVerlet;
% show_plots_for_method(diffEq1.timespan, dy4, 'Stormer-Verlet method')

dy5 = diffEq1.trapezoid_method;
show_plots_for_method(diffEq1.timespan, dy5, 'Trapezoid method');