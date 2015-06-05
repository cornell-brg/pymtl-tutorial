#=======================================================================
# MaxUnitCL
#=======================================================================

import collections

from pymtl import *

#-----------------------------------------------------------------------
# MaxUnitCL
#-----------------------------------------------------------------------
class MaxUnitCL( Model ):
  '''Concurrent-structural impl of a unit that finds the max of a list.

  This model is parameterizable by the datatype, the number of inputs,
  and the delay of the model.
  '''

  def __init__( s, nbits, nports, delay = 1 ):

    assert delay > 0

    s.in_ = InPort [nports]( nbits )
    s.out = OutPort(nbits)

    s.queue = collections.deque( [0]*(delay-1) )

    @s.tick_fl
    def logic():
      s.queue.appendleft( max(s.in_)[:] )
      s.out.next = s.queue.pop()

