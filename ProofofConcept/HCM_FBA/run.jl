include("SolveBalances.jl")

#DefineTime
tStart = 0.0;
tStop = 100.0;
tStep = 1;

#loadParameterValues
Param = Float64[]

#SolverResults
(t,x) = SolveBalances(tStart,tStop,tStep,Param)

#Define species from SolverResults
Ax = x[:,4]
Bx = x[:,5]
Cx = x[:,6]
Biox = x[:,7]


using PyPlot
figure(1)
plot(t,Ax,color="k",label="HCM FBA",linewidth=2)
plot(t,Bx, color="k",linewidth=2)
plot(t,Cx, color="k",linewidth=2)
plot(t,Biox, color="k",linewidth=2)
legend(fontsize=18)
xlabel("Time (hr)",fontsize=20)
ylabel("Abundance (mM)",fontsize=20)
axis([0,100,0,2.1;]);
