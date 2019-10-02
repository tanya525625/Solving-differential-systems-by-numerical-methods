span_start = 0;
span_end = 40;
count = 100;
approx_init_1 = 1;
approx_init_2 = 0;
investigated_func = @func;

                  
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

