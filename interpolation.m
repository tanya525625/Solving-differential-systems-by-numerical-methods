function res = interpolation(t_var, t, y, k, h)
    tetta = (t_var - t(k)) / h
    res = y(k) * (1 - tetta) + y(k+1)
end