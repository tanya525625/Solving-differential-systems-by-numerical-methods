function show_plots_for_method(timespan, y, title)
    make_plot(timespan, y, title);
    energy = find_energy(y);
    energy_plot_title = strcat('energy for ', title);
    make_plot(timespan, energy, energy_plot_title);   
%   plot(diffEq1.timespan, sin(diffEq1.timespan), '--')
%   plot(diffEq1.timespan, cos(diffEq1.timespan), '--')
end