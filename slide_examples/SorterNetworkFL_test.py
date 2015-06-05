#=======================================================================
# SorterNetworkFL_test.py
#=======================================================================

import random

from pymtl import *

from SorterNetworkFL import sorter_network, SorterNetworkFL

#-----------------------------------------------------------------------
# test_vectors
#-----------------------------------------------------------------------

nbits, nports, ncycles = 8, 6, 15

test_vectors  = []

for i in range( ncycles ):
  array = [random.randrange(2**nbits) for _ in range(nports)]
  test_vectors.append( array )

#-----------------------------------------------------------------------
# test_functional
#-----------------------------------------------------------------------
def test_functional():
  for array in test_vectors:
    assert sorter_network( array ) == sorted( array )

#-----------------------------------------------------------------------
# test_model
#-----------------------------------------------------------------------
def test_model():

  model = SorterNetworkFL( nbits = nbits, nports = nports )
  model.elaborate()

  sim = SimulationTool( model )

  for array in test_vectors:
    for i, num in enumerate( array ):
      model.in_[i].value = num
    sim.cycle()
    for i, expected in enumerate( sorted(array) ):
      assert model.out[i] == expected

