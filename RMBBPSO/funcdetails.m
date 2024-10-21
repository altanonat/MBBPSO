function [ulim,llim,dim] = funcdetails(funcnum)
%% 58.Goldstein Price Function
% https://arxiv.org/pdf/1308.4008.pdf
% subject to -2<xi<2
% x=f(0,-1),f(x)=3
% (Continuous, Differentiable, Non-separable, Non-Scalable, Multimodal)
if funcnum == 1
    ulim = 2;
    llim = -2;
    dim  = 2;
end
%% 22.Branin RCOS Function
% https://arxiv.org/pdf/1308.4008.pdf
% -5<x1<10, 0<x1<15, but it is taken -15<x1<15, -15<x1<15
% ({-pi,12.275},{pi,2.275},{3pi,2.425}),f(x) = 0.3978873
% (Continuous, Differentiable, Non-Separable, Non-Scalable, Multimodal)
if funcnum == 2
    ulim = 15;
    llim = -15;
    dim  = 2;
end
%% 30.Camel Function – Six Hump
% https://arxiv.org/pdf/1308.4008.pdf
% -5<xi<5
% x=f({-0.0898,0.7126},{0.0898,-0.7126,0}),f(x) =-1.0316
% (Continuous, Differentiable, Non-Separable,Non-Scalable, Multimodal)
if funcnum == 3
    ulim = 5;
    llim = -5;
    dim  = 2;
end
%% Shekel's Foxholes Function 
% https://www.al-roomi.org/benchmarks/unconstrained/2-dimensions/7-shekel-s-foxholes-function
% -65.536<xi<65.536, i=1,2
% f(x)=0.998003837794449325873406851315
% (Continuous, Differentiable, Non-Separable, Scalable, Multimodal)
if funcnum == 4
    ulim = 65.536;
    llim = -65.536;
    dim  = 2;
end
%% 57.Giunta Function
% https://arxiv.org/pdf/1308.4008.pdf
% -1<xi<1
% x=f(0.45834282,0.45834282),f(x) = 0.060447.
% (Continuous, Differentiable, Separable, Scalable, Multimodal
if funcnum == 5
    llim=-1;
    ulim=1;
    dim=2;
end
%% 145 Table 1/ Holder Table 1 function 
% https://arxiv.org/pdf/1308.4008.pdf
% -10<xi<10 x=f(±9.646168,±9.646168) f(x)=-26.920336
% (Continuous, Differentiable, Separable,Non-Scalable, Multimodal)
if funcnum == 6
    llim=-10;
    ulim=10;
    dim=2;
end
%% 146 Table 2/ Holder Table 2 function 
% https://arxiv.org/pdf/1308.4008.pdf
% x=f(±8.055023472141116,±9.664590028909654) f(x)=-19.20850.
% (Continuous, Differentiable, Separable,Non-Scalable, Multimodal)
if funcnum == 7
    llim=-10;
    ulim=10;
    dim=2;
end
%% 175.Zirilli or Aluffi-Pentini’s Function
% https://arxiv.org/pdf/1308.4008.pdf
% -10 < xi < 10 x = (-1.0465, 0), f(x) = -0.3523.
% (Continuous, Differentiable, Separable, Non-Scalable, Unimodal)
if funcnum == 8
    llim=-10;
    ulim=10;
    dim=2;
end
%% 4. Ackley 4 or Modified Ackley Function
% https://arxiv.org/pdf/1308.4008.pdf
% -35<xi<35. x=f({-1.479252,-0.739807},{1.479252,-0.739807}),f(x) =-4.590101633799122.
% (Continuous, Differentiable, Separable, Scalable, Multi-modal)
if funcnum == 9
    llim=-35;
    ulim=35;
    dim=2;
end
%% Bird Function
% http://benchmarkfcns.xyz/benchmarkfcns/birdfcn.html
% xi=[-2pi,2pi] for i=1,2.
% f(x)=-106.764537 located at x=(4.70104,3.15294) and x=(-1.58214,-3.13024).
% (Continuous, Differentiable, Non-Separable, Non-Scalable, Mul-timodal)
if funcnum == 10
    llim=-2*pi;
    ulim=2*pi;
    dim=2;
end
%% Shubert Function
% http://benchmarkfcns.xyz/benchmarkfcns/shubertfcn.html
%  xi=[-10,10] for i=1,…,n.
% f(x)=-186.7309.
if funcnum == 11
    llim=-10;
    ulim=10;
    dim=2;
end
%% 76.Mishra 3 Function
% https://arxiv.org/pdf/1308.4008.pdf
% xi=[-10,10]. x=f(-8.466,-10),f(x)=-0.18467
% (Continuous, Differentiable, Non-Separable, Non-Scalable,Multimodal)
if funcnum == 12
    llim=-10;
    ulim=10;
    dim=2;
end
%% Schaffer Function N. 4
% https://www.sfu.ca/~ssurjano/schaffer4.html
% https://en.wikipedia.org/wiki/Test_functions_for_optimization
% xi=[-100,100]. x=f(0,-1.25313)),f(x)=0.292579.
% (Continuous, Differentiable, Non-Separable, Scalable,Multimodal)
if funcnum == 13
    llim=-100;
    ulim=100;
    dim=2;
