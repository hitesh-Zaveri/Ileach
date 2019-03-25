function graph=plotResults(clusterModel,r,graph)
    nodeArch=clusterModel.nodeArch;
    
    % number of packets sent from CHs to BS
    
    if r==1
        graph.packetToBS(r)=clusterModel.numCluster;
    else
        graph.packetToBS(r)=graph.packetToBS(r-1)+clusterModel.clusterNode.countCHs;
    end
    
     %  packets sent to BS(Figure)
     fig(graph.packetToBS,r,1,'No. of packets sent to BS', ...
         'Number of packets sent to BS vs. Round');
    
    
    % Number of dead nodes
    graph.numDead(r)=nodeArch.numDead;
    
    % number of dead nodes(Figure)
     fig(graph.numDead,r,2,'No. of dead nodes', 'Number of dead nodes vs. Round');
    
    % total residual energy
    graph.energy(r)=0;
    node=clusterModel.nodeArch;
    for i=find(~node.dead)
        if node.node(i).energy > 0
            graph.energy(r)=graph.energy(r)+node.node(i).energy;
        end
    end
    
    % residual energy(Figure)
    fig(graph.energy,r,3,'sum of energy','Sum of energy of nodes vs. Round');
    
    createfigure(1:r,graph.packetToBS,graph.numDead,graph.energy);
end
