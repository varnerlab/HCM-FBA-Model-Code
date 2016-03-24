include("Data_Cybernetic.jl")
include("Balances.jl")
using Sundials

function SolveBalances(tStart,tStop,tStep,Param)

  #Define time vector
  t = [tStart:tStep:tStop;]

  #Load Initial Conditions
  Data_dict = Data_Cybernetic(tStart,tStop,tStep)
  IC = Data_dict["InitialConditions"]

  #Define Parameter values
  if isempty(Param)
    DF = Data_dict
  else
    kmax = Param[1:3]
    K = Param[4:6]
    ke = Param[7]


    #Rewrite Data Dictionary
    Data_dict["ReactionRateVector"] = kmax
    Data_dict["SaturationConstantVector"] = K
    Data_dict["EnzymeRate"] = ke
    DF = Data_dict
  end

  #RunSolver
  f(t,x,dxdt) = Balances(t,x,dxdt,DF)
  x = Sundials.cvode(f,IC,t)

  return t,x
end
