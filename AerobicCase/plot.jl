using PyPlot
include("loadData.jl")

#Load simulation results from HCM FBA
t = readdlm("Plots/time.dat")
xBio = readdlm("Plots/xBio.dat")
xAce = readdlm("Plots/xAce.dat")
xGlc = readdlm("Plots/xGlc.dat")

#Load simulation results of removing mode 1 (Major Mode: Aerobic Growth)
xBio_1si = readdlm("Plots/xBio_SI.dat")
xAce_1si = readdlm("Plots/xAce_SI.dat")
xGlc_1si = readdlm("Plots/xGlc_SI.dat")

#Load simulation results of removing all minor modes
xBio_nonsi = readdlm("Plots/xBio_nonSI.dat")
xAce_nonsi = readdlm("Plots/xAce_nonSI.dat")
xGlc_nonsi = readdlm("Plots/xGlc_nonSI.dat")

#Define Font sizes
fsize = 16
tsize = 18

#Define Plot Settings
PyPlot.matplotlib[:rc]("text",usetex=true)
PyCall.PyDict(matplotlib["rcParams"])["font.sans-serif"] = ["Helvetica"]
PyCall.PyDict(matplotlib["rcParams"])["font.size"] = "16"
PyCall.PyDict(matplotlib["rcParams"])["legend.fontsize"] = "small"
PyCall.PyDict(matplotlib["rcParams"])["legend.scatterpoints"] = "1"
PyCall.PyDict(matplotlib["rcParams"])["legend.numpoints"] = "3"
PyCall.PyDict(matplotlib["rcParams"])["lines.linewidth"] = "1.5"

figure(1,figsize=(6,10))
plt[:subplot](312)
a = plt[:plot](t,xGlc,color="black")
c = plt[:plot](t,xGlc_1si,color="black",":",linewidth=2)
b = plt[:plot](t,xGlc_nonsi,color="black","--")
d = plt[:scatter](tGlc,Glc,color="black")
plt[:ylabel]("Glucose (mM)",fontsize = fsize)
plt[:xticks]([0:2:10;],fontsize=tsize)
plt[:yticks]([0:4:12;],fontsize=tsize)
plt[:axis]([0,10.25,0,12.5;]);
errorbar(tGlc,Glc,0.1*Glc,fmt="ko",color="black")

plt[:subplot](311)
plt[:plot](t,xBio,color="black")
plt[:plot](t,xBio_1si,color="black",":",linewidth=2)
plt[:plot](t,xBio_nonsi,color="black","--")
errorbar(tBio,Bio,0.1*Bio,fmt="ko",color="black")
plt[:ylabel]("Biomass (gDW/L)",fontsize = fsize)
plt[:xticks]([0:2:10;],fontsize=tsize)
plt[:yticks]([0:0.5:1;],fontsize=tsize)
plt[:axis]([0,10.25,0,1.0]);
plt[:legend]([a,b,c,d;],["HCM FBA","Minor modes removed","Major mode removed","Data";],bbox_to_anchor=(0.5, 0.98), loc=1, borderaxespad=0.,fontsize = 13,frameon=false)

plt[:subplot](313)
plt[:plot](t,xAce,color="black")
plt[:plot](t,xAce_1si,color="black",":",linewidth=2)
plt[:plot](t,xAce_nonsi,color="black","--")
errorbar(tAce,Ace,0.1*Ace,fmt="ko",color="black")
plt[:ylabel]("Acetate (mM)",fontsize = fsize)
plt[:xlabel]("Time (hr)",fontsize = fsize)
plt[:xticks]([0:2:10;],fontsize=tsize)
plt[:yticks]([0:2:6;],fontsize=tsize)
plt[:axis]([0,10.25,0,6]);
tight_layout()
