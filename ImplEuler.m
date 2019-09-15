function y = ImplEuler(f, t, h, x0)
    y = zeros(2, length(t));
    y(1, 1) = x0(1);
    y(2, 1) = x0(2);
    timespan = [t(1); t(length(t)-1)];
    for n=1:length(y)-1
        fun = @(x)implFunc(y(:, n), x, h, f);
        y(:, n+1) = fsolve(fun, timespan);
    end
end

function y = implFunc(yn, ynn, h, f)
    y = yn + h*f(ynn)-ynn;
end