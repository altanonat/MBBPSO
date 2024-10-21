clear all
clc
count = 1;
for fn=1:36
    rng('shuffle');
    run('.\MBBPSO\main.m')
    clearvars('-except', 'fn', 'count')
    rng('shuffle');
    run('.\PSO\main.m')
    clearvars('-except', 'fn', 'count')
    rng('shuffle');
    run('.\PSOd\main.m')
    clearvars('-except', 'fn', 'count')
    rng('shuffle');
    run('.\PPSO\main.m')
    clearvars('-except', 'fn', 'count')
    rng('shuffle');
    run('.\BBPSO\main.m')
    clearvars('-except', 'fn', 'count')
    rng('shuffle');
    run('.\RMBBPSO\main.m')
    clearvars('-except', 'fn', 'count')
    rng('shuffle');
    run('.\BBSPSO\main.m')
    clearvars('-except', 'fn', 'count')
    count = count+2;
end
load handel
sound(y,Fs)
