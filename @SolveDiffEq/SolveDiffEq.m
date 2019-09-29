classdef SolveDiffEq
    %{
        Class for solving differential equans
    
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
      args_count
      approx_init
      y
      h
      timespan 
      func
      retarded_func
      timespan_length
      t_retarded
   end
   methods   
       function obj = SolveDiffEq(span_start, span_end, count, const,...
                                  approx_init_1, approx_init_2, func, ...
                                  args_count, retarded_func)
            obj.h = (span_end - span_start) / count;
            obj.approx_init = [approx_init_1, approx_init_2];
            obj.func = func;
            obj.retarded_func = retarded_func;
            obj.timespan = span_start:obj.h:span_end;
            obj.timespan_length = length(obj.timespan)
            obj.y = zeros(2, obj.timespan_length);
            obj.y(1, 1) = obj.approx_init(1);
            obj.y(2, 1) = obj.approx_init(2);
            obj.t_retarded = const
            obj.args_count = args_count
       end
       y = symplecticEuler(obj);
       y = ExplEuler(obj);
       y = ImplEuler(obj);
       y = StormerVerlet(obj);
   end
end


