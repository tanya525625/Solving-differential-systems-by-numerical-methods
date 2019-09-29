function y = ExplEuler(obj)
    y = obj.y;
    T = obj.timespan;
    z = zeros(obj.args_count, length(obj.t_retarded) + 1);
   
    for n=1:obj.timespan_length-1
        z(:, 1) = obj.func(y(:, n));
        delay = T(n) - obj.t_retarded;
        next_t_ind = find(T > delay, 1);
        if obj.timespan(n) - obj.t_retarded <= 0
            %z(:, 1) = obj.func(y(:, n));
            y(:, n+1) = obj.history_func(obj.timespan(n));
        else
            prev_t_ind = next_t_ind - 1;
            next_t = obj.timespan(next_t_ind);
            prev_t = obj.timespan(prev_t_ind);
            yn = y(:, prev_t_ind)
            ynn = y(:, next_t_ind);
            
            %TO DO: delays cycle
            delay_number = 1;
            delay_func_ind = delay_number + 1;

            z(:, delay_func_ind) = interpolation(delay, prev_t, ...
                                                   next_t, ... 
                                                   obj.func(yn), ... 
                                                   obj.func(ynn));
                         
             y(:, n+1) = y(:, n) + obj.h*obj.retarded_func(z);                                   
        end
        
    end
end