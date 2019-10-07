function y = symplecticEuler(obj)
    y = obj.y;
    bounds = [obj.timespan(1); obj.timespan(end)];
    for n=1:obj.timespan_length-1
        z_n = find_retarded_t(obj, y, n);
        z_nn = find_retarded_t(obj, y, n+1);
        fun = @(x)symplFunc(y(:, n), x, obj, z_n, z_nn);
        y(:, n+1) = fsolve(fun, bounds);
    end
end

function delta = symplFunc(yn, ynn, obj, z_n, z_nn)
    fyn = obj.retarded_func(yn, z_n);
    fynn = obj.retarded_func(ynn, z_nn);
    delta(1) = yn(1) + obj.h*fynn(1) - ynn(1);
    delta(2) = yn(2) + obj.h*fyn(2) - ynn(2);
end