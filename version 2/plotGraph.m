% Fu Wen Tay 3/3/23

function [ball, ball0, ball2] = plotGraph(a, da)
% plotGraph function takes in the release angle as well as the deviation
% angle da which is the error in the ball's angle. it returns a graph of
% the 3 trajectories - at angle a, a-da & a+da, showing the spread
    
    % Defining constants
    tstart = 0; % start time
    dt = 0.001; % time step
    
    % Creating ball_0 and ball_2 objects which are the deviated balls. This
    % will be useful to determine their positions subsequently.
    ball0 = initVelocity(a-da);
    ball2 = initVelocity(a+da);

    % Plot of trajectories of balls when angle is deviated with the same
    % velocity
    
    % get ball parameters, release velocity we want for angle a and time
    % elapsed
    ball = initVelocity(a);          % returns initial velocity, time taken for ball to reach hoop and release angle
    for i = (a-da):da:(a+da)                    % 3 trajectories: release angle a and it's +/- of da
        % Initialising vectors
        tend = ball.l/(ball.v*cos(i));
        T = tstart:dt:tend;                     % vector to store the values of t
        X = ball.v.*cos(i).*T;                       % vector to store the values of x
        Y = ball.y_0 + ball.v.*sin(i).*T + 0.5*ball.g.*(T).^2; % vector to store the values of y
        ball.X = X;
        ball.Y = Y;

        % Plot trajectory of ball
        plot(X,Y);
        hold on;
        %ylim([0,max(Y)+y_0]);
    end
    
    % Plot of trajectories of balls when angle is deviated and velocity is
    % corrected
    
    % for i = (a-da):da:(a+da)
    %     % Initialising vectors
    %     [v, tend] = initVelocity(i);       % returns initial velocity, time taken for ball to reach hoop and release angle
    %     T = tstart:dt:tend;                     % vector to store the values of t
    %     X = v.*cos(i).*T;                       % vector to store the values of x
    %     Y = y_0 + v.*sin(i).*T + 0.5*g.*(T).^2; % vector to store the values of y
    %     
    %     % Plot trajectory of ball
    %     plot(X,Y);
    %     hold on
    %     %ylim([0,max(Y)+y_0]);
    % end
    
