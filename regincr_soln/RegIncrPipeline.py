#=======================================================================
# RegIncrPipeline.py
#=======================================================================
# Pipelined, multi-stage incrementer using structural composition.

from pymtl      import *
from RegIncrRTL import RegIncrRTL as RegIncr

class RegIncrPipeline( Model ):

  def __init__( s, dtype ):
    s.in_ = InPort ( dtype )
    s.out = OutPort( dtype )

    s.incrs = [RegIncr( dtype ) for _ in range( 2 )]

    s.connect( s.in_, s.incrs[0].in_ )
    #-------------------------------------------------------
    # TASK 2.8: Comment out the Exception and implement the
    #           structural composition below.
    #-------------------------------------------------------
    s.connect( s.incrs[0].out, s.incrs[1].in_ )
    s.connect( s.out, s.incrs[-1].out )


  def line_trace( s ):
    outs = ' '.join( ['{}'.format( x.out ) for x in s.incrs ] )
    return '{} ({}) {}'.format( s.in_, outs, s.out )
