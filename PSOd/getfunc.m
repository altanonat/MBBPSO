function f = getfunc(x,funcnum,nop,dim)
%% 58.Goldstein Price Function
% https://arxiv.org/pdf/1308.4008.pdf
% subject to -2<xi<2
% x=f(0,-1),f(x)=3
% (Continuous, Differentiable, Non-separable, Non-Scalable, Multimodal)
if funcnum == 1
    for i=1:nop
        f(i,1)=(1+((x(i,1)+x(i,2)+1)^2)*(19-14*x(i,1)+3*(x(i,1)^2)-14*x(i,2)+6*x(i,1)*x(i,2)+3*(x(i,2)^2)))*...
            (30+((2*x(i,1)-3*x(i,2))^2)*(18-32*x(i,1)+12*(x(i,1)^2)+48*x(i,2)-36*x(i,1)*x(i,2)+27*(x(i,2)^2)));
    end
end
%% 22.Branin RCOS Function
% https://arxiv.org/pdf/1308.4008.pdf
% -5<x1<10, 0<x1<15, but it is taken -15<x1<15, -15<x1<15
% ({-pi,12.275},{pi,2.275},{3pi,2.425}),f(x) = 0.3978873
% (Continuous, Differentiable, Non-Separable, Non-Scalable, Multimodal)
if funcnum == 2
    for i=1:nop
        f(i,1)=(x(i,2)-((5.1/(4*pi^2))*x(i,1)^2)+((5/(pi))*x(i,1))-6)^2+(10*(1-(1/(8*pi)))*cos(x(i,1)))+10;
    end
end
%% 30.Camel Function – Six Hump
% https://arxiv.org/pdf/1308.4008.pdf
% -5<xi<5
% x=f({-0.0898,0.7126},{0.0898,-0.7126,0}),f(x) =-1.0316
% (Continuous, Differentiable, Non-Separable,Non-Scalable, Multimodal)
if funcnum == 3
    for i=1:nop
        f(i,1)=4*(x(i,1)^2)-2.1*(x(i,1)^4)+((1/3)*(x(i,1)^6))+(x(i,1)*x(i,2))-4*(x(i,2)^2)+4*(x(i,2)^4);
    end
