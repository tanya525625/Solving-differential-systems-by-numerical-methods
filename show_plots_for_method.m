function show_plots_for_method(timespan, y, title)
      make_plot(timespan, y, title);
      energy = find_energy(y);
      energy_plot_title = strcat('energy for ', 32, title);
      make_plot(timespan, energy, energy_plot_title);   
%     plot(timespan, sin(timespan), '--')
%     plot(timespan, cos(dtimespan), '--')
end