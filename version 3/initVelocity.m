% Fu Wen Tay 3/3/23

function ball = initVelocity(a)
% initVelocity function determines the initial velocity of the ball given 
% that it's released at some angle
    
    % Assumptions:
    % - ball is treated as a point mass of no radius
    % - only force acting on the ball is gravity
    
    % Defining constants
    ball.h = 3.048; % height of basketball hoop
    ball.l  = 4.572; % distance of foul line from hoop
    ball.g = -9.81;  % gravitational acceleration
    ball.y_0 = 1.8; % take height of release to be 1.8m
    ball.a = a;
    
    % Determine lower bound of a
    % - a_min < a < pi/2
    a_min = atan((ball.h-ball.y_0)/ball.l);
    
    % Time taken for ball to travel. Expression to solve was analytically
    % determined using kinematics equations.
    syms v
    t = ball.l/(v*cos(a));
    S = solve(v*sin(a)*t + 0.5*ball.g*t^2 == ball.h - ball.y_0);
    if abs(eval(S(1))) == (eval(S(1)))
        ball.v = eval(S(1));
    else
        ball.v = eval(S(2));
    end
