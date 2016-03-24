function Kinetics(t,x,DF)

  #Initialize rate_vectors
  rM = Float64[]
  rE = Float64[]
  rG = Float64[]

  # Alias the species vector -
  e1 = x[1];
  e2 = x[2];
  e3 = x[3];
  Ax = x[4];
  Bx = x[5];
  Cx = x[6];
  M_bio = x[7];

  #Parametrs from DF
  kmax = DF["ReactionRateVector"]
  K = DF["SaturationConstantVector"]
  ke = DF["EnzymeRate"]
  alpha = DF["EnzymeSynthesis"]
  beta = DF["Degradation"]
  Z = DF["ModeMatrix"]
  S = DF["MetaboliteMatrix"]

  #Metabolite Reaction
  fill!(rM,0.0)
  push!(rM,kmax[1]*x[1]*Ax/(K[1]+Ax))
  push!(rM,kmax[2]*x[2]*Ax/(K[2]+Ax))
  push!(rM,kmax[3]*x[3]*Ax/(K[3]+Ax))

  #EnzymeReactionRate
  fill!(rE,0.0)
  push!(rE,ke*Ax/(K[1]+Ax))
  push!(rE,ke*Ax/(K[2]+Ax))
  push!(rE,ke*Ax/(K[3]+Ax))

  #GrowthRate
  fill!(rG,0.0)
  push!(rG,Z[end,1]*rM[1])
  push!(rG,Z[end,2]*rM[2])
  push!(rG,Z[end,3]*rM[3])

  #===========================================#
  kinetics_dict = Dict()
  kinetics_dict["rM_vector"] = rM
  kinetics_dict["rE_vector"] = rE
  kinetics_dict["rG_vector"] = rG
  return kinetics_dict
end
