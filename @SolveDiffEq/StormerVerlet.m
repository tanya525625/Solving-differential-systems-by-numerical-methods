function y = StormerVerlet(obj)
    y = obj.y
    bounds = [obj.timespan(1); obj.timespan(end)];
    for n=1:obj.timespan_length-1
        fun = @(x)StormerFunc(y(:, n), x, obj.h, obj.func);
        y(:, n+1) = fsolve(fun, bounds);
    end
end

function y = StormerFunc(yn, ynn, h, f)
    fyn = f(yn);
    fynn = f(ynn);
    y1_half = yn(1) + h/2*fyn(1);
    y(2) = yn(2) + h*y1_half - ynn(2);
    y(1) = y1_half + h/2*fynn(1) - ynn(1);
end