end
%% Shekel's Foxholes Function 
% https://www.al-roomi.org/benchmarks/unconstrained/2-dimensions/7-shekel-s-foxholes-function
% -65.536<xi<65.536, i=1,2
% f(x)=0.998003837794449325873406851315
% (Continuous, Differentiable, Non-Separable, Scalable, Multimodal)
if funcnum == 4
    aS=[-32 -16 0 16 32 -32 -16 0 16 32 -32 -16 0 16 32 -32 -16 0 16 32 -32 -16 0 16 32;,...
        -32 -32 -32 -32 -32 -16 -16 -16 -16 -16 0 0 0 0 0 16 16 16 16 16 32 32 32 32 32];
    for i=1:nop
    for j=1:25
        bS(j)=sum((x(i,1)'-aS(:,j)).^6);
    end
    f(i,1) = (1/500+sum(1./([1:25]+bS))).^(-1);
    end
end
%% 57.Giunta Function
% https://arxiv.org/pdf/1308.4008.pdf
% -1<xi<1
% x=f(0.45834282,0.45834282),f(x) = 0.060447.
% (Continuous, Differentiable, Separable, Scalable, Multimodal
if funcnum == 5
    for i=1:nop
        f(i,1)=0.6+sum(sin((16/15)*x(i,:)-1)+(sin((16/15)*x(i,:)-1)).^2+(1/50)*(sin(4*((16/15)*x(i,:)-1))));
    end
end
%% 145 Table 1/ Holder Table 1 function 
% https://arxiv.org/pdf/1308.4008.pdf
% -10<xi<10 x=f(±9.646168,±9.646168) f(x)=-26.920336
% (Continuous, Differentiable, Separable,Non-Scalable, Multimodal)
if funcnum == 6
    for i=1:nop
        f(i,1)=-abs(cos(x(i,1))*cos(x(i,2))*exp(abs(1-(sqrt(x(i,1)^2+x(i,2)^2)/pi))));
    end
end
%% 146 Table 2/ Holder Table 2 function 
% https://arxiv.org/pdf/1308.4008.pdf
% x=f(±8.055023472141116,±9.664590028909654) f(x)=-19.20850.
% (Continuous, Differentiable, Separable,Non-Scalable, Multimodal)
if funcnum == 7
    for i=1:nop
        f(i,1)=-abs(sin(x(i,1))*cos(x(i,2))*exp(abs(1-(sqrt(x(i,1)^2+x(i,2)^2)/pi))));
    end
end
%% 175.Zirilli or Aluffi-Pentini’s Function
% https://arxiv.org/pdf/1308.4008.pdf
% -10 < xi < 10 x = (-1.0465, 0), f(x) = -0.3523.
% (Continuous, Differentiable, Separable, Non-Scalable, Unimodal)
if funcnum == 8
    for i=1:nop
        f(i,1)=0.25*(x(i,1)^4)-0.5*(x(i,1)^2)+ 0.1*x(i,1)+ 0.5*(x(i,2)^2);
    end
end
%% 4. Ackley 4 or Modified Ackley Function
% https://arxiv.org/pdf/1308.4008.pdf
% -35<xi<35. x=f({-1.479252,-0.739807},{1.479252,-0.739807}),
% f(x) =-4.590101633799122 .
% (Continuous, Differentiable, Separable, Scalable, Multi-modal)
if funcnum == 9
    for i=1:nop
            f(i,1) = (exp(-0.2)*sqrt(x(i,1)^2+x(i,2)^2))+...
                3*(cos(2*x(i,1))+sin(2*x(i,2)));
    end
end
%% Bird Function
% http://benchmarkfcns.xyz/benchmarkfcns/birdfcn.html
% xi=[-2,2] for i=1,2. f(x)=-106.764537 located at 
% x=(4.70104,3.15294) and x=(-1.58214,-3.13024).
if funcnum == 10
    for i=1:nop
            f(i,1) = sin(x(i,1)).*exp((1-cos(x(i,2))).^2)+ ... 
        cos(x(i,2)).*exp((1-sin(x(i,1))).^ 2)+...
        (x(i,1)-x(i,2)).^ 2;
    end
end
%% 23. Shubert Function
% continuous, differentiable, non-separable, multimodal, non-convex 
%  xi=[-10,10] for i=1,2.
% f(x)=-186.7309.
% https://www.sfu.ca/~ssurjano/shubert.html
if funcnum == 11
    for i=1:nop
        n      = size(x,2);
        f(i,1) = 1;
        for k = 1:n
            inner_sum = 0;
            for j = 1:5
                inner_sum = inner_sum+j*cos(((j + 1)*x(i, k))+ j);
            end
            f(i,1) = inner_sum .* f(i,1);
        end
    end
end
%% 76.Mishra 3 Function
% https://arxiv.org/pdf/1308.4008.pdf
% xi=[-10,10]. x=f(-8.466,-10),f(x)=-0.18467
% (Continuous, Differentiable, Non-Separable, Non-Scalable,Multimodal)
if funcnum == 12 
    for i=1:nop
        f(i,1)=abs(cos(sqrt(abs(x(i,1).^2+x(i,2))))).^0.5+(x(i,1)+x(i,2))/100;
    end
end
%% Schaffer Function N. 4
% https://www.sfu.ca/~ssurjano/schaffer4.html
% https://en.wikipedia.org/wiki/Test_functions_for_optimization
% xi=[-100,100]. x=f(0,-1.25313)),f(x)=0.292579.
% (Continuous, Differentiable, Non-Separable, Scalable,Multimodal)
if funcnum == 13
    for i=1:nop
        fact1 = (cos(sin(abs(x(i,1)^2-x(i,2)^2))))^2 - 0.5;
        fact2 = (1 + 0.001*(x(i,1)^2+x(i,2)^2))^2;
        
        f(i,1) = 0.5 + fact1/fact2;
    end
end
%% 103.Ripple 1 Function
% https://hal-enac.archives-ouvertes.fr/hal-00996713/document
% xi=[0,1]. f(x)=-2.2.
% https://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=1331058&tag=1
% (Non-separable)
if funcnum == 14
    n = size(x,2);
    for i=1:nop
        f(i,1) = 0;
        for j=1:n
            ft = -exp(-2*log(2)*((x(i,j)-0.1)/0.8)^2);
            st = (sin(5*pi*x(i,j)))^6+0.1*(cos(500*pi*x(i,j)))^2;
            f(i,1) = f(i,1)+ft+st;
        end
    end
end
%% 152.Trefethen Function
% https://arxiv.org/pdf/1308.4008.pdf
% xi=[-10,10]. x=f(-0.024403,0.210612),f(x)=-3.30686865
% Continuous, Differentiable, Non-Separable, Non-Scalable,Multimodal)
if funcnum == 15
    for i=1:nop
        f(i,1)=exp(sin(50*x(i,1)))+sin(60*exp(x(i,2)))+...
            sin(70*sin(x(i,1)))+sin(sin(80*x(i,2)))-...
            sin(10*(x(i,1)+x(i,2)))+(1/4)*(x(i,1)^2+x(i,2)^2);
    end
end
%% 151.Trid 10 Function
% https://arxiv.org/pdf/1308.4008.pdf
% xi=[-100,100]. f(x) =-200
% (Continuous, Differentiable, Non-Separable, Non-Scalable,Multimodal)
if funcnum == 16
    n = size(x,2);
    for i=1:nop
        f(i,1) = 0;
        sum1 = 0;
        for j=1:n
            ft = (x(i,j)-1)^2;
            sum1 = sum1+ft;
        end
        sum2 = 0;
        for k=2:n
            st = x(i,j)*x(i,j-1);
            sum2 = sum2+st;
        end
        f(i,1) = f(i,1)+sum1-sum2;
    end
end
%% Hartmann 3-Dimensional Function
% https://www.sfu.ca/~ssurjano/hart3.html
%  xi->(0,1), for all i=1,2,3.
%  f(x)=-3.86278., x=(0.114614, 0.555649, 0.852547)
% (Continuous, Differentiable, Non-Separable, Non-Scalable,Multimodal)
if funcnum == 17
    aH=[3 10 30;.1 10 35;3 10 30;.1 10 35];cH=[1 1.2 3 3.2];
    pH=[.3689 .117 .2673;.4699 .4387 .747;.1091 .8732 .5547;.03815 .5743 .8828];

    for i=1:nop
        f(i,1)=0;
        for j=1:4
            f(i,1)=f(i,1)-cH(j)*exp(-(sum(aH(j,:).*((x(i,:)-pH(j,:)).^2))));
        end
    end
end
%% Sine Envelope
% https://hal-enac.archives-ouvertes.fr/hal-00996713/document
if funcnum == 18
    n = size(x,2);
    for i=1:nop
        f(i,1) = 0;
        for j=1:n-1
            fact1 = (sin(sqrt(x(i,j+1)^2+x(i,j)^2) - 0.5))^2;
            fact2 = (1 + 0.001*(x(i,j+1)^2+x(i,j)^2))^2;
            
            f(i,1) = f(i,1) + 0.5 + fact1/fact2;
        end
        f(i,1) = -f(i,1);
    end
end
%% 102.Rana Function
% https://hal-enac.archives-ouvertes.fr/hal-00996713/document
% xi=[-512,512]. f(x)=-2558.5397934.
% (Continuous, Differentiable, Non-Separable, Scalable, Multi-modal)
if funcnum == 19
    n = size(x,2);
    for i=1:nop
        f(i,1) = 0;
        for j=1:n-1
            ft = x(i,j)*cos(sqrt(abs(x(i,j+1)+x(i,j)+1)))*sin(sqrt(abs(x(i,j+1)-x(i,j)+1)));
            st = (1+x(i,j+1))*sin(sqrt(abs(x(i,j+1)+x(i,j)+1)))*cos(sqrt(abs(x(i,j+1)-x(i,j)+1)));
            f(i,1) = f(i,1)+ft+st;
        end
        f(i,1) = -f(i,1);
    end
end
%% 130.Shekel 5
% https://arxiv.org/pdf/1308.4008.pdf
% 0<xj<10 x=f(4,4,4,4),f(x)=-10.1532
% (Continuous, Differentiable, Non-Separable, Scalable, Multimodal)
if funcnum == 20
    aSH=[4 4 4 4;1 1 1 1;8 8 8 8;6 6 6 6;3 7 3 7;2 9 2 9;5 5 3 3;8 1 8 1;6 2 6 2;7 3.6 7 3.6];
    cSH=[.1 .2 .2 .4 .4 .6 .3 .7 .5 .5];
    for i=1:nop
        f(i,1)=0;
        for j=1:5
            f(i,1)=f(i,1)-((x(i,1)-aSH(j,:))*(x(i,1)-aSH(j,:))'+cSH(j))^(-1);
        end
    end
end
%% 131.Shekel 7
% https://arxiv.org/pdf/1308.4008.pdf
% 0<xj<10 x=f(4,4,4,4),f(x)=-10.4029
% (Continuous, Differentiable, Non-Separable, Scalable, Multimodal)
if funcnum == 21
    aSH=[4 4 4 4;1 1 1 1;8 8 8 8;6 6 6 6;3 7 3 7;2 9 2 9;5 5 3 3;8 1 8 1;6 2 6 2;7 3.6 7 3.6];
    cSH=[.1 .2 .2 .4 .4 .6 .3 .7 .5 .5];    
    for i=1:nop
        f(i,1)=0;
        for j=1:7
            f(i,1)=f(i,1)-((x(i,1)-aSH(j,:))*(x(i,1)-aSH(j,:))'+cSH(j))^(-1);
        end
    end
end
%% 132.Shekel 10
% https://arxiv.org/pdf/1308.4008.pdf
% 0<xj<10 x=f(4,4,4,4),f(x)=-10.5364
% (Continuous, Differentiable, Non-Separable, Scalable, Multimodal)
if funcnum == 22
    for i=1:nop
        aSH=[4 4 4 4;1 1 1 1;8 8 8 8;6 6 6 6;3 7 3 7;2 9 2 9;5 5 3 3;8 1 8 1;6 2 6 2;7 3.6 7 3.6];
        cSH=[.1 .2 .2 .4 .4 .6 .3 .7 .5 .5];
        
        f(i,1)=0;
        for j=1:10
            f(i,1)=f(i,1)-((x(i,1)-aSH(j,:))*(x(i,1)-aSH(j,:))'+cSH(j))^(-1);
        end
    end
end
%% 36.Colville Function
% https://arxiv.org/pdf/1308.4008.pdf
% xi=[-10,10]. f(x)=0
% (Continuous, Differentiable, Non-Separable, Non-Scalable, Mul-timodal)
if funcnum == 23
    for i=1:nop
        f(i,1)=100*((x(i,1)^2-x(i,2)))^2+(1-x(i,1))^2+...
            (90*(-x(i,4)+x(i,3)^2)^2)+(1-x(i,3))^2+...
            (10.1*((x(i,2)-1)^2+(x(i,4)-1)^2))+(19.8*(x(i,2)-1)*(x(i,4)-1));
    end
end
%% 98.Qing Function
% http://benchmarkfcns.xyz/benchmarkfcns/happycatfcn.html
% -500<xi<500 global minimum is located at x=f(±sqrt(i)),f(x)=0
%  (Continuous, Differentiable, Separable Scalable, Multimodal)
if funcnum == 24
    n = size(x, 2);
    x2 = x.^2;
    for i=1:nop
        f(i,1) = 0;
        for j=1:n
            f(i,1) = f(i,1) + (x2(i,j)-j).^2;
        end
    end
end
%% 154.Trigonometric 2 Function
% https://arxiv.org/pdf/1308.4008.pdf
% xi=[-500,500]. f(x)=1.
% (Continuous, Differentiable, Non-Separable, Scal-able, Multimodal)
if funcnum == 25
    n = size(x,2);
    for i=1:nop
        f(i,1) = 0;
        for j=1:n
            ft = 8*(sin(7*(x(i,j)-9)^2))^2;
            st = 6*(sin(14*(x(i,j)-9)^2))^2;
            tt = (x(i,j)-9)^2;
            f(i,1) = f(i,1)+ft+st+tt;
        end
        f(i,1) = f(i,1)+1;
    end
end
%% 67.Whitley Function
% https://arxiv.org/pdf/1308.4008.pdf
% xi=[-10.24,10.24]. x=f(0,...,0),f(x) = 0.
% (Continuous, Differentiable, Non-Separable, Scalable, Mul-timodal)
if funcnum == 26
    for i=1:nop
        f(i,1) = 0; 
        for j=1:dim
            sum1(j,1) = 0;
            sum2 = 0;
            for k=1:dim
                ft= (1/4000)*(100*((x(i,j))^2-x(i,k))^2+(1-x(i,k))^2)^2;
                st = -cos(100*((x(i,j))^2-x(i,k))^2+((1-x(i,k))^2))+1; 
                sum2 = sum2+ft+st;
            end  
            sum1(j,1) = sum1(j,1)+sum2;
        end  
        f(i,1)=f(i,1)+sum(sum1);
    end
end
%% 53.Egg Holder Function
% https://arxiv.org/pdf/1308.4008.pdf
% https://al-roomi.org/benchmarks/unconstrained/n-dimensions/187-egg-holder-function
% xi=[-512,512]. (x1,x2)=(512,404.231805123817),f(x)=-8291.2400675
% (Continuous, Differentiable, Non-Separable, Scalable, Multi-modal)
if funcnum == 27
    n = size(x,2);
    for i=1:nop
        f(i,1)=0;
        for j=1:n-1
        f(i,1)=f(i,1)+(-(x(i,j+1)+47).*sin(sqrt(abs(0.5*x(i,j)+x(i,j+1)+47)))...
            -x(i,j).*sin(sqrt(abs(x(i,j)-x(i,j+1)-47))));
        end
    end
end
%% Generalized Schwefel's Function No.2.26
% https://al-roomi.org/benchmarks/unconstrained/n-dimensions/176-generalized-schwefel-s-problem-2-26
% -500<xi<500 , i=1,2,...,n
% x=420.968746, f(x)=-418.982887272433799807913601398*n
% (Continuous, Differentiable, Separable, Scalable, Mul-timodal)
if funcnum == 28
    for i=1:nop
            f(i,1) = sum(-x(i,:).*sin(sqrt(abs(x(i,:)))));
    end
end
%% Styblinski-Tang Function
% http://benchmarkfcns.xyz/benchmarkfcns/styblinskitankfcn.html
%  x=[-5,5] for all i=1,…,n.
% f(x)=-39.16599n at x=(-2.903534,…,-2.903534).
if funcnum == 29
    for i=1:nop
        n = size(x, 2);
        f(i,1) = 0;
        for j = 1:dim
            f(i,1) = f(i,1)+((x(i, j).^4)-(16*x(i,j).^ 2)+(5*x(i,j)));
        end
        f(i,1) = 0.5*f(i,1);
    end
end
%% Deb's Function No.02
% https://www.al-roomi.org/benchmarks/unconstrained/n-dimensions/232-deb-s-function-no-02
% xi=[0,1]. f(x) =-1
% (Continuous, Differentiable, Separable, Scalable, Multimodal)
if funcnum == 30
    n = size(x,2);
    for i=1:nop
        f(i,1) = 0;
        sum1 = 0;
        for j=1:n
            ft = (-1/n)*(sin(5*pi*(x(i,j)^(3/4)-0.05)))^6;
            sum1 = sum1+ft;
        end
        f(i,1) = f(i,1)+sum1;
    end
end
%% Michalewicz Function
% https://www.sfu.ca/~ssurjano/michal.html
% https://hal-enac.archives-ouvertes.fr/hal-00996713/document
% xi=[0,pi]. f(x)=-29.65648
if funcnum == 31
    n = size(x,2);
    for i=1:nop
        f(i,1)=0;
        for j=1:n
            xi = x(i,j);
            new = sin(xi) * (sin(j*xi^2/pi))^(2*dim);
            f(i,1)=f(i,1)+new;
        end
        f(i,1)=-f(i,1);
    end
end
%% n-dimensional Functions - 1. Ackley Function
% n-dimensional, continuous, multimodal, non-convex, differentiable 
% xi->[-32,32] for all i=1,…,n.
% f(x)=0 at x=(0,…,0).
if funcnum == 32
    for i=1:nop
        dim=size(x(i,1),1);
        f(i,1)=-20*exp(-.2*sqrt(sum(x(i,1).^2)/dim))-exp(sum(cos(2*pi.*x(i,1)))/dim)+20+exp(1);
    end
end
%% 59.Griewank Function
% https://arxiv.org/pdf/1308.4008.pdf
% -100<xi<100. x=f(0,· · ·,0), f(x) = 0.
% (Continuous, Differentiable, Non-Separable, Scalable, Multimodal)
if funcnum == 33
    for i=1:nop
        dim=size(x(i,1),2);
        f(i,1)=sum(x(i,1).^2)/4000-prod(cos(x(i,1)./sqrt([1:dim])))+1;
    end
end
%% 54.Exponential Function
% https://arxiv.org/pdf/1308.4008.pdf
% -1<xi<1 The global minima is located at x=f(0,...,0),f(x)=-1.
% (Continuous, Differentiable, Non-Separable, Scalable,Multimodal)
if funcnum == 34
    for i=1:nop
        x2 = x(i,1).^2;
        f(i,1) = -exp(-0.5*sum(x2,2));
    end
end
%% Happy Cat Function
% http://benchmarkfcns.xyz/benchmarkfcns/happycatfcn.html
% xi=[-2,2], one global minimum at f(x)=0 located at x=(-1,...,-1).
% not convex, n-dimensional space, non-separable, differentiable.
if funcnum == 35
    alpha = 0.5;
    n  = size(x, 2);
    x2 = sum(x.*x, 2);
    for i=1:nop 
        f(i,1) = ((x2(i,1) - n).^2).^(alpha) + (0.5*x2(i,1) +...
            sum(x(i,1),2))/n + 0.5;
    end
end
%% 90.Periodic Function[4] (Separable)
% http://benchmarkfcns.xyz/benchmarkfcns/happycatfcn.html
% -10<xi<10 global minimum is located at x=f(0,...,0),f(x)=0.9
%  n-dimensional, continuous, differentiable, non-separable, multimodal,
% non-convex 
if funcnum == 36
    for i=1:nop
        sin2x = sin(x(i,1)).^2;
        sumx2 = sum(x(i,1).^2,2);
        f(i,1) = 1 + sum(sin2x, 2)-0.1*exp(-sumx2);
    end
end
%% 
if funcnum == 37   
    n  = size(x, 2);
    for j=1:nop 
        f(j,1) = 0;
        for i=1:n-1
            f(j,1)=f(j,1)+x(1,i)^2+((10^6)*x(1,i+1)^2);
        end
    end
end