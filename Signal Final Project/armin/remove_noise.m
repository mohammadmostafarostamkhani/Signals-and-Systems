function clean = remove_noise(y, noisy)
%REMOVE_NOISE Summary of this function goes here
%   Detailed explanation goes here

i=1;
for j=2:length(noisy)-1 
    y(j,i) = (y(j-1,i) + y(j,i) + y(j+1,i))/3 ; 
end
g = gausswin(20); 
g = g/sum(g); %It will be use for convolution
y= conv(y(:,1), g, 'same');
result=sgolayfilt(y,1,17); 
clean=result;

end

