function y = ExplEuler(f, t, h, x0)
    y = zeros(2, length(t));
    y(1, 1) = x0(1);
    y(2, 1) = x0(2);
    for n=1:length(t)-1
        y(:, n+1) = y(:, n)+ h*f(y(:, n));
    end
end