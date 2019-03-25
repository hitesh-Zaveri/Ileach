function P=probi(r,i, p,nodeArch)

energy=nodeArch.node(i).energy;
dist=nodeArch.node(i).d;
x=0.5;
y=0.5;

cost=(energy*x)+round(y/dist);
    if ~exist('p','var')
        p = 0.1;
    end
    
    P = p/(1-p * mod(r, round(1 / p)));
end