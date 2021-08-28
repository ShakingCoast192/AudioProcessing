clc, clear all, close all;

recording = audiorecorder;
disp('Start')
recordblocking(recording, 5);
disp('Stop')
play(recording);
y = getaudiodata(recording);

N=8;        %Order of Filter
fc =0.2;    %Cutoff Freq

%Highpass Filter
num1 = fir1(N,fc,'high');
den1 = [1];
fvtool(num1,den1)
subplot(2,1,1)
plot(y)     %Original Audio
Filter1=filter(num1,den1,y);
subplot(2,1,2)
plot(Filter1)

%Bandpass Filter
f1=0.3;
f2=0.8;
Filter2 = fir1(N,[f1,f2])
fvtool(Filter2,1)
figure
plot(Filter2)

%Bandstop Filter
f1=0.1;
f2=0.5;
Filter3 = fir1(N,[f1,f2],'stop')
fvtool(Filter3,1)
figure
plot(Filter3)

