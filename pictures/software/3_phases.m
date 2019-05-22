clc, clear all, close all, format compact

freq = 1;
amp = 1;
phase = 2*pi/3;

cycles = 3;
time = 1:0.01:2*pi*cycles;

% Sinus's
phases = zeros(3,length(time));
for index = 1:length(time)
    % For each phase
    for p = 1:3
        phases(p,index) = amp*sin(time(index)+(phase*p));
    end
end

% Plot sinus
figure(1)
for p = 1:3
    hold on
    plot(time,phases(p,:))
end
legend('Phase 1','Phase 2','Phase 3')



% PWM's
pwms = zeros(3,length(time));
for index = 1:length(time)
    % For each phase
    for p = 1:3
        if phases(p ,index) > 0
            pwms(p, index) = 1; 
        else
            pwms(p, index) = 0;
        end
    end
end

% Plot PWMs
figure(2)
for p = 1:3
    subplot(3,1,p);
    hold on
    title(strcat('Phase ', num2str(p)));
    plot(time,pwms(p,:))
end



% PWM high and low side
h_th = 0.1;     % high threshold
l_th = -0.1;    % low threshold

h_pwms = zeros(3,length(time));
l_pwms = zeros(3,length(time));
for index = 1:length(time)
    % For each phase
    for p = 1:3
        % high side
        if phases(p ,index) > h_th 
            h_pwms(p, index) = 1; 
        else
            h_pwms(p, index) = 0;
        end
        % low side
        if phases(p ,index) < l_th 
            l_pwms(p, index) = 1; 
        else
            l_pwms(p, index) = 0;
        end
    end
end

figure(3)
for p = 1:3
    subplot(3,1,p);
    hold on
    title(strcat('Phase ', num2str(p)));
    plot(time,h_pwms(p,:))
    plot(time,l_pwms(p,:))
    legend('High side','Low side')
end

%% Calculate the third phase
clc, clear all, close all, format compact

freq = 1;
amp = 1;
phase = 2*pi/3;

cycles = 3;
time = 1:0.01:2*pi*cycles;

% Get the 2 first phases
phases = zeros(3,length(time));
for index = 1:length(time)
    for p = 1:2
        phases(p,index) = amp*sin(time(index)+(phase*p));
    end
end

% Calculate the third phase
for index = 1:length(time)
   phases(3, index) = -(phases(1,index)+phases(2,index)); 
end


% Plot phases
figure(1)
for p = 1:3
    hold on
    plot(time,phases(p,:))
end



for p = 1:3
    phases(p,100)
    scatter(time(100), phases(p,100), 'b');
end

legend('Phase 1','Phase 2','Phase 3')
    