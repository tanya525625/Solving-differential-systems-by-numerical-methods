function y = StormerVerlet(f, t, h, x0)
    y = zeros(2, length(t));
    y(1, 1) = x0(1);
    y(2, 1) = x0(2);
    timespan = [t(1); t(length(t)-1)];
    for n=1:length(y)-1
        fun = @(x)StormerFunc(y(:, n), x, h, f);
        y(:, n+1) = fsolve(fun, timespan);
    end
end

function y = StormerFunc(yn, ynn, h, f)
    fyn = f(yn);
    fynn = f(ynn);
    y1_half = yn(1) + h/2*fyn(1);
    y(2) = yn(2) + h*y1_half - ynn(2);
    y(1) = y1_half + h/2*fynn(1) - ynn(1);
end