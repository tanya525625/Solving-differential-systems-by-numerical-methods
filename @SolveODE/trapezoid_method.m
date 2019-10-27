function y = trapezoid_method(obj)
    y = obj.y;
    for n=1:length(y)-1
        func = @(x)trapFunc(y(:, n), x, obj.h, obj.func);
        y(:, n+1) = fsolve(func, y(:, n));
    end
end

function delta = trapFunc(yn, ynn, h, f)
    delta = yn + h / 2 *(f(yn) + f(ynn)) - ynn;
end 