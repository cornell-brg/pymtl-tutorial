#=======================================================================
# MaxUnitFL_test.py
#=======================================================================

import random

from pymtl import *

from MaxUnitFL import max_unit, MaxUnitFL

#-----------------------------------------------------------------------
# test_vectors
#-----------------------------------------------------------------------

nbits, nports, ncycles = 8, 6, 15

test_vectors  = []

for i in range( ncycles ):
  array = [random.randrange(2**nbits) for _ in range(nports)]
  max_  = sorted(array)[-1]
  test_vectors.append( (array, max_) )

#-----------------------------------------------------------------------
# test_functional
#-----------------------------------------------------------------------
def test_functional():
  for array, expected_max in test_vectors:
    assert max_unit( array ) == expected_max
    print expected_max

#-----------------------------------------------------------------------
# test_model
#-----------------------------------------------------------------------
def test_model():

  model = MaxUnitFL( nbits = nbits, nports = nports )
  model.elaborate()

  sim = SimulationTool( model )

  for array, expected_max in test_vectors:
    for i, num in enumerate( array ):
      model.in_[i].value = num
    sim.cycle()
    print model.out.uint()
    assert model.out == expected_max

