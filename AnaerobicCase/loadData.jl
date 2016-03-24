BioData = readdlm("Data/Biomass.csv",',')
tBio = BioData[:,1]
Bio = BioData[:,2]
Bioerr = BioData[:,3]

GlcData = readdlm("Data/glucose.csv",',')
tGlc = GlcData[:,1]
Glc = GlcData[:,2]
Glcerr = GlcData[:,3]

AceData = readdlm("Data/Acetate.csv",',')
tAce = AceData[:,1]
Ace = AceData[:,2]
Aceerr = AceData[:,3]

EthData = readdlm("Data/Ethanol.csv",',')
tEth = EthData[:,1]
Eth = EthData[:,2]
Etherr = EthData[:,3]

ForData = readdlm("Data/Formate.csv",',')
tFor = ForData[:,1]
For = ForData[:,2]
Forerr = ForData[:,3]

LacData = readdlm("Data/Lactate.csv",',')
tLac = LacData[:,1]
Lac = LacData[:,2]
Lacerr = LacData[:,3]

SucData = readdlm("Data/Succinate.csv",',')
tSuc = SucData[:,1]
Suc = SucData[:,2]
Sucerr = SucData[:,3]
