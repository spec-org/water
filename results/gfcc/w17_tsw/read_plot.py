import numpy as np
import sys
import matplotlib.pyplot as plt
import matplotlib as mpl

au2ev = 27.21139

tzvp = np.loadtxt('def2tzvp.dat')
_xmin = -20.5*au2ev
_xmax = -19.5*au2ev

mpl.rcParams['axes.linewidth'] = 2.0
mpl.rcParams['xtick.major.width'] = 2
mpl.rcParams['ytick.major.width'] = 2
plt.rc('font', size=10,weight='bold')
fig = plt.figure()
ax = fig.add_subplot(111)
ax.set_xlim(-550,_xmax)
# ax.set_ylim(-5,_ymax)
# major_yticks = np.arange(0, _ymax+100, _yinter)
ax.set_yticks([])
ax.xaxis.set_ticks_position('both')
ax.yaxis.set_ticks_position('both')
ax.grid(True,which='major', color='k', linestyle='--')
ax.tick_params(direction='in',length=6, width=2)

ax.set_xlabel(r'$\omega$/eV',fontsize=16,fontweight='bold')
ax.set_ylabel(r'$A(\omega)$/eV$^{-1}$',fontsize=16,fontweight='bold')

freq = tzvp[:,0]*au2ev
spec = tzvp[:,1:19] 
ax.plot(freq,spec[:,0],'g-',label='def2-tzvp',markersize=3)
for i in range(1,18):
    ax.fill_between(freq, 0, spec[:,i], facecolor='green', edgecolor='none', alpha=.2, label='_nolegend_')

handles, labels = ax.get_legend_handles_labels()
ax.legend(handles,labels,fontsize=12,loc="upper left",fancybox=True, shadow=True)
plt.tight_layout()

plt.savefig(sys.argv[1],format='pdf', bbox_inches='tight')

plt.draw()
plt.show()
