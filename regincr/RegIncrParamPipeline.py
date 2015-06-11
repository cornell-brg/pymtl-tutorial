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

    s.connect( s.in_, s.incrs[0].in_ )
    for i in range( nstages - 1 ): pass
    #-------------------------------------------------------
    # TASK 2.9: Comment out the Exception and implement the
    #           structural composition above.
    #-------------------------------------------------------
    #
    # - create connections between RegIncrs
    # - connect s.out to the last RegIncr in list
    #
    # Hint: here's a tip for easily indexing the last item in the list:
    #
    #   s.connect( s.out, s.incrs[-1].out)

    raise NotImplementedError(
      'RegIncrPipeline has not been implemented yet!\n '
      'Put your implementation code here!'
    )

  def line_trace( s ):
    outs = ' '.join( ['{}'.format( x.out ) for x in s.incrs ] )
    return '{} ({}) {}'.format( s.in_, outs, s.out )
