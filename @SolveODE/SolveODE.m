classdef SolveODE
    %{
        Class for solving ODE
    
        properties:
            approx_init: initial approximations
            y: system solution
            h: step 
            timespan: study period
            func: differential equation system
            timespan_length: count study period's segments 
            t_retarded: retarded argument
    %}
   properties
      y
      h
      timespan 
      func
      timespan_length
   end
   methods   
       function obj = SolveODE(span_start, span_end, count,...
                                  approx_init_1, approx_init_2, func)
            obj.h = (span_end - span_start) / count;
            obj.func = func;
            obj.timespan = span_start:obj.h:span_end;
            obj.timespan_length = length(obj.timespan)
            obj.y = zeros(2, obj.timespan_length);
            obj.y(1, 1) = approx_init_1;
            obj.y(2, 1) = approx_init_2;
       end
       y = symplecticEuler(obj);
       y = ExplEuler(obj);
       y = ImplEuler(obj);
       y = StormerVerlet(obj);
   end
end


