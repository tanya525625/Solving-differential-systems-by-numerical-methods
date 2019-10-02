function y = ImplEuler(obj)
    y = obj.y;
    bounds = [obj.timespan(1); obj.timespan(end)];
    for n=1:length(y)-1
        func = @(x)implFunc(y(:, n), x, obj.h, obj.func);
        y(:, n+1) = fsolve(func, bounds);
    end
end

function delta = implFunc(yn, ynn, h, f)
    delta = yn + h*f(ynn)-ynn;
end 