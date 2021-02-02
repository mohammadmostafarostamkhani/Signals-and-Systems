[y1,fs] = audioread('myVoice.wav');
X1 = y1 + 2*randn(length(y1),1); %Addintion of Noise using randn command
time=(1/fs)*length(y1);
t=linspace(0,time,length(y1)) ;%For generating time-aixs
subplot(5,1,1)
plot(t,y1); title('Time domain plot of Orignal signal'); %This is original signal plot
%plotting for noise added signal
subplot(5,1,2)
time1=(1/fs)*length(X1);
t1=linspace(0,time1,length(X1)); %For generating time-axis
plot(t1,X1); title('Time domain plot of Noise Added Siganl i.e X1.'); %This is plot will be of Noise added signal
audiowrite('noisy.wav',X1,fs);
%Plotting original signal in frequency domain
subplot(5,1,3)
N=length(y1); %Determining length of signal
Fc=(-N/2:N/2-1)/N; %For frequency normalizing axis
F=fs*Fc; %generating frequency axis
we=fft(y1);
we=fftshift(we);
plot(F,we); title('Frequency plot of Orignal Signal'); %Plotting in frequency domain
subplot(5,1,5)

i=1;
for j=2:length(X1)-1 %For averaging high frequency signal
    y1(j,i) = (y1(j-1,i) + y1(j,i) + y1(j+1,i))/3 ; %simple average
end
g = gausswin(20); %Creataing Gaussian window of 20 with nuitin command
g = g/sum(g); %It will be use for convolution
y= conv(y1(:,1), g, 'same'); %Applying Convolution to remove effect of randn psudo no. added(noise)
result=sgolayfilt(y,1,17); % Apply signal smoothing using Savitzky-Golay smoothing filter.
audiowrite('result.wav',result,fs); % resultant signal can be write to the new file
Nn=length(result); %length of new array which we got by manipulating org. signal
Fn=(-Nn/2:Nn/2-1)/Nn; %Frequency PLOTING
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
%Noise Removal Code
subplot(5,1,5)
%W=fft(X1);