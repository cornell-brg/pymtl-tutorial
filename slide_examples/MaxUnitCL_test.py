#=======================================================================
# MaxUnitCL_test.py
#=======================================================================

import random
import pytest
import collections

from pymtl import *

from MaxUnitCL      import MaxUnitCL
from MaxUnitFL_test import nbits, nports, test_vectors

#-----------------------------------------------------------------------
# test_model
#-----------------------------------------------------------------------
@pytest.mark.parametrize( 'delay', [1, 2, 4] )
def test_model( delay ):

  model = MaxUnitCL( nbits, nports, delay = delay )
  model.elaborate()

  sim = SimulationTool( model )

  results = collections.deque()

  for array, expected_max in test_vectors:
    for i, num in enumerate( array ):
      model.in_[i].value = num
    results.append( expected_max )
    sim.cycle()
    print model.out.uint()
    if sim.ncycles >= delay:
      assert model.out == results.popleft()

  for _ in range( delay - 1 ):
    sim.cycle()
    print model.out.uint()
    assert model.out == results.popleft()

