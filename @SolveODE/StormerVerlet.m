function y = StormerVerlet(obj)
    y = obj.y;
    bounds = [obj.timespan(1); obj.timespan(end)];
    for n=1:obj.timespan_length-1
        fun = @(x)StormerFunc(y(:, n), x, obj);
        y(:, n+1) = fsolve(fun, bounds);
    end
end

function delta = StormerFunc(yn, ynn, obj)
    fyn = obj.func(yn);
    fynn = obj.func(ynn);
    y1_half = yn(1) + obj.h/2*fyn(1);
    delta(2) = yn(2) + obj.h*y1_half - ynn(2);
    delta(1) = y1_half + obj.h/2*fynn(1) - ynn(1);
end