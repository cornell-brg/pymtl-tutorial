#=======================================================================
# RegIncrParamPipeline.py
#=======================================================================
# Pipelined, multi-stage incrementer using structural composition.

from pymtl      import *
from RegIncrRTL import RegIncrRTL as RegIncr

class RegIncrParamPipeline( Model ):

  def __init__( s, dtype, nstages ):
    s.in_ = InPort ( dtype )
    s.out = OutPort( dtype )

    s.incrs = [RegIncr( dtype ) for _ in range( nstages )]

    assert len( s.incrs ) > 0

    s.connect( s.in_, s.incrs[ 0].in_ )
    for i in range( nstages - 1 ):
      s.connect( s.incrs[i].out, s.incrs[i+1].in_ )
    s.connect( s.out, s.incrs[-1].out )


  def line_trace( s ):
    outs = ' '.join( ['{}'.format( x.out ) for x in s.incrs ] )
    return '{} ({}) {}'.format( s.in_, outs, s.out )
