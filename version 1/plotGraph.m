function graph = plotGraph(a, da)
% plotGraph function takes in the release angle as well as the deviation
% angle da which is the error in the ball's angle. it returns a graph of
% the 3 trajectories - at angle a, a-da & a+da, showing the spread
    
    % Assumptions:
    % - ball is treated as a point mass of no radius
    % - only force acting on the ball is gravity
    
    % Defining constants
    % a = 1; 
    % da = 0.01;       % release angle and angle step. a = 0.9 seems to be the best angle. as a increases, it will converge to the left and to the right if it decreases
    h = 3.048;              % height of basketball hoop
    l  = 4.572;             % distance of foul line from hoop
    g = -9.81;              % gravitational acceleration
    y_0 = 1.8;              % take height of release to be 1.8m
    tstart = 0; dt = 0.001; % start time and time step
    
    % Plot of trajectories of balls when angle is deviated with the same
    % velocity
    
    [v, tend] = initVelocity(a);                % returns initial velocity, time taken for ball to reach hoop and release angle
    for i = (a-da):da:(a+da)                    % 3 trajectories: release angle a and it's +/- of da
        % Initialising vectors
        [nil, tend] = initVelocity(i);          % only update tend, not v
        T = tstart:dt:tend;                     % vector to store the values of t
        X = v.*cos(i).*T;                       % vector to store the values of x
        Y = y_0 + v.*sin(i).*T + 0.5*g.*(T).^2; % vector to store the values of y
        
        % Plot trajectory of ball
        plot(X,Y);
        hold on
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
    
    %TODO: determine SD of y at min(tend vector) where tend vector contains the
    %3 tends. Determine trend of the intersection points. animate the plot as
    %the angle of release increases
    %alt: make this a graph plotting fn and create a new script to plot multiple graphs together with the deviation