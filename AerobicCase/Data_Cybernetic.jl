function Data_Cybernetic(tStart,tStop,tStep)

#Load Modes
  mode_matrix = float(readdlm("Data/modes_FBA.csv",','));
#Load Stoichiometric Matrix
  stm_matrix = float(open(readdlm,"Data/Network.dat"));
  S = zeros(9,105)
  S[1,:] = stm_matrix[49,:]#glc
  S[2,:] = stm_matrix[55,:]#ace
  S[3,:] = stm_matrix[62,:]#bio
  S[4,:] = stm_matrix[54,:]#ETH
  S[5,:] = stm_matrix[56,:]#succ
  S[6,:] = stm_matrix[57,:]#LAC
  S[7,:] = stm_matrix[58,:]#PYR
  S[8,:] = stm_matrix[59,:]#FOR

#============================#
#EnzymeRateParameters
  ke = 0.41
  alpha = 0.005
  beta = 0.05
#============================#
#kcat
  kmax = [
    3.5; #kmax[1] #3.5
    1.0; #kmax[2] #1.0
    1.0; #kmax[3] #1.0
    2.25; #kmax[4]
    2.25; #kmax[5]
    2.25; #kmax[6]
    2.25; #kmax7
    2.25; #kmax8
    2.25; #kmax9
    2.25; #kmax10
    2.25; #kmax11
    2.25; #kmax12
    2.25; #kmax13
    2.25; #kmax14
    2.25; #kmax15
    2.25; #kmax16
    2.25; #kmax17
    0.6; #kmax18 #Acetate
    0.6; #kmax19
    0.5; #kmax20
    0.5; #kmax21
    0.5; #kmax22
    0.5; #kmax23
    0.5; #kmax24
    0.5; #kmax25
    0.5; #kmax26
    0.5; #kmax27
    0.5; #kmax28
    0.5; #kmax29
    ];

#============================#
#Ksat
  K = [
  1.0; #K[1]
  1.0; #K[2]
  1.0; #K[3]
  1.0; #K[4]
  1.0; #K[5]
  1.0; #K[6]
  1.0; #K7
  1.0; #K8
  1.0; #K9
  1.0; #K10
  1.0; #K11
  1.0; #K12
  1.0; #K13
  1.0; #K14
  1.0; #K15
  1.0; #K16
  1.0; #K17
  1.0; #K18 Acetate
  1.0; #K19
  1.5; #K20
  1.5; #K21
  1.5; #K22
  1.5; #K23
  1.5; #K24
  1.5; #K25
  1.5; #K26
  1.5; #K27
  1.5; #K28
  1.5; #K29
    ];

#=============================#
#Initial Conditions
  x0 = [
    0.8; # e1
    0.8; # e2
    0.8; # e3
    0.8; # e4
    0.8; # e5
    0.8; # e6
    0.8; # e7
    0.8; # e8
    0.8; # e9
    0.8; # e10
    0.8; # e11
    0.8; # e12
    0.8; # e13
    0.8; # e14
    0.8; # e15
    0.8; # e16
    0.8; # e17
    0.8; # e18
    0.8; # e19
    0.8; # e20
    0.8; # e21
    0.8; # e22
    0.8; # e23
    0.8; # e24
    0.8; # e25
    0.8; # e26
    0.8; # e27
    0.8; # e28
    0.8; # e29
    11.1; # M_glc
    0.35; # M_ace
    0.001;  # M_bio
    0.0; #eth
    0.0; #succ
    0.0; #lac
    0.0; #pyr
    0.0; #for
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
  Data_dict["MetaboliteMatrix"] = S
  Data_dict["InitialConditions"] = x0
  return Data_dict
end
