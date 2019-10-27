function y = trapezoid_method(obj)
    y = obj.y;
    for n=1:length(y)-1
        z_n = find_retarded_t(obj, y, n);
        z_nn = find_retarded_t(obj, y, n+1);
        fun = @(x)trapFunc(y(:, n), x, obj, z_n, z_nn);
        y(:, n+1) = fsolve(fun, y(:, n));
    end
end

function delta = trapFunc(y, ynn, obj, z_n, z_nn)
    delta = y + obj.h / 2 * (obj.retarded_func(y, z_n) + ...
                             obj.retarded_func(ynn, z_nn)) - ynn;
end