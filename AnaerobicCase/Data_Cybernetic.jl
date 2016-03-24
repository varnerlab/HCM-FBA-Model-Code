function Data_Cybernetic(tStart,tStop,tStep)

#Load Modes
  em_matrix = float(readdlm("Data/FBA_em.csv",','));
  Z = em_matrix';
#Load Stoichiometric Matrix
  stm_matrix = float(open(readdlm,"Data/NetworkSTM.dat"));
  S = stm_matrix
#============================#
#EnzymeRateParameters
  alpha = 0.04
  beta = 0.05
  ke = 0.620342
#============================#
#kcat
  kmax = [
  0.346572; #kmax[1]
  0.0124164; #kmax[2]
  0.032764; #kmax[3]
  0.049244; #kmax[4]
  0.203273; #kmax[5]
  0.249942; #kmax[6]
  7.90653; #kmax[7]
  ];


#============================#
#Ksat
  K = [
  1.19695; # 1
  10.3871; # 2
  0.312798; # 3
  5.42755; # 4
  4.40557; # 5
  11.9541; # 6
  10.5902; # 7 Formate
  ];

#=============================#
#Initial Conditions
  x0 = [
    0.9; # e1
    0.9; # e2
    0.9; # e3
    0.9; # e4
    0.9; # e5
    0.9; # e6
    Glc[1]; # M_glc
    Suc[1]; # M_suc
    For[1];  # M_for
    Lac[1];  # M_lac
    Ace[1]; # M_ace
    Eth[1]; # M_eth
    Bio[1]; # M_bio
  ];
#=======================================#
  #Parametrs from Data_dict
  Data_dict = Dict()
  Data_dict["ReactionRateVector"] = kmax
  Data_dict["SaturationConstantVector"] = K
  Data_dict["EnzymeRate"] = ke
  Data_dict["EnzymeSynthesis"] = alpha
  Data_dict["Degradation"] = beta
  Data_dict["ModeMatrix"] = Z
  Data_dict["MetaboliteMatrix"] = S
  Data_dict["InitialConditions"] = x0

  return Data_dict
end
