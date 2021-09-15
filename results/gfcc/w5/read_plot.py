import numpy as np
import sys
import matplotlib.pyplot as plt
import matplotlib as mpl

au2ev = 27.21139

dz = np.loadtxt('ccpvdz.dat')
tz = np.loadtxt('ccpvtz.dat')
qz = np.loadtxt('ccpvqz.dat')
svp = np.loadtxt('def2svp.dat')
tzvp = np.loadtxt('def2tzvp.dat')
_xmin = -20.5*au2ev
_xmax = -19.5*au2ev

p = np.zeros((3,5))
order = np.array([2,3,4])

m = 0

for j in range(2,7):
    for i in range(1,dz.shape[0]-1):
        if dz[i,j] > dz[i-1,j] and dz[i,j] > dz[i+1,j]:
            p[0,m] = dz[i,0]
            m += 1
            break

m = 0
for j in range(2,7):
    for i in range(1,tz.shape[0]-1):
        if tz[i,j] > tz[i-1,j] and tz[i,j] > tz[i+1,j]:
            p[1,m] = tz[i,0]
            m += 1

m = 0
for j in range(2,7):
    for i in range(1,qz.shape[0]-1):
        if qz[i,j] > qz[i-1,j] and qz[i,j] > qz[i+1,j]:
            p[2,m] = qz[i,0]
            m += 1

num = p[2,4] - p[1,4]
den = p[1,4] - p[0,4]
B = num/den
A = den/(B**3-B**2)
print(A,B)
CBS = qz[:,0] - A*(B**4)

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

# freq = tzvp[:,0]*au2ev
# spec = tzvp[:,1] + 200
# ax.plot(freq,spec,'m-',label='def2-tzvp',markersize=3)
# freq = svp[:,0]*au2ev
# spec = svp[:,1] + 150
# ax.plot(freq,spec,'c-',label='def2-svp',markersize=3)

freq = qz[:,0]*au2ev
spec = qz[:,1:7] + 400
ax.plot(freq,spec[:,0],'g-',label='cc-pVQZ',markersize=3)
for i in range(1,6):
    ax.fill_between(freq, 400, spec[:,i], facecolor='green', edgecolor='none', alpha=.2, label='_nolegend_')

freq = tz[:,0]*au2ev
spec = tz[:,1:7] + 200
ax.plot(freq,spec[:,0],'b-',label='cc-pVTZ',markersize=3)
for i in range(1,6):
    ax.fill_between(freq, 200, spec[:,i], facecolor='blue', edgecolor='none', alpha=.2, label='_nolegend_')

freq = dz[:,0]*au2ev
spec = dz[:,1:7]
ax.plot(freq,spec[:,0],'k-',label='cc-pVDZ',markersize=3)
for i in range(1,6):
    ax.fill_between(freq, 0, spec[:,i], facecolor='black', edgecolor='none', alpha=.2, label='_nolegend_')

spec = qz[:,1:] + 600
ax.plot(CBS*au2ev,spec[:,0],'r-',label='CBS',markersize=3)
for i in range(1,6):
    ax.fill_between(CBS*au2ev, 600, spec[:,i], facecolor='red', edgecolor='none', alpha=.2, label='_nolegend_')


handles, labels = ax.get_legend_handles_labels()
ax.legend(handles,labels,fontsize=12,loc="upper left",fancybox=True, shadow=True)
plt.tight_layout()

plt.savefig(sys.argv[1],format='pdf', bbox_inches='tight')

plt.draw()
plt.show()
