function nodeArch=newNodes(netArch, numNode)
    
    sinkx=netArch.Sink.x;
    sinky=netArch.Sink.y;
    
    for i = 1:numNode
        
        % x coordinates of node
        nodeArch.node(i).x=rand*netArch.Yard.Length;
        nodeArch.nodesLoc(i, 1)=nodeArch.node(i).x;
        
        % y coordinates of node
        nodeArch.node(i).y=rand*netArch.Yard.Width;
        nodeArch.nodesLoc(i, 2)=nodeArch.node(i).y;
        
        nodeArch.node(i).G=0; 
        
        nodeArch.node(i).type='N';  
        
        nodeArch.node(i).energy=netArch.Energy.init; 
        
        nodeArch.dead(i)=0;  
        
        %dist of node from bs
        nodeArch.node(i).d=sqrt((sinkx - nodeArch.nodesLoc(i,1)) ^ 2 + ...
                          (sinky - nodeArch.nodesLoc(i,2)) ^ 2); 
        
    end
    nodeArch.numNode=numNode; 
    nodeArch.numDead=0;
end