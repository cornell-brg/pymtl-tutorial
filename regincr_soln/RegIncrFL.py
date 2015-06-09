#=======================================================================
# RegIncrFL.py
#=======================================================================
# Functional model of a registered incrementer.

from pymtl import *

class RegIncrFL( Model ):

  def __init__( s, nbits ):

    s.in_ = InPort ( Bits(nbits) )
    s.out = OutPort( Bits(nbits) )

    @s.tick
    def logic_block():
      s.out.next = s.in_ + 1

  def line_trace( s ):
    return 'in: {} out: {}'.format( s.in_, s.out )

