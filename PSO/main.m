fnum = fn;
[ulim,llim,dim] = funcdetails(fnum);

nop  = 100;
iter = 500;
reps = 50;

% Define the PSO's paramters
w  = 0.9;
c1 = 2;
c2 = 2;
vMax = (ulim - llim)/5;
vMin = -vMax;

feval    = zeros(1,reps);
tElapsed = zeros(1,reps);

parfor ri=1:reps  
    % Position and velocity initialization
    x = (rand(nop,dim)).*(ulim-llim)+llim;
    v = (rand(nop,dim)).*(ulim-llim)+llim;
    x = checkx(x,ulim,llim,nop,dim);
    f = getfunc(x,fnum,nop,dim);
    
    % PSO notation
    %Initialize the local best equal to the initial population.
    pBest = x; % location of the local best.
    fp    = f; % cost of local best.
    
    % Initialize the global solution.
    [fg,indx] = min(f);
    gBest     = x(indx,:);
    
    profile off
    profile on -timer 'real'
    for k=1:iter
        % Update the X and V vectors
        v = w*v+c1*rand(nop,dim).*(pBest-x)+c2*rand(nop,dim).*(gBest-x);
        
        % Check velocities
        index1 = find(v > vMax);
        index2 = find(v < vMin);
        
        v(index1) = vMax;
        v(index2) = vMin;
        
        x = x + v;
        
        x = checkx(x,ulim,llim,nop,dim);
        f = getfunc(x,fnum,nop,dim);

        % pBest and gBest determination
        bc = f < fp;
        fp = fp.*not(bc) + f.*bc;
        pBest(bc,:) = x(bc,:);
        % Update the global solution per each iteration
        [temp, idx] = min(fp);
        if temp<fg
            gBest=x(idx,:); 
            fg=temp;
        end
    end 
    p = profile('info');
    tElapsed(ri) = p.FunctionTable.TotalTime;
    feval(ri)    = fg;  
end
format long
mfeval = mean(feval);
sfeval = std(feval);
tfeval = mean(tElapsed);

range=strcat(strcat('G',num2str(count)),':',strcat('G',num2str(count+1)));
filename = '..\Result.xlsx';
writecell({mfeval,'%1.10f';...
    sfeval,'%4.4d'},...
    filename,'Range',range)

format