function Kinetics(t,x,DF)

  #Initialize rate_vectors
  rM = Float64[]
  rE = Float64[]
  rG = Float64[]

  # Alias the species vector -
  e1 = x[1];
  e2 = x[2];
  e3 = x[3];
  e4 = x[4];
  e5 = x[5];
  e6 = x[6];
  M_glc = x[7];
  M_suc = x[8];
  M_for = x[9];
  M_lac = x[10];
  M_ace = x[11];
  M_eth = x[12];
  M_bio = x[13];

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
  push!(rM,kmax[1]*x[1]*M_glc/(K[1]+M_glc))
  push!(rM,kmax[2]*x[2]*M_glc/(K[2]+M_glc))
  push!(rM,kmax[3]*x[3]*M_glc/(K[3]+M_glc))
  push!(rM,kmax[4]*x[4]*M_glc/(K[4]+M_glc))
  push!(rM,kmax[5]*x[5]*M_glc/(K[5]+M_glc))
  push!(rM,kmax[6]*x[6]*M_glc/(K[6]+M_glc))
  push!(rM,kmax[7]*M_for^2/(K[7]^2+M_for^2))

  #EnzymeReactionRate
  fill!(rE,0.0)
  push!(rE,ke*M_glc/(K[1]+M_glc))
  push!(rE,ke*M_glc/(K[2]+M_glc))
  push!(rE,ke*M_glc/(K[3]+M_glc))
  push!(rE,ke*M_glc/(K[4]+M_glc))
  push!(rE,ke*M_glc/(K[5]+M_glc))
  push!(rE,ke*M_glc/(K[6]+M_glc))

  #GrowthRate
  fill!(rG,0.0)
  for i = 1:num_modes
    push!(rG,(Z[12,i]*rM[i]))
  end

  #===========================================#
  kinetics_dict = Dict()
  kinetics_dict["rM_vector"] = rM
  kinetics_dict["rE_vector"] = rE
  kinetics_dict["rG_vector"] = rG
  return kinetics_dict
end
