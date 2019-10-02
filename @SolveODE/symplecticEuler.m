function y = symplecticEuler(obj)
    y = obj.y;
    bounds = [obj.timespan(1); obj.timespan(end)];
    for n=1:obj.timespan_length-1
        fun = @(x)symplFunc(y(:, n), x, obj);
        y(:, n+1) = fsolve(fun, bounds);
    end
end

function y = symplFunc(yn, ynn, obj)
    fyn = obj.func(yn);
    fynn = obj.func(ynn);
    y(1) = yn(1) + obj.h*fynn(1) - ynn(1);
    y(2) = yn(2) + obj.h*fyn(2) - ynn(2);
end