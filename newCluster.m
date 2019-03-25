function clusterModel=newCluster(netArch, nodeArch, ...
                        clusterFun, clusterFunParam, p_numCluster)
                    
    clusterModel.netArch=netArch;
    
    clusterModel.nodeArch=nodeArch;
    
    clusterModel.clusterFun=clusterFun;
   
    clusterModel.clusterFunParam=clusterFunParam;
    
    numCluster=1/p_numCluster;
    
    clusterModel.numCluster=numCluster;
    
    clusterModel.p=p_numCluster;
    
        
    [nodeArch, clusterNode]=feval(clusterFun, clusterModel, clusterFunParam);
    
    clusterModel.nodeArch=nodeArch;        
    clusterModel.clusterNode=clusterNode; 
end