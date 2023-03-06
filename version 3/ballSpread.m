% Fu Wen Tay 3/3/23

% Plot of trajectories of balls when the release angle is varied. For each
% release angle we consider a small deviation due to human error which
% results in a spread. We aim to characterise this spread and minimise it.
% Preliminary observations show that the spread decreases with a lower
% release angle but clearly the effective area of the ball is much lower.
% This means that even though the shot is more consistent, the probability
% of it going through the hoop is lower as it is more sensitive to errors.
% There is a need to find the fine line between spread and effective area.

% Defining variables
a_start = 0.8;
a_step = 0.1;
a_end = 1.3;
da = 0.01;

% Plot graphs of different release angles
for i = a_start:a_step:a_end
    hold on;
    ball = plotGraph(i,da);
    xline(ball.l, 'r--');
    text(ball.l+.03, ball.h, 'Hoop position');
    ylabel('height (m)');
    xlabel('distance (m)');
    axis equal;
end

% TODO: 
% find the balance between effective area and spread. 
% Add in vertical line. 
% determine SD of y at min(tend vector) where tend vector contains the 3 tends. 
% Determine trend of the intersection points. 
% animate the plot as the angle of release increases