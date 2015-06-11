#=======================================================================
# RegIncrRTL_test.py
#=======================================================================

import random
import pytest

from pymtl import *

from RegIncrRTL     import RegIncrRTL as RegIncr
from RegIncrFL_test import (
  simple_test_vectors,
  do_random_test,
)

#-----------------------------------------------------------------------
# test_simple
#-----------------------------------------------------------------------
@pytest.mark.parametrize( 'dtype', [8] )
def test_simple( dtype, test_verilog ):

  # instantiate the model and elaborate it

  model = RegIncr( dtype )

  #---------------------------------------------------------------------
  # TASK 2.5: Add verilog translation to the test harness here
  #---------------------------------------------------------------------

  model.elaborate()

  # create the simulator

  sim = SimulationTool( model )

  # verify the model

  print

  for input_vector, expected_out in simple_test_vectors:

    model.in_.value = input_vector

    sim.print_line_trace()
    sim.cycle()

    assert model.out == expected_out

  sim.print_line_trace()

#-----------------------------------------------------------------------
# test_random
#-----------------------------------------------------------------------
@pytest.mark.parametrize( 'dtype', [8] )
def test_random( dtype ):
  do_random_test( RegIncr, dtype )

