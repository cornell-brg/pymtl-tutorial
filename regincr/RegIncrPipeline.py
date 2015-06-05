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

    assert len( s.incrs ) > 0

    #-------------------------------------------------------------------
    # TASK 6: Comment out the Exception and implement the
    #         structural composition below.
    #-------------------------------------------------------------------
    #
    # - create a list of RegIncr
    # - connect s.in_ to the first RegIncr in list
    # - connect s.out to the last  RegIncr in list
    # - create connections between RegIncrs
    #
    # Hint: here's a tip for easily connecting the output:
    #
    #   s.connect( s.out, s.incrs[-1].out)

    raise NotImplementedError(
      'RegIncrPipeline has not been implemented yet!\n '
      'Put your implementation code here!'
    )

    #-------------------------------------------------------------------
    # TASK 7: Make the above module parameterizable by num stages!
    #-------------------------------------------------------------------


  def line_trace( s ):
    outs = ' '.join( ['{}'.format( x.out ) for x in s.incrs ] )
    return '{} ({}) {}'.format( s.in_, outs, s.out )
