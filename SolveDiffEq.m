classdef SolveDiffEq
   properties
      approx_init
      h
      time_span 
      func
   end
   methods        
       function obj = SolveDiffEq(span_start, span_end, count,...
                                  approx_init_1, approx_init_2, func)
            obj.h = (span_end - span_start) / count;
            obj.approx_init = [approx_init_1, approx_init_2];
            obj.func = func;
            obj.time_span = span_start:obj.h:span_end;
       end
       
       symplecticEuler(obj)
       
   end
end
