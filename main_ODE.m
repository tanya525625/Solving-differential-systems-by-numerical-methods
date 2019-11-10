span_start = 0;
span_end = 40;
count = 1000;
approx_init_1 = 1;
approx_init_2 = 0;
investigated_func = @func;

                  
% ODE = SolveODE(span_start, span_end, count, approx_init_1,... 
%                 approx_init_2, investigated_func);
%                   
%             
% dy1_ODE = ODE.ExplEuler;
% show_plots_for_method(ODE.timespan, dy1_ODE, 'Explicit Euler');
% 
% dy2_ODE = ODE.ImplEuler;
% show_plots_for_method(ODE.timespan, dy2_ODE, 'Implicit Euler');
% 
% dy3_ODE = ODE.symplecticEuler;
% show_plots_for_method(ODE.timespan, dy3_ODE, 'Symplectic Euler')
% 
% dy4_ODE = ODE.StormerVerlet;
% show_plots_for_method(ODE.timespan, dy4_ODE, 'Stormer-Verlet method')
% 
% dy5_ODE = ODE.trapezoid_method;
% show_plots_for_method(ODE.timespan, dy5_ODE, 'Trapezoid method')


q = 2;
a = [1, 1];
b = 1;
q = 1;
a = 1;
b = 1;
st_area = stability_analysis(q, a, b);
plot(real(st_area), imag(st_area));

% h = 0.1;
% timespan = 0:h:2*pi;
% i = sqrt(-1);
% y = zeros(length(timespan));
% for Q=1:length(timespan)
%     y(Q) = - (-exp(Q*i) + 1)/exp(Q*i);
% end
% plot(real(y), imag(y))