end
%% 103.Ripple 1 Function
% https://hal-enac.archives-ouvertes.fr/hal-00996713/document
% xi=[0,1]. f(x)=-2.2.
% https://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=1331058&tag=1
% (Non-separable)
if funcnum == 14
    llim=0;
    ulim=1;
    dim=2;
end
%% 152.Trefethen Function
% https://arxiv.org/pdf/1308.4008.pdf
% xi=[-10,10]. x=f(-0.024403,0.210612),f(x)=-3.30686865
% (Continuous, Differentiable, Non-Separable, Non-Scalable,Multimodal)
if funcnum == 15
    llim=-10;
    ulim=10;
    dim=2;
end
%% 151.Trid 10 Function
% https://arxiv.org/pdf/1308.4008.pdf
% https://www.sfu.ca/~ssurjano/trid.html
% xi=[-100,100]. f(x) =-200
% (Continuous, Differentiable, Non-Separable, Non-Scalable,Multimodal)
if funcnum == 16
    llim=-4;
    ulim=4;
    dim=2;
end
%% Hartmann 3-Dimensional Function
% https://www.sfu.ca/~ssurjano/hart3.html
%  xi->(0,1), for all i=1,2,3.
%  f(x)=-3.86278., x=(0.114614, 0.555649, 0.852547)
% (Continuous, Differentiable, Non-Separable, Non-Scalable,Multimodal)
if funcnum == 17
    llim=0;
    ulim=1;
    dim=3;
end
%% Sine Envelope
% https://hal-enac.archives-ouvertes.fr/hal-00996713/document
% xi=[-100,100]. f(x)=-2.9829906.
% (Continuous, Differentiable, Non-Separable, Scalable,Multimodal)
if funcnum == 18
    llim=-100;
    ulim=100;
    dim=3;
end
%% 102.Rana Function
% https://hal-enac.archives-ouvertes.fr/hal-00996713/document
% xi=[-512,512]. f(x)=-1023.4166105.
% (Continuous, Differentiable, Non-Separable, Scalable, Multi-modal)
if funcnum == 19
    llim=-512;
    ulim=512;
    dim=3;
