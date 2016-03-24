include("loadData.jl")
include("SolveBalances.jl")

#DefineTime
tStart = 0.0;
tStop = 10.5;
tStep = 0.1;

#loadParameterValues
Param = Float64[]

#Solver Results
t,x = SolveBalances(tStart,tStop,tStep,Param)

#Define species from solver
xGlc = x[:,30];
xAce = x[:,31];
xBio = x[:,32];
xEth = x[:,33];
xSucc = x[:,34];
xLac = x[:,35];
xPyr = x[:,36];
xFor = x[:,37];
