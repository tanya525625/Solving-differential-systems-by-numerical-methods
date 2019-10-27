function y = ImplEuler(obj)
    y = obj.y;
    for n=1:length(y)-1
        func = @(x)implFunc(y(:, n), x, obj.h, obj.func);
        y(:, n+1) = fsolve(func, y(:, n));
    end
end

function delta = implFunc(yn, ynn, h, f)
    delta = yn + h*f(ynn)-ynn;
end 