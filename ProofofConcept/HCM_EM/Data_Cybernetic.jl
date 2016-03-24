function Data_Cybernetic(tStart,tStop,tStep)

#Load Modes
  mode_matrix = float(readdlm("Data/EM_modes.csv",','));
#Load Stoichiometric Matrix
  stm_matrix = float(readdlm("Data/Network.csv",','));


#============================#
#EnzymeRateParameters
  ke = .5
  alpha = 0.004
  beta = 0.05

#============================#
#kcat
kmax = [
  0.565;
  0.337;
  0.282;
  0.353;
  0.276;
  0.0955;
  ];

#============================#
#Ksat
K = [
  1.552;
  1.612;
  1.431;
  1.587;
  1.563;
  1.42;
  ];

#=============================#
#Initial Conditions
  x0 = [
    0.5; # em1
    0.5; # em2
    0.5; # em3
    0.5; # em4
    0.5; # em5
    0.5; # em6
    2; # Ax
    0; # Bx
    0; # Cx
    0.01; # Biox
  ];

#=======================================#
  #Parametrs from Data_dict
  Data_dict = Dict()
  Data_dict["ReactionRateVector"] = kmax
  Data_dict["SaturationConstantVector"] = K
  Data_dict["EnzymeRate"] = ke
  Data_dict["EnzymeSynthesis"] = alpha
  Data_dict["Degradation"] = beta
  Data_dict["ModeMatrix"] = mode_matrix
  Data_dict["MetaboliteMatrix"] = stm_matrix
  Data_dict["InitialConditions"] = x0
  return Data_dict
end
