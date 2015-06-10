#=======================================================================
# MaxUnitFL
#=======================================================================

from pymtl import *

#-----------------------------------------------------------------------
# max_unit
#-----------------------------------------------------------------------
def max_unit( input_list ):
  'Functional impl of a unit that finds the max value in a list.'
  return max( input_list )

#-----------------------------------------------------------------------
# MaxUnitFL
#-----------------------------------------------------------------------
class MaxUnitFL( Model ):
  '''Concurrent-structural impl of a unit that finds the max of a list.

  This model is parameterizable by the datatype and number of inputs.
  It takes advantage of the special PyMTL-provided Port list creation
  syntax, which is equivalent to the following list comprehension:

    InPort[nports](nbits) == [ InPort(nbits) for _ in range(nports) ]
  '''

  def __init__( s, nbits, nports ):

    s.in_ = InPort [nports]( nbits )
    s.out = OutPort(nbits)

    @s.tick_fl
    def logic():
      s.out.next = max( s.in_ )

  def line_trace( s ):
    inputs = ' '.join( '{}'.format(x) for x in s.in_ )
    return '[{}] () {}'.format( inputs, s.out)

