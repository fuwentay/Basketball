% Determine the best release angle of the basketball that results in the
% least spread

% Defining variables
a_start = 0.9;
a_step = 0.15;
a_end = 1.5;
da = 0.01;

% Plot graphs of different release angles
for i = a_start:a_step:a_end
    plotGraph(i,0.01)
    hold on
end

% fix code using OOP class.
% remove redundancies, a lot of overlapping variables defined

% TODO: find the balance between effective area and spread