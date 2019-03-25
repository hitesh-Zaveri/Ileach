function P=prob(r,i, p,nodeArch)

    energy=nodeArch.node(i).energy;
    dist=nodeArch.node(i).d;
    x=0.3;
    y=0.7;

    cost=(energy*x)+(y/dist);
    
    P = p/(1-p * mod(r, round(1 / p)))*cost;
end