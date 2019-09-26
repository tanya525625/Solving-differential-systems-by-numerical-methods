function res = interpolation(time_point, timespan_t, yn, ynn, h)
    tetta = (time_point - timespan_t) / h;
    res = yn * (1 - tetta) + ynn;
end