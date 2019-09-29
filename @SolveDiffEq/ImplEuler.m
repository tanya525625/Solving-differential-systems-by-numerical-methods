function y = ImplEuler(obj)
    y = obj.y;
    bounds = [obj.timespan(1); obj.timespan(end)];
    for n=1:length(y)-1
       
        fun = @(x)implFunc(y, x, obj, n);
        y(:, n+1) = fsolve(fun, bounds);
    end
end

function delta = implFunc(y, ynn, obj, n)
    T = obj.timespan;
    delay = T(n) - obj.t_retarded;
    next_t_ind = find(T > delay, 1);
    prev_t_ind = next_t_ind - 1;
    next_t = obj.timespan(next_t_ind);
    prev_t = obj.timespan(prev_t_ind);
    y_prev = y(:, prev_t_ind);
    y_next = y(:, next_t_ind);
    
    interpolated_y = interpolation(delay, prev_t, ...
                                   next_t, ... 
                                   obj.func(y_prev, n), ... 
                                   obj.func(y_next, n));
    
    delta = y(:, n)+ obj.h*interpolated_y - ynn;
end