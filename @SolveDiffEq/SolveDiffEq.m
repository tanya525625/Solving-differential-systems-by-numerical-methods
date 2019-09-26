classdef SolveDiffEq
   properties
      approx_init
      y
      h
      timespan 
      func
      timespan_length
   end
   methods   
       function obj = SolveDiffEq(span_start, span_end, count,...
                                  approx_init_1, approx_init_2, func)
            obj.h = (span_end - span_start) / count;
            obj.approx_init = [approx_init_1, approx_init_2];
            obj.func = func;
            obj.timespan = span_start:obj.h:span_end;
            obj.timespan_length = length(obj.timespan)
            obj.y = zeros(2, obj.timespan_length);
            obj.y(1, 1) = obj.approx_init(1);
            obj.y(2, 1) = obj.approx_init(2);
       end
       y = symplecticEuler(obj);
       y = ExplEuler(obj);
       y = ImplEuler(obj);
       y = StormerVerlet(obj);
   end
end


