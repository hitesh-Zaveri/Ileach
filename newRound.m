function NetRound=newRound(numRound, packetLength, ctrPacketLength)

    % no of rounds
    NetRound.numRound=9000;
    
    % CH to BS
    NetRound.packetLength=6400;
    
    % node to CH
     NetRound.ctrPacketLength=200;
end