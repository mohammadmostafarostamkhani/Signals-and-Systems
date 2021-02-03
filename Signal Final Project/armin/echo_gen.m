function echo = echo_gen(input, fs, delay, amp)    
    sr = round(fs*delay);
    org = [input; zeros(sr,1)];
    effect = [zeros(sr,1); input*amp];
    echo = org + effect;
    
    norm = max(abs(echo));
    if norm > 1
        echo = echo./norm;
    end