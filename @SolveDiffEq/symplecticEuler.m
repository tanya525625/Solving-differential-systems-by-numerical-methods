function y = symplecticEuler(obj)
    y = obj.y;
    bounds = [obj.timespan(1); obj.timespan(end)];
    for n=1:obj.timespan_length-1
        fun = @(x)symplFunc(y(:, n), x, obj.h, obj.func);
        y(:, n+1) = fsolve(fun, bounds);
    end
end

function y = symplFunc(yn, ynn, h, f)
    fyn = f(yn);
    fynn = f(ynn);
    y(1) = yn(1) + h*fynn(1) - ynn(1);
    y(2) = yn(2) + h*fyn(2) - ynn(2);
end