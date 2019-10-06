function y = symplecticEuler(obj)
    y = obj.y;
    bounds = [obj.timespan(1); obj.timespan(end)];
    for n=1:obj.timespan_length-1
        z = find_retarded_t(obj, y, n);
        fun = @(x)symplFunc(y(:, n), x, obj, z);
        y(:, n+1) = fsolve(fun, bounds);
    end
end

function delta = symplFunc(yn, ynn, obj, z)
    fyn = obj.retarded_func(yn, z);
    fynn = obj.retarded_func(ynn, z);
    delta(1) = yn(1) + obj.h*fynn(1) - ynn(1);
    delta(2) = yn(2) + obj.h*fyn(2) - ynn(2);
end