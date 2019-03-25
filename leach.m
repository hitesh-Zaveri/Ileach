function [nodeArch, clusterNode] = leach(clusterModel, clusterFunParam)
    
    nodeArch = clusterModel.nodeArch;
    netArch  = clusterModel.netArch;
    r = clusterFunParam(1);
    p = clusterModel.p;
    N = nodeArch.numNode; 
    
    %reset CH after numCluster rounds 
    if (mod(r, clusterModel.numCluster) == 0)
        for i = 1:N
            nodeArch.node(i).G = 0; 
        end
    end
    
    % Checking if there is a dead node
    locAlive = find(~nodeArch.dead); % find the nodes that are alive
    for i = locAlive
        if nodeArch.node(i).energy <= 0
            nodeArch.node(i).type = 'D';
            nodeArch.dead(i) = 1;
        else
            nodeArch.node(i).type = 'N';
        end
    end
    nodeArch.numDead = sum(nodeArch.dead);
    
    % finding the cluster head
    clusterNode     = struct(); 
    
    locAlive = find(~nodeArch.dead);
    countCHs = 0;
    for i = locAlive
        temp_rand = rand;
        if (nodeArch.node(i).G <= 0) && ...
           (temp_rand <= probi(r,i, p,nodeArch)) && ...
           (nodeArch.node(i).energy > 0)

            countCHs = countCHs+1;

            nodeArch.node(i).type='C';
            nodeArch.node(1,1).G=round(1/p)-1;
            clusterNode.no(countCHs)=i;  
            xLoc = nodeArch.node(i).x; 
            yLoc = nodeArch.node(i).y; 
            clusterNode.loc(countCHs, 1)=xLoc;
            clusterNode.loc(countCHs, 2)=yLoc;
            
            clusterNode.distance(countCHs) = nodeArch.node(i).d            
        end 
    end
    clusterNode.countCHs = countCHs;
end