recObj = audiorecorder;
disp('Speak');
recordblocking(recObj, 7);
disp('Stop');
%play(recObj);
y = getaudiodata(recObj);
plot(y);
fs=0.80E+4;
audiowrite('original.wav',y,fs);


amp=0.4;
delay=0.25;
echo=echo_gen(y, fs, delay, amp);
audiowrite('echo.wav',echo,fs);


noisy=make_noisy(y, fs);
audiowrite('noisy.wav',noisy,fs);
subplot(5,1,3)
N=length(y); 
Fc=(-N/2:N/2-1)/N; 
F=fs*Fc;
we=fft(y);
we=fftshift(we);
plot(F,we); title('Original frequency');
subplot(5,1,5);


clean=remove_noise(y, noisy);
audiowrite('clean.wav',clean,fs); 
Nn=length(clean); 
Fn=(-Nn/2:Nn/2-1)/Nn; 
Fq=fs*Fn;
qa=fft(clean);
qa=fftshift(qa);
plot(Fq,qa); title('Clean frequency');
subplot(5,1,4);

N1=length(noisy);
Fa=(-N1/2:N1/2-1)/N1;
F1=Fa*fs;
xa=fft(noisy);
xa=fftshift(noisy);
plot(F1,xa) ;title('Noisy frequency');
subplot(5,1,5);