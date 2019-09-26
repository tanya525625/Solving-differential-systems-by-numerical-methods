function y = ExplEuler(obj)
    y = obj.y;
    for n=1:obj.timespan_length-1
        interpolated_y = interpolation(obj.timespan(n), timespan,...
                                       y, n, obj.h)
        y(:, n+1) = y(:, n)+ obj.h*obj.func(y(:, n));
    end
end