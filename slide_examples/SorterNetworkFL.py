#=======================================================================
# SorterNetworkFL
#=======================================================================

from pymtl import *

#-----------------------------------------------------------------------
# sorter_network
#-----------------------------------------------------------------------
def sorter_network( input_list ):
  'Functional impl of a unit that sorts a list.'
  return sorted( input_list )

#-----------------------------------------------------------------------
# SorterNetworkFL
#-----------------------------------------------------------------------
class SorterNetworkFL( Model ):
  '''Concurrent-structural impl of a unit that sorts a list.'

  This model is parameterizable by the datatype and number of inputs.
  It takes advantage of the special PyMTL-provided Port list creation
  syntax, which is equivalent to the following list comprehension:

    InPort[nports](nbits) == [ InPort(nbits) for _ in range(nports) ]
  '''

  def __init__( s, nbits, nports ):

    s.in_ = InPort [nports]( nbits )
    s.out = OutPort[nports](nbits)

    @s.tick_fl
    def logic():
      for idx, value in enumerate( sorted( s.in_ ) ):
        s.out[idx].next = value

