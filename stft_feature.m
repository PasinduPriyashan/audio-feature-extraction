%read audio file
[stereo_data, sample_rate] = audioread('test1.mp3');
figure
plot(stereo_data)

%convert stereo data into mono data by taking the avarage
mono_data = sum(stereo_data,2)/size(stereo_data,2);
figure
plot(mono_data)

%Short time fourier transformation
[s,t,f] = spectrogram(mono_data,[],[],[],sample_rate);
figure
spectrogram(mono_data,[],[],[],sample_rate,'yaxis');

%lowpass butterworth
[b,a] = butter(1,0.8,'low');
dataout = filter(b,a,s);

figure
surf(t, f, log(s), 'EdgeColor', 'none');
axis xy; 
axis tight; 
colormap(jet); view(0,90);
xlabel('Time (secs)');
colorbar;
ylabel('Frequency(HZ)');
title('surf(t, f, 20*log10(abs(s)), ___)');




