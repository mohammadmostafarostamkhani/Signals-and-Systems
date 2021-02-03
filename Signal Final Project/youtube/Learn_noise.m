[y1,fs] = audioread('myVoice.wav');
X1 = y1 + 2*randn(length(y1),1);
time=(1/fs)*length(y1);
t=linspace(0,time,length(y1)) ;
subplot(5,1,1)
plot(t,y1); title('Time domain plot of Orignal signal');
%plotting for noise added signal
subplot(5,1,2)
time1=(1/fs)*length(X1);
t1=linspace(0,time1,length(X1));
plot(t1,X1); title('Time domain plot of Noise Added Siganl i.e X1.');
audiowrite('noisy.wav',X1,fs);
subplot(5,1,3)
N=length(y1); 
Fc=(-N/2:N/2-1)/N; 
F=fs*Fc;
we=fft(y1);
we=fftshift(we);
plot(F,we); title('Frequency plot of Orignal Signal');
subplot(5,1,5)

i=1;
for j=2:length(X1)-1 
    y1(j,i) = (y1(j-1,i) + y1(j,i) + y1(j+1,i))/3 ; 
end
g = gausswin(20); 
g = g/sum(g); %It will be use for convolution
y= conv(y1(:,1), g, 'same');
result=sgolayfilt(y,1,17); 
audiowrite('result.wav',result,fs); 
Nn=length(result); 
Fn=(-Nn/2:Nn/2-1)/Nn; 
Fq=fs*Fn;
qa=fft(result);
qa=fftshift(qa);
plot(Fq,qa); title('Frequency plot after removing Noise');
subplot(5,1,4)
sound(result,fs)

N1=length(X1);
Fa=(-N1/2:N1/2-1)/N1;
F1=Fa*fs;
xa=fft(X1);
xa=fftshift(X1);
plot(F1,xa) ;title('Frequency plot of X1.');
subplot(5,1,5)