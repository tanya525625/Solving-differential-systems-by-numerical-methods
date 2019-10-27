function y = StormerVerlet(obj)
    y = obj.y;
    for n=1:obj.timespan_length-1
        z_n = find_retarded_t(obj, y, n);
        z_nn = find_retarded_t(obj, y, n+1);
        fun = @(x)StormerFunc(y(:, n), x, obj, z_n, z_nn);
        y(:, n+1) = fsolve(fun, y(:, n));
    end
end

function delta = StormerFunc(yn, ynn, obj, z_n, z_nn)
    fyn = obj.retarded_func(yn, z_n);
    fynn = obj.retarded_func(ynn, z_nn);
    y1_half = yn(1) + obj.h/2*fyn(1);
    delta(2) = yn(2) + obj.h*y1_half - ynn(2);
    delta(1) = y1_half + obj.h/2*fynn(1) - ynn(1);
end