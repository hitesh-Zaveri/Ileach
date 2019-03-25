function fig(data,r,n,yLabel,Title)

    figure(2);
    subplot(1,3,n);
    plot(1:r,data);
   xlabel('Round','FontWeight','bold','FontSize',12,'FontName','Cambria');
   ylabel(yLabel,'FontWeight','bold','FontSize',12,...
    'FontName','Cambria');
   title(Title,'FontWeight','bold','FontSize',13,...
    'FontName','Cambria');
end