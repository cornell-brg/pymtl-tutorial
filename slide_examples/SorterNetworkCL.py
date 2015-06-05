#=======================================================================
# SorterNetworkCL
#=======================================================================

import collections

from pymtl import *

#-----------------------------------------------------------------------
# SorterNetworkCL
#-----------------------------------------------------------------------
class SorterNetworkCL( Model ):
  '''Concurrent-structural impl of a unit that sorts a list.'

  This model is parameterizable by the datatype, the number of inputs,
  and the delay of the model.
  '''

  def __init__( s, nbits, nports, delay = 1 ):

    assert delay > 0

    s.in_ = InPort [nports]( nbits )
    s.out = OutPort[nports](nbits)

    s.queue = collections.deque( [[]]*(delay-1) )

    @s.tick_fl
    def logic():
      s.queue.appendleft( [x[:] for x in s.in_] )
      for idx, value in enumerate( sorted(s.queue.pop()) ):
        s.out[idx].next = value

