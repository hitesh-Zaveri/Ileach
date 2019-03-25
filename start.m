clc,clear all,close all

numNodes=100;
p=0.1;
  
netArch=newNetwork(100,100,50,175);
nodeArch=newNodes(netArch, numNodes);
roundArch=newRound();

plot1

graph=struct;

for r = 1:roundArch.numRound
    clusterModel=newCluster(netArch, nodeArch, 'ileach',r,p);
    clusterModel=dissEnergyCH(clusterModel, roundArch);
    clusterModel=dissEnergyNonCH(clusterModel, roundArch);
    nodeArch=clusterModel.nodeArch;
    
    graph=plotResults(clusterModel,r,graph);
    if nodeArch.numDead==nodeArch.numNode
        break
    end
end


