function y = ImplEuler(obj)
    y = obj.y;
    bounds = [obj.timespan(1); obj.timespan(end)];
    for n=1:length(y)-1
        fun = @(x)implFunc(y(:, n), x, obj, n);
        y(:, n+1) = fsolve(fun, bounds);
    end
end

function delta = implFunc(yn, ynn, obj, n)
    interpolated_y = interpolation(obj.timespan(n) - obj.t_retarded,...
                                   obj.timespan(n), obj.func(yn),... 
                                   obj.func(ynn), obj.h);
    delta = yn + obj.h*interpolated_y - ynn;
end