#=======================================================================
# SorterNetworkCL_test.py
#=======================================================================

import random
import pytest
import collections

from pymtl import *

from SorterNetworkCL      import SorterNetworkCL
from SorterNetworkFL_test import nbits, nports, test_vectors

#-----------------------------------------------------------------------
# test_model
#-----------------------------------------------------------------------
@pytest.mark.parametrize( 'delay', [1, 2, 4] )
def test_model( delay ):

  model = SorterNetworkCL( nbits, nports, delay = delay )
  model.elaborate()

  sim = SimulationTool( model )

  results = collections.deque()

  for array in test_vectors:
    for i, num in enumerate( array ):
      model.in_[i].value = num
    results.append( array )
    sim.cycle()
    if sim.ncycles >= delay:
      assert model.out == sorted( results.popleft() )

  for _ in range( delay - 1 ):
    sim.cycle()
    assert model.out == sorted( results.popleft() )

