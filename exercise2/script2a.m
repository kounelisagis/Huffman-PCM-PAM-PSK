x = sourceB();

min_value=-1; max_value=1;
sqnrs = NaN(3, 1);
Kmaxs = NaN(3, 1);

for N=2:2:6
    [xq, centers, D] = Lloyd_Max(x, N, min_value, max_value);
    my_x = centers(xq);
    sqnrs(N/2) = get_sqnr(x, my_x);
    Kmaxs(N/2) = length(D);
end

plot(Kmaxs, sqnrs)
