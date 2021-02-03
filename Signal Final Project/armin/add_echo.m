function echo = add_echo(input, fs, delay, amp)    
%ADD_ECHO Summary of this function goes here
%   Detailed explanation goes here
    sr = round(fs*delay);
    org = [input; zeros(sr,1)];
    effect = [zeros(sr,1); input*amp];
    echo = org + effect;
    
    norm = max(abs(echo));
    if norm > 1
        echo = echo./norm;
    end