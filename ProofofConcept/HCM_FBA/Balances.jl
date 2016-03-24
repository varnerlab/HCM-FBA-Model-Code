include("Kinetics.jl")
include("Control.jl")

function Balances(t,x,dxdt_vector,DF)

  # Alias the species vector -
  e1 = x[1];
  e2 = x[2];
  e3 = x[3];
  Ax = x[4];
  Bx = x[5];
  Cx = x[6];
  M_bio = x[7];

  #Define rate vector
  kinetics_dict = Kinetics(t,x,DF);
  rM = kinetics_dict["rM_vector"] #Metabolite Rate Vector
  rE = kinetics_dict["rE_vector"] #Enzyme Rate Vector
  rG = kinetics_dict["rG_vector"] #Growth Rate

  #Get Parameters from DF
  alpha = DF["EnzymeSynthesis"]
  beta = DF["Degradation"]
  Z = DF["ModeMatrix"]
  S = DF["MetaboliteMatrix"]
  (num_reations,num_modes) = size(Z)

  #Define Control Vector
  (u,v) = Control(t,x,rM,rE,DF)
  V = eye(length(v)).*v

  #Redine rates (rate*control)
  Enzyme_rate = rE.*u;
  Growth_rate = rG.*v;
  Reaction_rate = rM.*v;
  mu = sum(Growth_rate)


  #Enzyme Balances
  dxdt_vector[1:num_modes] = alpha + Enzyme_rate - (beta+mu)*x[1:num_modes]

  #Metabolite Balances
  dxdt_vector[4:7] = S[1:4,:]*Z*Reaction_rate*M_bio

  return dxdt_vector
end
