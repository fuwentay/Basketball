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



% Animate graphs of different release angles
for i = a_start:a_step:a_end
    [ball, ball0, ball2] = plotGraph(i,da);
    hold on;
    xline(ball.l, 'r--');
    text(ball.l+.03, ball.h, 'Hoop position');
    ylabel('height (m)');
    xlabel('distance (m)');
    axis equal;
    ylim([0 YMax+1.5]);
    xlim([-1.5 ball.l+1.5]);

%     x0end = ball0.X;

    pause(0.05);
    hold off;
end