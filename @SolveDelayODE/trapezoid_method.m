function y = trapezoid_method(obj)
    y = obj.y;
    bounds = [obj.timespan(1); obj.timespan(end)];
    for n=1:length(y)-1
        z = find_retarded_t(obj, y, n+1);
        fun = @(x)trapFunc(y(:, n), x, obj, z);
        y(:, n+1) = fsolve(fun, bounds);
    end
end

function delta = trapFunc(y, ynn, obj, z)
    delta = y + obj.h / 2 * (obj.retarded_func(y, z) + ...
                             obj.retarded_func(ynn, z)) - ynn;
end