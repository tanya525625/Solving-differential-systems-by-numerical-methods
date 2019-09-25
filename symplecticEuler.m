function y = symplecticEuler(obj)
    y = zeros(2, length(t));
    y(1, 1) = x0(1);
    y(2, 1) = x0(2);
    timespan = [t(1); t(length(t)-1)];
    for n=1:length(y)-1
        fun = @(x)symplFunc(y(:, n), x, h, f);
        y(:, n+1) = fsolve(fun, timespan);
    end
end

function y = symplFunc(yn, ynn, h, f)
    fyn = f(yn);
    fynn = f(ynn);
    y(1) = yn(1) + h*fynn(1) - ynn(1);
    y(2) = yn(2) + h*fyn(2) - ynn(2);
end