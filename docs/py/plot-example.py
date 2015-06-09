#=========================================================================
# plot-example.py
#=========================================================================
# An example python plotting script.

import matplotlib.pyplot as plt
import math
import sys
import os.path

import numpy as np

#-------------------------------------------------------------------------
# Command line
#-------------------------------------------------------------------------

if len(sys.argv) == 1:
  level = 100
else:
  level = int(sys.argv[1])

#-------------------------------------------------------------------------
# Calculate figure size
#-------------------------------------------------------------------------
# We determine the fig_width_pt by using \showthe\columnwidth in LaTeX
# and copying the result into the script. Change the aspect ratio as
# necessary.

fig_width_pt  = 244.0
inches_per_pt = 1.0/72.27                     # convert pt to inch
aspect_ratio  = ( math.sqrt(5) - 1.0 ) / 2.0  # aesthetic golden mean

fig_width     = fig_width_pt * inches_per_pt  # width in inches
fig_height    = fig_width * aspect_ratio      # height in inches
fig_size      = [ fig_width, fig_height ]

#-------------------------------------------------------------------------
# Configure matplotlib
#-------------------------------------------------------------------------

plt.rcParams['pdf.use14corefonts'] = True
plt.rcParams['font.size']          = 9
plt.rcParams['font.family']        = 'serif'
plt.rcParams['font.serif']         = ['Helvetica']
plt.rcParams['figure.figsize']     = fig_size

#-------------------------------------------------------------------------
# Get data
#-------------------------------------------------------------------------

x = np.arange(1,10)
y = x[::-1]

#-------------------------------------------------------------------------
# Create plot
#-------------------------------------------------------------------------

fig = plt.figure()
ax = fig.add_subplot(1,1,1)

ind   = np.arange(1,10)
width = 0.35

if level >= 0:
  ax.bar( ind,       x, width, linewidth=0.5, color='r' )

if level >= 1:
  ax.bar( ind+width, y, width, linewidth=0.5, color='y' )

ax.set_xlabel('Foo')
ax.set_ylabel('Bar')
ax.set_xlim( 0.75, 9.75 )
ax.set_xticks( np.arange(1,10)+0.35 )
ax.set_xticklabels( np.arange(1,10) )

# Turn off top and right border

ax.spines['right'].set_visible(False)
ax.spines['top'].set_visible(False)
ax.xaxis.set_ticks_position('bottom')
ax.yaxis.set_ticks_position('left')

#-------------------------------------------------------------------------
# Generate PDF
#-------------------------------------------------------------------------

input_basename = os.path.splitext( os.path.basename(sys.argv[0]) )[0]
if level == 100:
  output_filename = input_basename + '.py.pdf'
else:
  output_filename = input_basename + '_' + str(level) + '-split.py.pdf'

plt.savefig( output_filename, bbox_inches='tight' )

