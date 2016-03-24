include("loadData.jl")
include("SolveBalances.jl")

#DefineTime
tStart = 0.0;
tStop = 9.0;
tStep = 0.1;

#loadParameterValues
Param = Float64[]

#SolverResults
(t,x) = SolveBalances(tStart,tStop,tStep,Param)

#Define species from solver
xGlc = x[:,7]
xSuc = x[:,8]
xFor = x[:,9]
xLac = x[:,10]
xAce = x[:,11]
xEth = x[:,12]
xBio = x[:,13]
