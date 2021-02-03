function noisy = make_noisy(y,fs)
%MAKE NOISY Summary of this function goes here
%   Detailed explanation goes here

noisy = y + 2*randn(length(y),1);
time=(1/fs)*length(y);
t=linspace(0,time,length(y)) ;
subplot(5,1,1);
plot(t,y); 
title('Original Time');
subplot(5,1,2)
time1=(1/fs)*length(noisy);
t1=linspace(0,time1,length(noisy));
plot(t1,noisy); 
title('Noisy time');

end

