function Kinetics(t,x,DF)

  #Initialize rate_vectors
  rM = Float64[]
  rE = Float64[]
  rG = Float64[]

  # Alias the species vector -
  M_glc = x[30];
  M_ace = x[31];
  M_bio = x[32];
  xEth = x[33];
  xSucc = x[34];
  xLac = x[35];
  xPyr = x[36];
  xFor = x[37];

  #Parametrs from DF
  kmax = DF["ReactionRateVector"]
  K = DF["SaturationConstantVector"]
  ke = DF["EnzymeRate"]
  alpha = DF["EnzymeSynthesis"]
  beta = DF["Degradation"]
  Z = DF["ModeMatrix"]
  S = DF["MetaboliteMatrix"]
  (num_reations,num_modes) = size(Z)

  #Metabolite Reaction
  fill!(rM,0.0)
  #GlucoseUptake
  push!(rM,kmax[1]*x[1]*M_glc/(K[1]+M_glc))
  push!(rM,kmax[2]*x[2]*M_glc/(K[2]+M_glc))
  push!(rM,kmax[3]*x[3]*M_glc/(K[3]+M_glc))
  push!(rM,kmax[4]*x[4]*M_glc/(K[4]+M_glc))
  push!(rM,kmax[5]*x[5]*M_glc/(K[5]+M_glc))
  push!(rM,kmax[6]*x[6]*M_glc/(K[6]+M_glc))
  push!(rM,kmax[7]*x[7]*M_glc/(K[7]+M_glc))
  push!(rM,kmax[8]*x[8]*M_glc/(K[8]+M_glc))
  push!(rM,kmax[9]*x[9]*M_glc/(K[9]+M_glc))
  push!(rM,kmax[10]*x[10]*M_glc/(K[10]+M_glc))
  push!(rM,kmax[11]*x[11]*M_glc/(K[11]+M_glc))
  push!(rM,kmax[12]*x[12]*M_glc/(K[12]+M_glc))
  push!(rM,kmax[13]*x[13]*M_glc/(K[13]+M_glc))
  push!(rM,kmax[14]*x[14]*M_glc/(K[14]+M_glc))
  push!(rM,kmax[15]*x[15]*M_glc/(K[15]+M_glc))
  push!(rM,kmax[16]*x[16]*M_glc/(K[16]+M_glc))
  push!(rM,kmax[17]*x[17]*M_glc/(K[17]+M_glc))
  #AcetateUptake
  push!(rM,kmax[18]*x[18]*M_ace/(K[18]+M_ace))
  push!(rM,kmax[19]*x[19]*M_ace/(K[19]+M_ace))
  push!(rM,kmax[20]*x[20]*M_ace/(K[20]+M_ace))
  push!(rM,kmax[21]*x[21]*M_ace/(K[21]+M_ace))
  push!(rM,kmax[22]*x[22]*M_ace/(K[22]+M_ace))
  push!(rM,kmax[23]*x[23]*M_ace/(K[23]+M_ace))
  push!(rM,kmax[24]*x[24]*M_ace/(K[24]+M_ace))
  push!(rM,kmax[25]*x[25]*M_ace/(K[25]+M_ace))
  push!(rM,kmax[26]*x[26]*M_ace/(K[26]+M_ace))
  push!(rM,kmax[27]*x[27]*M_ace/(K[27]+M_ace))
  push!(rM,kmax[28]*x[28]*M_ace/(K[28]+M_ace))
  push!(rM,kmax[29]*x[29]*M_ace/(K[29]+M_ace))

  #EnzymeReactionRate
  fill!(rE,0.0)
  #GlucoseUptake
  push!(rE,ke*M_glc/(K[1]+M_glc))
  push!(rE,ke*M_glc/(K[2]+M_glc))
  push!(rE,ke*M_glc/(K[3]+M_glc))
  push!(rE,ke*M_glc/(K[4]+M_glc))
  push!(rE,ke*M_glc/(K[5]+M_glc))
  push!(rE,ke*M_glc/(K[6]+M_glc))
  push!(rE,ke*M_glc/(K[7]+M_glc))
  push!(rE,ke*M_glc/(K[8]+M_glc))
  push!(rE,ke*M_glc/(K[9]+M_glc))
  push!(rE,ke*M_glc/(K[10]+M_glc))
  push!(rE,ke*M_glc/(K[11]+M_glc))
  push!(rE,ke*M_glc/(K[12]+M_glc))
  push!(rE,ke*M_glc/(K[13]+M_glc))
  push!(rE,ke*M_glc/(K[14]+M_glc))
  push!(rE,ke*M_glc/(K[15]+M_glc))
  push!(rE,ke*M_glc/(K[16]+M_glc))
  push!(rE,ke*M_glc/(K[17]+M_glc))
  #AcetateUptake
  push!(rE,ke*M_ace/(K[18]+M_ace))
  push!(rE,ke*M_ace/(K[19]+M_ace))
  push!(rE,ke*M_ace/(K[20]+M_ace))
  push!(rE,ke*M_ace/(K[21]+M_ace))
  push!(rE,ke*M_ace/(K[22]+M_ace))
  push!(rE,ke*M_ace/(K[23]+M_ace))
  push!(rE,ke*M_ace/(K[24]+M_ace))
  push!(rE,ke*M_ace/(K[25]+M_ace))
  push!(rE,ke*M_ace/(K[26]+M_ace))
  push!(rE,ke*M_ace/(K[27]+M_ace))
  push!(rE,ke*M_ace/(K[28]+M_ace))
  push!(rE,ke*M_ace/(K[29]+M_ace))

  #Growthrate
  fill!(rG,0.0)
  for i = 1:num_modes
    push!(rG,(Z[105,i]*rM[i]))
  end

#===========================================#
  kinetics_dict = Dict()
  kinetics_dict["rM_vector"] = rM
  kinetics_dict["rE_vector"] = rE
  kinetics_dict["rG_vector"] = rG
  return kinetics_dict
end
