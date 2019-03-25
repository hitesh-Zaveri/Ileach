function clusterModel=dissEnergyCH(clusterModel, roundArch)

    nodeArch=clusterModel.nodeArch;
    netArch=clusterModel.netArch;
    cluster=clusterModel.clusterNode;
    
    d0=sqrt(netArch.Energy.freeSpace / ...
              netArch.Energy.multiPath);
    
    if cluster.countCHs == 0
        return
    end
    
    n=cluster.countCHs;
    ETX=netArch.Energy.transfer;
    ERX=netArch.Energy.receive;
    EDA=netArch.Energy.aggr;
    Emp=netArch.Energy.multiPath;
    Efs=netArch.Energy.freeSpace;
    packetLength=roundArch.packetLength;
    ctrPacketLength=roundArch.ctrPacketLength;

    for i=1:n
        chNo=cluster.no(i);
        distance=cluster.distance(i);
        energy=nodeArch.node(chNo).energy;
        
        % energy dissipation for aggregation + transferring of data to BS
        
        if(distance >= d0)
             nodeArch.node(chNo).energy = energy - ...
                 ((ETX+EDA)*packetLength + Emp*packetLength*(distance^4));
        else
             nodeArch.node(chNo).energy = energy - ...
                 ((ETX+EDA)*packetLength + Efs*packetLength*(distance ^ 2));
        end
        
        nodeArch.node(chNo).energy = nodeArch.node(chNo).energy - ...
            ctrPacketLength * ERX * round(nodeArch.numNode / clusterModel.numCluster);
    end
    
    clusterModel.nodeArch = nodeArch;
end