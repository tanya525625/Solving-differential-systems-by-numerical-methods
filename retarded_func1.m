function dy = retarded_func1(y, t)
    retarded_const = pi
    if t - retarded_const < 0
        dy = interpolation();
    else 
        dy = [-y(2, t-retarded_const); y(1, t)];
    end
end