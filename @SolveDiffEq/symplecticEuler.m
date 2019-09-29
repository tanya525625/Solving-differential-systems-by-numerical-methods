function y = symplecticEuler(obj)
    y = obj.y;
    bounds = [obj.timespan(1); obj.timespan(end)];
    for n=1:obj.timespan_length-1
        fun = @(x)symplFunc(y, x, obj, n);
        y(:, n+1) = fsolve(fun, bounds);
    end
end

function y = symplFunc(y, ynn, obj, n)
    T = obj.timespan;
    delay = T(n) - obj.t_retarded;
    next_t_ind = find(T > delay, 1);
    prev_t_ind = next_t_ind - 1;
    next_t = obj.timespan(next_t_ind);
    prev_t = obj.timespan(prev_t_ind);
    y_prev = y(:, prev_t_ind);
    y_next = y(:, next_t_ind);
    yn = y(:, n);

    interpolated_y = interpolation(delay, prev_t, ...
                                   next_t, ... 
                                   obj.func(y_prev, n), ... 
                                   obj.func(y_next, n));
                               

    fyn = interpolated_y;
    fynn = obj.func(ynn);
    y(1) = yn(1) + obj.h*fynn(1) - ynn(1);
    y(2) = yn(2) + obj.h*fyn(2) - ynn(2);
end