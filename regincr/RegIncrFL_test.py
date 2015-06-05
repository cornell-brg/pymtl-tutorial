#=======================================================================
# RegIncrFL_test.py
#=======================================================================

import random
import pytest

from pymtl import *

from RegIncrFL import RegIncrFL as RegIncr

#-----------------------------------------------------------------------
# simple_test_vectors
#-----------------------------------------------------------------------

simple_test_vectors = [
  ( 4,  5),
  ( 6,  7),
  ( 2,  3),
  (15, 16),
  ( 8,  9),
  ( 0,  1),
  (10, 11),
]

#-----------------------------------------------------------------------
# test_simple
#-----------------------------------------------------------------------
@pytest.mark.parametrize( 'dtype', [8] )
def test_simple( dtype ):

  # instantiate the model and elaborate it

  model = RegIncr( dtype )
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

#-----------------------------------------------------------------------
# do_random_test
#-----------------------------------------------------------------------
def do_random_test( ModelType, dtype ):

  # elaborate model

  model = ModelType( dtype )
  model.elaborate()

  # create the simulator

  sim = SimulationTool( model )

  # verify the model

  print
  for input_vector, expected_out in gen_test_vectors( dtype ):
    #print input_vector, expected_out
    model.in_.value = input_vector
    sim.print_line_trace()
    sim.cycle()
    assert model.out == expected_out
  sim.print_line_trace()

#-----------------------------------------------------------------------
# gen_test_vectors
#-----------------------------------------------------------------------
def gen_test_vectors( nbits, size=10 ):

  # random.seed( 0x5750 )  # debug!

  vectors = []
  for i in range( size ):
    input_value = Bits( nbits, random.randrange( 2**nbits ) )
    vectors.append( (input_value, input_value + 1) )

  return vectors

