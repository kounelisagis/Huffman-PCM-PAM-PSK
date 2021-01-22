x = sourceB();

min_value=-1; max_value=1;
mses1 = NaN(3, 1);
mses2 = NaN(3, 1);

for N=2:2:6
    [xq, centers] = my_quantizer(x, N, min_value, max_value);
    my_x = centers(xq);
    error = x - my_x;
    mses1(N/2) = mse(error);
    
    [xq, centers, D] = Lloyd_Max(x, N, min_value, max_value);
    my_x = centers(xq);
    error = x - my_x;
    mses2(N/2) = mse(error);
end

figure
plot(2:2:6, mses1)
xlabel('N')
ylabel('MSE')
title('MSEs - Uniform Quantizer')

figure
plot(2:2:6, mses2)
xlabel('N')
ylabel('MSE')
title('MSEs - Lloyd-Max Quantizer')
