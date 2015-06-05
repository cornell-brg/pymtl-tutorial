#=======================================================================
# RegIncrRTLsoln.py
#=======================================================================
# RTL model of a registered incrementer.

from pymtl import *

class RegIncrRTL( Model ):

  def __init__( s, nbits ):

    s.in_ = InPort ( nbits )
    s.out = OutPort( nbits )

    s.reg_out = Wire( nbits )

    @s.tick_rtl
    def seq_logic():
      s.reg_out.next = s.in_

    @s.combinational
    def comb_logic():
      s.out.value = s.reg_out + 1

  def line_trace( s ):
    return '{} ({}) {}'.format( s.in_, s.reg_out, s.out )
