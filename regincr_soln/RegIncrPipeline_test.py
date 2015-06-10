#=======================================================================
# RegIncrPipeline_test.py
#=======================================================================

import collections
import pytest
import random

from pymtl import *

from RegIncrPipeline import RegIncrPipeline

#-----------------------------------------------------------------------
# gen_simple_test_vectors
#-----------------------------------------------------------------------
def gen_simple_test_vectors( nstages ):

  simple_test_vectors = [
    ( 4,  4 + nstages ),
    ( 6,  6 + nstages ),
    ( 2,  2 + nstages ),
    (15, 15 + nstages ),
    ( 8,  8 + nstages ),
    ( 0,  0 + nstages ),
    (10, 10 + nstages ),
  ]

  return simple_test_vectors

#-----------------------------------------------------------------------
# test_simple
#-----------------------------------------------------------------------
def test_simple( test_verilog, nstages=2 ):

  # instantiate the model and elaborate it

  model = RegIncrPipeline( dtype = 8 )
  if test_verilog:
    model = TranslationTool( model )
  model.elaborate()

  # create the simulator

  sim = SimulationTool( model )

  # verify the model

  print
  results = collections.deque()

  for input_vector, expected_out in gen_simple_test_vectors( nstages ):

    model.in_.value = input_vector
    results.append( expected_out )

    sim.print_line_trace()
    sim.cycle()

    if sim.ncycles >= nstages:
      assert model.out == results.popleft()

  # drain the results queue, verify these too

  while results:
    sim.print_line_trace()
    sim.cycle()
    assert model.out == results.popleft()

  sim.print_line_trace()


