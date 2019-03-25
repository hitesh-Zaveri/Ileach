function createfigure(x,y1,y2,y3)

figure1 = figure(2);

% Create sub-plot
subplot1 = subplot(1,3,1,'Parent',figure1);
box(subplot1,'on');
hold(subplot1,'all');

% Create plot
plot(x,y1,'Parent',subplot1,'LineWidth',2,'Color',[0,0,1]);

% Create x-label
xlabel('Round','FontWeight','bold','FontSize',12,'FontName','Cambria');

% Create y-label
ylabel('No. of packets sent to BS ','FontWeight','bold','FontSize',12,...
    'FontName','Cambria');

% Create title
title('Number of packets sent to BS vs. Round','FontWeight','bold',...
    'FontSize',13,...
    'FontName','Cambria');

% Create sub-plot
subplot2 = subplot(1,3,2,'Parent',figure1);
box(subplot2,'on');
hold(subplot2,'all');

% Create plot
plot(x,y2,'Parent',subplot2,'LineWidth',2,'Color',[1 0 0]);

% Create x-label
xlabel('Round','FontWeight','bold','FontSize',12,'FontName','Cambria');

% Create y-label
ylabel('No. of dead nodes','FontWeight','bold','FontSize',12,...
    'FontName','Cambria');

% Create title
title('Number of dead nodes vs. Round','FontWeight','bold','FontSize',13,...
    'FontName','Cambria');

% Create sub-plot
subplot3 = subplot(1,3,3,'Parent',figure1);
box(subplot3,'on');
hold(subplot3,'all');

% Create plot
plot(x,y3,'Parent',subplot3,'LineWidth',2,'Color',[0 1 0]);

% Create x-label
xlabel('Round','FontWeight','bold','FontSize',12,'FontName','Cambria');

% Create y-label
ylabel('sum of energy','FontWeight','bold','FontSize',12,...
    'FontName','Cambria');

% Create title
title('Sum of energy of nodes vs. Round','FontWeight','bold','FontSize',13,...
    'FontName','Cambria');
end