function Control(t,x,rM,rE,DF)

  #Initialize Control Vector
  cybernetic_var = Float64[]

  #Get the ModeMatrix
  Z = DF["ModeMatrix"]
  (num_reactions,num_modes) = size(Z)

  #Cybernetic_Variables Glucose
  fill!(cybernetic_var,0.0)
  push!(cybernetic_var,(Z[89,1]+Z[102,1])*rM[1])
  push!(cybernetic_var,(Z[89,2]+Z[102,2])*rM[2])
  push!(cybernetic_var,(Z[89,3]+Z[102,3])*rM[3])
  push!(cybernetic_var,(Z[89,4]+Z[102,4])*rM[4])
  push!(cybernetic_var,(Z[89,5]+Z[102,5])*rM[5])
  push!(cybernetic_var,(Z[89,6]+Z[102,6])*rM[6])
  push!(cybernetic_var,(Z[89,7]+Z[102,7])*rM[7])
  push!(cybernetic_var,(Z[89,8]+Z[102,8])*rM[8])
  push!(cybernetic_var,(Z[89,9]+Z[102,9])*rM[9])
  push!(cybernetic_var,(Z[89,10]+Z[102,10])*rM[10])
  push!(cybernetic_var,(Z[89,11]+Z[102,11])*rM[11])
  push!(cybernetic_var,(Z[89,12]+Z[102,12])*rM[12])
  push!(cybernetic_var,(Z[89,13]+Z[102,13])*rM[13])
  push!(cybernetic_var,(Z[89,14]+Z[102,14])*rM[14])
  push!(cybernetic_var,(Z[89,15]+Z[102,15])*rM[15])
  push!(cybernetic_var,(Z[89,16]+Z[102,16])*rM[16])
  push!(cybernetic_var,(Z[89,17]+Z[102,17])*rM[17])
  #Cybernetic_Variables Acetate
  push!(cybernetic_var,Z[97,18]*rM[18])
  push!(cybernetic_var,Z[97,19]*rM[19])
  push!(cybernetic_var,Z[97,20]*rM[20])
  push!(cybernetic_var,Z[97,21]*rM[21])
  push!(cybernetic_var,Z[97,22]*rM[22])
  push!(cybernetic_var,Z[97,23]*rM[23])
  push!(cybernetic_var,Z[97,24]*rM[24])
  push!(cybernetic_var,Z[97,25]*rM[25])
  push!(cybernetic_var,Z[97,26]*rM[26])
  push!(cybernetic_var,Z[97,27]*rM[27])
  push!(cybernetic_var,Z[97,28]*rM[28])
  push!(cybernetic_var,Z[97,29]*rM[29])

  #Initialize cybernetic variables u and v
  u = zeros(num_modes)
  v = zeros(num_modes)
  for i = 1:num_modes
    u[i] = cybernetic_var[i]/sum(cybernetic_var)
    v[i] = cybernetic_var[i]/maximum(cybernetic_var)
  end

  return u, v
end
