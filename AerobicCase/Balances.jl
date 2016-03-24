include("Kinetics.jl")
include("Control.jl")

function Balances(t,x,dxdt_vector,DF)

  # Alias the species vector -
  M_glc = x[30];
  M_ace = x[31];
  M_bio = x[32];
  xEth = x[33];
  xSucc = x[34];
  xLac = x[35];
  xPyr = x[36];
  xFor = x[37];

  #Define rate vector
  kinetics_dict = Kinetics(t,x,DF);
  rM = kinetics_dict["rM_vector"] #Metabolite
  rE = kinetics_dict["rE_vector"] #Enzyme
  rG = kinetics_dict["rG_vector"] #Growth

  #Get Parameters from DF
  alpha = DF["EnzymeSynthesis"]
  beta = DF["Degradation"]
  Z = DF["ModeMatrix"]
  S = DF["MetaboliteMatrix"]
  (num_reactions,num_modes) = size(Z)

  #Define Control Vector
  (u,v) = Control(t,x,rM,rE,DF)
  V = eye(length(v)).*v

  #Redine rates (rate*control)
  Enzyme_rate = rE.*u;
  Growth_rate = rG.*v;
  Reaction_rate = rM.*v;
  mu = sum(Growth_rate)

  SV = S[1:8,:]*Z*Reaction_rate*M_bio
  #SVo2 = sum(AVo2.*V*rM.*M_bio)

  #Enzyme Balances
  dxdt_vector[1:num_modes] = alpha + Enzyme_rate - (beta+mu)*x[1:num_modes]

  #Metabolite Balances
  dxdt_vector[30:37] = SV[1:8]
  return dxdt_vector
end
