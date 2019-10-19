function dy = retarded_func1(y, z)
        dy = 1/2*[-y(2)-z(2, 1); y(1) + z(1, 1)];
end
