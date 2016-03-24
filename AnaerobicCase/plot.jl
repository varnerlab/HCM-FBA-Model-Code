using PyPlot
using PyCall
include("loadData.jl")

#Load Metabolite Profiles from Kim et al. (2008) Biotechnol. Prog. 24, 993-1006.
tKim = readdlm("kim08plots/t.dat")
BKim = readdlm("kim08plots/xBio.dat")
GKim = readdlm("kim08plots/xGlc.dat")
FKim = readdlm("kim08plots/xFor.dat")
SKim = readdlm("kim08plots/xSuc.dat")
LKim = readdlm("kim08plots/xLac.dat")
EKim = readdlm("kim08plots/xEth.dat")
AKim = readdlm("kim08plots/xAce.dat")

#Load Simulation results from HCM FBA
t = readdlm("Myplots/t.dat")
xBio = readdlm("Myplots/xBio.dat")
xGlc = readdlm("Myplots/xGlc.dat")
xFor = readdlm("Myplots/xFor.dat")
xSuc = readdlm("Myplots/xSuc.dat")
xLac = readdlm("Myplots/xLac.dat")
xEth = readdlm("Myplots/xEth.dat")
xAce = readdlm("Myplots/xAce.dat")

#Define Font sizes
xt = [0:2:8;]
fsize = 20
tsize = 20
asize = 12

PyPlot.matplotlib[:rc]("text",usetex=true)
PyCall.PyDict(matplotlib["rcParams"])["font.sans-serif"] = ["Helvetica"]
PyCall.PyDict(matplotlib["rcParams"])["font.size"] = "20"
PyCall.PyDict(matplotlib["rcParams"])["lines.linewidth"] = "1.5"
PyCall.PyDict(matplotlib["rcParams"])["legend.fontsize"] = "small"
PyCall.PyDict(matplotlib["rcParams"])["legend.scatterpoints"] = "1"

figure(1,figsize=(7.8,6.5))
#Plot Biomass and Lactate
plt[:subplot](221)
a = plt[:plot](t,xBio,color="black")
b = plt[:plot](tKim,BKim,color="black","--")
plt[:errorbar](tBio,Bio,Bioerr,fmt="ko",color="black")
c = scatter(tBio,Bio,color="black")
annotate("Biomass (gDW/L)", xy=[t[70];xBio[70]],xycoords="data",xytext=(-60, 20), textcoords="offset points",arrowprops=Dict("arrowstyle"=>"-"),fontsize=asize)
plt[:plot](t,xLac,color="black")
plt[:plot](tKim,LKim,color="black","--")
errorbar(tLac,Lac,Lacerr,fmt="ko",color="black")
annotate("Lactate (mM)", xy=[t[80];xLac[80]],xycoords="data",xytext=(-60, 20), textcoords="offset points",arrowprops=Dict("arrowstyle"=>"->"),fontsize=asize)
plt[:ylabel]("Abundance",fontsize=fsize)
plt[:xticks](xt,fontsize=tsize)
plt[:yticks]([0:0.5:1.0;],fontsize=tsize)
plt[:axis]([0, 8.55,0,1])
plt[:legend]([a,b,c],["HCM FBA","HCM EM","Data"],bbox_to_anchor=(0.505, 0.99), loc=1, borderaxespad=0.,fontsize=13,frameon=false)

#Plot Glucose and Formate
plt[:subplot](222)
plt[:plot](t,xGlc,color="black")
plt[:plot](tKim,GKim,color="black","--")
plt[:errorbar](tGlc,Glc,Glcerr,fmt="ko",color="black")
annotate("Glucose (mM)", xy=[t[58];xGlc[58]],xycoords="data",xytext=(-10, 20), textcoords="offset points",arrowprops=Dict("arrowstyle"=>"->"),fontsize=asize)
plt[:plot](t,xFor,color="black")
plt[:plot](tKim,FKim,color="black","--")
errorbar(tFor,For,Forerr,fmt="ko",color="black")
annotate("Formate (mM)", xy=[t[60];xFor[60]],xycoords="data",xytext=(-100, 20), textcoords="offset points",arrowprops=Dict("arrowstyle"=>"->"),fontsize=asize)
plt[:yticks]([0:10:30],fontsize=tsize)
plt[:xticks](xt,fontsize=tsize)
plt[:axis]([0, 8.55, 0, 31])
tight_layout()

#Plot Acetate and Succinate
plt[:subplot](223)
plt[:plot](t,xAce,color="black")
plt[:plot](tKim,AKim,color="black","--")
errorbar(tAce,Ace,Aceerr,fmt="ko",color="black")
annotate("Acetate (mM)", xy=[t[60];xAce[60]],xycoords="data",xytext=(-100, 10), textcoords="offset points",arrowprops=Dict("arrowstyle"=>"->"),fontsize=asize)
plt[:plot](t,xSuc,color="black")
plt[:plot](tKim,SKim,color="black","--")
errorbar(tSuc,Suc,Sucerr,fmt="ko",color="black")
annotate("Succinate (mM)", xy=[t[55];xSuc[55]],xycoords="data",xytext=(-30, 30), textcoords="offset points",arrowprops=Dict("arrowstyle"=>"->"),fontsize=asize)
plt[:ylabel]("Abundance",fontsize=fsize)
plt[:xlabel]("Time (hr)",fontsize=fsize)
plt[:xticks](xt,fontsize=tsize)
plt[:yticks]([0:10:25],fontsize=tsize)
plt[:axis]([0,8.55,0,23;])
tight_layout()

#Plot Ethanol
plt[:subplot](224)
plt[:plot](t,xEth,color="black")
plt[:plot](tKim,EKim,color="black","--")
errorbar(tEth,Eth,Etherr,fmt="ko",color="black")
scatter(tEth,Eth,color = "black")
annotate("Ethanol (mM)", xy=[t[40];xEth[40]],xycoords="data",xytext=(-80, 60), textcoords="offset points",arrowprops=Dict("arrowstyle"=>"->"),fontsize=asize)
plt[:xlabel]("Time (hr)",fontsize=fsize)
plt[:xticks](xt,fontsize=tsize)
plt[:yticks]([0:10:25],fontsize=tsize)
plt[:axis]([0,8.55,0,23;])
tight_layout()
