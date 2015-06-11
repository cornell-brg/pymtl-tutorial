#=======================================================================
# RegIncrRTL.py
#=======================================================================
# RTL model of a registered incrementer.

from pymtl import *

class RegIncrRTL( Model ):

  def __init__( s, dtype ):
    s.in_  = InPort ( dtype )
    s.out  = OutPort( dtype )
    s.tmp  = Wire   ( dtype )  #
                               #
    @s.tick_rtl                #
    def seq_logic():           # add these lines
      s.tmp.next = s.in_       # to implement the
                               # registered
    @s.combinational           # incrementer
    def comb_logic():          # behavior
      s.out.value = s.tmp + 1  #

  def line_trace( s ):
    return '{} ({}) {}'.format( s.in_, s.tmp, s.out )
