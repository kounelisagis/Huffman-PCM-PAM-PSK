function res = get_sqnr(x, my_x)
    noise = x-my_x;

    pow_error = rms(noise)^2;
    pow_x = rms(x)^2;

    sqnr = pow_x/pow_error;
    res = db(sqnr,'power');
end
