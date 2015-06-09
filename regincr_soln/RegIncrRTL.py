#=======================================================================
# RegIncrRTL.py
#=======================================================================
# RTL model of a registered incrementer.

from pymtl import *

class RegIncrRTL( Model ):

  def __init__( s, dtype ):

      s.in_  = InPort ( dtype )
      s.out  = OutPort( dtype )
      s.tmp  = Wire   ( dtype )

      @s.tick_rtl
      def seq_logic():
        s.tmp.next = s.in_

      @s.combinational
      def comb_logic():
        s.out.value = s.tmp + 1

  def line_trace( s ):
    return '{} ({}) {}'.format( s.in_, s.tmp, s.out )
