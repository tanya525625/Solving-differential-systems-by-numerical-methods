function res = interpolation(t_retarded, t, y, k)
    tetta = (t_retarded - t(k)) / h
    res = y(k) * (1 - tetta) + y(k+1)
end