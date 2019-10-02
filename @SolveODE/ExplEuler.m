function y = ExplEuler(obj)
    y = obj.y;
   
    for n=1:obj.timespan_length-1
        y(:, n+1) = y(:, n) + obj.h*obj.func(y(:, n));                                   
    end
end