span_start = 0;
span_end = 40;
count = 100;
approx_init_1 = 1;
approx_init_2 = 0;
investigated_func = @func;
history_func = @history_func
retarded_func = @retarded_func1
t_retarded = pi;
args_count = 2;


diffEq1 = SolveDiffEq(span_start, span_end, count, t_retarded, approx_init_1,... 
                      approx_init_2, investigated_func, args_count, retarded_func,...
                      history_func);
                  
ODE = SolveODE(span_start, span_end, count, approx_init_1,... 
                approx_init_2, investigated_func);
                  
dy1_ODE = ODE.ExplEuler;
make_plot(ODE.timespan, dy1_ODE, 'Explicit Euler');

dy2_ODE = ODE.ImplEuler;
make_plot(ODE.timespan, dy2_ODE, 'Implicit Euler');
            
dy3_ODE = ODE.symplecticEuler;
make_plot(ODE.timespan, dy3_ODE, 'Symplectic Euler')
plot(ODE.timespan, sin(ODE.timespan), '--')
plot(ODE.timespan, cos(ODE.timespan), '--')

dy4_ODE = ODE.StormerVerlet;
make_plot(ODE.timespan, dy4_ODE, 'Stormer-Verlet method')
plot(ODE.timespan, sin(ODE.timespan), '--')
plot(ODE.timespan, cos(ODE.timespan), '--')

% dy1 = diffEq1.ExplEuler;
% make_plot(diffEq1.timespan, dy1, 'Explicit Euler');
% 
% dy2 = diffEq1.ImplEuler;
% make_plot(diffEq1.timespan, dy2, 'Implicit Euler')
% 
% dy3 = diffEq1.symplecticEuler;
% make_plot(diffEq1.timespan, dy3, 'Symplectic Euler')
% plot(diffEq1.timespan, sin(diffEq1.timespan), '--')
% plot(diffEq1.timespan, cos(diffEq1.timespan), '--')
% 
% dy4 = diffEq1.StormerVerlet;
% make_plot(diffEq1.timespan, dy4, 'Stormer-Verlet method')
% plot(diffEq1.timespan, sin(diffEq1.timespan), '--')
% plot(diffEq1.timespan, cos(diffEq1.timespan), '--')