% Fu Wen Tay 3/3/23

% Simulating the spread of the ball when release angle is varied.

% Defining variables
a_start = 0.8;
a_step = 0.01;
a_end = 1.3;
da = 0.01;

% Determine maximum height to display animation based on Y vector
ballMax = plotGraph(a_end, da);
YMax = max(ballMax.Y);

% Initialise
aOpt = 10;
SD = [];

% Animate graphs of different release angles
for i = a_start:a_step:a_end 
    [ball, ball0, ball2] = plotGraph(i,da);
    hold on;
    title('Trajectory Plot for varying Release Angles with Human Error')
    xline(ball.l, 'r--');
    text(ball.l+.03, ball.h, 'Hoop position');
    ylabel('height (m)');
    xlabel('distance (m)');
    axis equal;
    ylim([0 YMax+1.5]);
    xlim([-1.5 ball.l+1.5]);

    % Determining the Y position of each trajectory when it hits the
    % basketball post
    ball0Y = ball0.Y;
    ballY = ball.Y;
    ball2Y = ball2.Y;
    ball0Yend = ball0Y(end);
    ballYend = ballY(end);
    ball2Yend = ball2Y(end);
    Yend = [ball0Yend, ballYend, ball2Yend];

    % Determining the standard deviations/spread of the trajectory and its
    % maximum
    sd = std(Yend);
    SD = [SD sd]; % vector SD of all the standard deviations
    sdMin = min(SD); % minimum standard deviation from vector

    % Determining the current angle and optimal angle
    a = ball.a;
    if sdMin == sd
        aOpt = a;
    end
    
    % Results
    text(-1.3, YMax+1.3, sprintf('Standard Deviation: %f', sd));
    text(-1.3, YMax+1.1, sprintf('Minimum Standard Deviation: %f', sdMin));
    text(-1.3, YMax+0.9, sprintf('Angle: %f rads', a));
    text(-1.3, YMax+0.7, sprintf('Optimal Angle: %f rads', aOpt)); % lowest standard deviation    

    pause(0.05);
    hold off;
end