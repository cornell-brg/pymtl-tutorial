#=========================================================================
# GcdUnitFL_test
#=========================================================================

import pytest
import random

from copy       import deepcopy
from fractions  import gcd

from pymtl      import *
from pclib.test import mk_test_case_table, run_sim
from pclib.test import TestSource, TestSink

from GcdUnitFL  import GcdUnitFL
from GcdUnitMsg import GcdUnitReqMsg

#-------------------------------------------------------------------------
# TestHarness
#-------------------------------------------------------------------------

class TestHarness (Model):

  def __init__( s, src_msgs, sink_msgs ):

    s.src  = TestSource (GcdUnitReqMsg(), src_msgs)
    s.gcd  = GcdUnitFL  ()
    s.sink = TestSink   (Bits(16), sink_msgs)

    s.connect( s.src.out,  s.gcd.req  )
    s.connect( s.gcd.resp, s.sink.in_ )

  def done( s ):
    return s.src.done and s.sink.done

  def line_trace( s ):
    return s.src.line_trace()  + " > " + \
           s.gcd.line_trace()  + " > " + \
           s.sink.line_trace()

#-------------------------------------------------------------------------
# mk_req_msg
#-------------------------------------------------------------------------

def mk_req_msg( a, b ):
  msg = GcdUnitReqMsg()
  msg.a = a
  msg.b = b
  return msg

#-------------------------------------------------------------------------
# test
#-------------------------------------------------------------------------

def test():

  # Create list of request messages and reference response values

  msgs = [
    mk_req_msg( 15, 5  ), 5,
    mk_req_msg( 3,  9  ), 3,
    mk_req_msg( 27, 15 ), 3,
    mk_req_msg( 21, 49 ), 7,
  ]

  # Setup the model

  model = TestHarness( msgs[::2], msgs[1::2] )
  model.elaborate()

  # Create a simulator

  sim = SimulationTool( model )

  # Reset model

  sim.reset()
  print()

  # Run simulation

  while not model.done():
    sim.print_line_trace()
    sim.cycle()

  # Extra ticks to make VCD easier to read

  sim.cycle()
  sim.cycle()
  sim.cycle()

