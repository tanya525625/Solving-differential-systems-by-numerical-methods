function dy = retarded_func1(y, t, h, span, k)
    retarded_const = pi;
    if mod(t-retarded_const, h) == 0
        dy = [-y(2, t-retarded_const); y(1, t)];
    else 
%         if t - retarded_const < span(0)
%             t1 = 0;
%             if t - retarded_const < h
%                 t2 = 0;
%             end
%         end
        interpolated_y = interpolation(t-retarded_const, span, y, k);
        dy = [interpolated_y, y(1, t)];
    end
end