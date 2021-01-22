x = sourceB();

min_value=-1; max_value=1;
sqnrs = NaN(3, 1);
Kmaxs = NaN(3, 1);


for N=2:2:6
    [xq, centers, D] = Lloyd_Max(x, N, min_value, max_value);
    length(D)
    my_x = centers(xq);
    sqnrs(N/2) = get_sqnr(x, my_x);
    Kmaxs(N/2) = length(D);
    
    SQNR = 10*log10(sum(x.^2)./(D*length(x)));
    figure
    plot(SQNR);
    xlabel('Number of Iterations')
    ylabel('SQNR')
    title(['Lloyd\_Max - N=' num2str(N)])
end
