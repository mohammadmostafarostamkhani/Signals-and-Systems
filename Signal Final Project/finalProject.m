recObj = audiorecorder;
disp('Start speaking.');
recordblocking(recObj, 5);
disp('End of Recording.');
play(recObj);
y = getaudiodata(recObj);
plot(y);
Fs=1E+4;
filename='myVoice.wav';
audiowrite('myVoice.wav',y,Fs);
amp=0.5;
delay=1;
echo=echo_gen(y, Fs, delay, amp);
audiowrite('myEchoVoice.wav',echo,Fs);
%noisy=y + randn(size(sqrt(y)));


%STD=sqrt(0.005); % STANDARD DEVIATION

%z=y+STD*randn(size(y));

Mean=0.00;

Var=0.0005;

z=imnoise(y,'Gaussian',Mean,Var);



audiowrite('myNoisyVoice.wav',z,Fs);


