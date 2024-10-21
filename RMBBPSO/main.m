fnum = fn;
[ulim,llim,dim] = funcdetails(fnum);

nop  = 100;
iter = 500;
reps = 50;

feval    = zeros(1,reps);
tElapsed = zeros(1,reps);

parfor ri=1:reps
    % Position and velocity initialization
    x = (rand(nop,dim)).*(ulim-llim)+llim;
    d = (zeros(1,dim));
    
    x = checkx(x,ulim,llim,nop,dim);
    f = getfunc(x,fnum,nop,dim);
    
    % MBBPSO notation
    %Initialize the local best equal to the initial population.
    pBest = x; % location of the local best.
    fp    = f; % cost of local best.
    
    % Initialize the global solution.
    [fg,indx] = min(f);
    gBest     = x(indx,:);
    
    pindx = 1;
    
    profile off
    profile on -timer 'real'
    for k=1:iter
        
        %% Particle updates
		if rand<0.5
			d = unifrnd(-1,1,nop,dim).*abs((x-gBest));
            x = x+d;
            pindx = pindx+1;
        else
			d = unifrnd(-1,1,nop,dim).*abs((x-gBest));
            x = pBest+d;
            pindx = 1;
        end
        %% Particle check and function evaluation
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

range=strcat(strcat('B',num2str(count)),':',strcat('B',num2str(count+1)));
filename = '..\Result.xlsx';
writecell({mfeval,'%1.10f';...
    sfeval,'%4.4d'},...
    filename,'Range',range)

format