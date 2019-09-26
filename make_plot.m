function make_plot(timespan, y, plot_title)
    figure('Name', plot_title);
    hold on;
    grid on;
    title(plot_title)
    plot(timespan, y)   
end
