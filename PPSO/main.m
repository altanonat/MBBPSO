fnum = fn;
[ulim,llim,dim] = funcdetails(fnum);

nop  = 100;
iter = 500;
reps = 50;

% Define the PPSO's paramters
D=dim;
xmin=llim;
xmax=ulim;
dx=xmax-xmin;
vmax=0.5*dx;
npop=nop;

feval    = zeros(1,reps);
tElapsed = zeros(1,reps);

for ri=1:reps
    % Position and velocity initialization
    position  = (rand(nop,dim)).*(xmax-xmin)+xmin;
    cost      = getfunc(position,fnum,nop,dim);
    
    velocity = zeros(nop,dim);
    delta    = unifrnd(0,2*pi,nop,dim);
    
    % PPSO notation
    %Initialize the local best equal to the initial population.
    pbest     = position;
    pbestcost = cost;
    
    % Initialize the global solution.
    [gbestcost,indx] = min(cost);
    gbest            = position(indx,:);
    
    profile off
    profile on -timer 'real'
    for k=1:iter   
        aa = 2*(sin(delta));
        bb = 2*(cos(delta));
        ee = abs(cos(delta)).^aa;
        tt = abs(sin(delta)).^bb;
        
        velocity = (ee).*(pbest-position) +(tt).*(gbest-position);
        velocity = min(max(velocity,-vmax),vmax);
        position = position+velocity;
        
        position = checkx(position,ulim,llim,nop,dim);
        cost     = getfunc(position,fnum,nop,dim);
        
        delta = delta+(abs(aa+bb)*(2*pi));
        vmax  = (abs(cos(delta)).^2).*dx;
        % pBest and gBest determination
        bc = cost < pbestcost;
        pbestcost = pbestcost.*not(bc) + cost.*bc;
        pbest(bc,:) = position(bc,:);
        % Update the global solution per each iteration
        [temp, idx] = min(pbestcost);
        if temp<gbestcost
            gbest=position(idx,:); 
            gbestcost=temp;
        end
    end
    p = profile('info');
    tElapsed(ri) = p.FunctionTable.TotalTime;
    feval(ri)    = gbestcost;
end
format long
mfeval = mean(feval);
sfeval = std(feval);
tfeval = mean(tElapsed);

range=strcat(strcat('E',num2str(count)),':',strcat('E',num2str(count+1)));
filename = '..\Result.xlsx';
writecell({mfeval,'%1.10f';...
    sfeval,'%4.4d'},...
    filename,'Range',range)

format