function NetArch=newNetwork(Length,Width,sinkX,sinkY,initEnergy...
    ,transEnergy,recEnergy,fsEnergy,mpEnergy,aggrEnergy)

    %yard
    Yard.Type='Rect';
    Yard.Length=Length;
    Yard.Width=Width;
    
    %sink
    Sink.x=sinkX;
    Sink.y=sinkY;
    
    %initial energy
    Energy.init=0.5; 
   
    %transferring energy(ETX)
    Energy.transfer=50*0.000000001;
    
    %receiving energy(ERX)
    Energy.receive=50*0.000000001;
    
    %Efs and Emp
    Energy.freeSpace=10*0.000000000001;
    Energy.multiPath=0.0013*0.000000000001;
    
    %EDA
    Energy.aggr=5*0.000000001;

    NetArch=struct('Yard', Yard, 'Sink', Sink, 'Energy', Energy);
end