end
%% 130.Shekel 5
% https://arxiv.org/pdf/1308.4008.pdf
% 0<xj<10 x=f(4,4,4,4),f(x)=-10.1532
% (Continuous, Differentiable, Non-Separable, Scalable, Multimodal
if funcnum == 20
    llim=0;
    ulim=10;
    dim=4;
end
%% 131.Shekel 7
% https://arxiv.org/pdf/1308.4008.pdf
% 0<xj<10 x=f(4,4,4,4),f(x)=-10.4029
% (Continuous, Differentiable, Non-Separable, Scalable, Multimodal)
if funcnum == 21
    llim=0;
    ulim=10;
    dim=4;
end
%% 132.Shekel 10
% https://arxiv.org/pdf/1308.4008.pdf
% 0<xj<10 x=f(4,4,4,4),f(x)=-10.5364
% (Continuous, Differentiable, Non-Separable, Scalable, Multimodal)
if funcnum == 22
    llim=0;
    ulim=10;
    dim=4;
end
%% 36.Colville Function
% https://arxiv.org/pdf/1308.4008.pdf
% xi=[-10,10]. f(x)=0
% (Continuous, Differentiable, Non-Separable, Non-Scalable, Mul-timodal)
if funcnum == 23
    llim=-10;
    ulim=10;
    dim=4;
end
%% 98.Qing Function
% http://benchmarkfcns.xyz/benchmarkfcns/happycatfcn.html
% -500<xi<500 global minimum is located at x=f(±sqrt(i)),f(x)=0
%  (Continuous, Differentiable, Separable Scalable, Multimodal)
if funcnum == 24
    llim=-500;
    ulim=500;
    dim=5;
end
%% 154.Trigonometric 2 Function
% https://arxiv.org/pdf/1308.4008.pdf
% xi=[-500,500]. f(x)=1.
% (Continuous, Differentiable, Non-Separable, Scal-able, Multimodal)
if funcnum == 25
    llim=-500;
    ulim=500;
    dim=5;
end
%% 67.Whitley Function
% https://arxiv.org/pdf/1308.4008.pdf
% https://www.cs.unm.edu/~neal.holts/dga/benchmarkFunction/whitley.html
% xi=[-10.24,10.24]. x=f(0,...,0),f(x) = 0.
% (Continuous, Differentiable, Non-Separable, Scalable, Multimodal)
if funcnum == 26
    llim=-10.24;
    ulim=10.24;
    dim=5;
end
%% 53.Egg Holder Function
% https://arxiv.org/pdf/1308.4008.pdf
% https://hal-enac.archives-ouvertes.fr/hal-00996713/document
% https://al-roomi.org/benchmarks/unconstrained/n-dimensions/187-egg-holder-function
% xi=[-512,512]. (x1,x2)=(512,404.231805123817),f(x)=-8291.2400675
% (Continuous, Differentiable, Non-Separable, Scalable, Multi-modal)
if funcnum == 27
    llim=-512;
    ulim=512;
    dim=10;
end
%% 128.Schwefel 2.26 Function
% https://al-roomi.org/benchmarks/unconstrained/n-dimensions/176-generalized-schwefel-s-problem-2-26
% -500<xi<500 , i=1,2,...,n
% x=420.968746, f(x)=-418.982887272433799807913601398*n
% (Continuous, Differentiable, Separable, Scalable, Multimodal)
if funcnum == 28
    ulim = 500;
    llim = -500;
    dim  = 10;
end
%% 25. Styblinski-Tank Function n-dimensional 
% continuous multimodal non-convex 
%  x->[-5,5] for all i=1,…,n.
% f(x)=-39.16599*n at x=(2.903534,…,2.903534).
if funcnum == 29
    llim=-5;
    ulim=5;
    dim=10;
end
%% Deb's Function No.02
% https://www.al-roomi.org/benchmarks/unconstrained/n-dimensions/232-deb-s-function-no-02
% xi=[0,1]. f(x) =-1
% (Continuous, Differentiable, Separable, Scalable, Multimodal)
if funcnum == 30
    llim=0;
    ulim=1;
    dim=10;
end
%% Michalewicz Function
% https://www.sfu.ca/~ssurjano/michal.html
% https://hal-enac.archives-ouvertes.fr/hal-00996713/document
% xi=[0,pi]. f(x)=-29.65648
if funcnum == 31
    llim=0;
    ulim=pi;
    dim=30;
end
%% n-dimensional Functions - 1. Ackley Function
% n-dimensional, continuous, multimodal, non-convex, differentiable 
% xi->[-32,32] for all i=1,…,n.
% f(x)=0 at x=(0,…,0).
% (Continuous, Differentiable, Non-separable, Scalable,Multimodal)
if funcnum == 32
    llim=-32;
    ulim=32;
    dim=30;
end
%% 59.Griewank Function
% https://arxiv.org/pdf/1308.4008.pdf
% -100<xi<100. x=f(0,· · ·,0), f(x) = 0.
% (Continuous, Differentiable, Non-Separable, Scalable, Multimodal)
if funcnum == 33
    llim=-600;
    ulim=600;
    dim=30;
end
%% 54.Exponential Function
% https://arxiv.org/pdf/1308.4008.pdf
% -1<xi<1 The global minima is located at x=f(0,...,0),f(x)=-1.
% (Continuous, Differentiable, Non-Separable, Scalable,Multimodal)
if funcnum == 34
    llim=-1;
    ulim=1;
    dim=30;
end
%% Happy Cat Function
% https://arxiv.org/pdf/1308.4008.pdf
% xi=[-2,2], one global minimum at f(x)=0 located at x=(-1,...,-1).
% not convex, n-dimensional space, non-separable, differentiable.
if funcnum == 35
    llim=-2;
    ulim=2;
    dim=30;
end
%% 90.Periodic Function[4] (Separable)
% http://benchmarkfcns.xyz/benchmarkfcns/happycatfcn.html
% -10<xi<10 global minimum is located at x=f(0,...,0),f(x)=0.9
%  n-dimensional, continuous, differentiable, non-separable, multimodal,
% non-convex 
if funcnum == 36
    llim=-10;
    ulim=10;
    dim=30;
end
%% 
if funcnum == 37
    llim=-100;
    ulim=100;
    dim=30;
end
end