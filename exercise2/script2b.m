x = sourceB();

min_value=-1; max_value=1;
sqnrs1 = NaN(3, 1);
sqnrs2 = NaN(3, 1);

for N=2:2:6
    [xq, centers] = my_quantizer(x, N, min_value, max_value);
    my_x = centers(xq);
    sqnrs1(N/2) = get_sqnr(x, my_x);
    
    [xq, centers, D] = Lloyd_Max(x, N, min_value, max_value);
    my_x = centers(xq);
    sqnrs2(N/2) = get_sqnr(x, my_x);
end

plot([2,4,6], sqnrs1,'-o','MarkerIndices', [1,2,3])

hold on
plot([2,4,6], sqnrs2,'-o','MarkerIndices', [1,2,3])

legend('My SQNRs','Lloyd\_Max SQNRs')
xlabel('N') 
ylabel('SQNR') 
hold off
