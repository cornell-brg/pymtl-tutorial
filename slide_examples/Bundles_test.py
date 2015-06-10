from pymtl      import *
from pclib.ifcs import InValRdyBundle, OutValRdyBundle
from pclib.test import TestSrcSinkSim
from Bundles    import BundleExample

def test_BundleExample():

  # need this only because different input/output names

  class BundleHarness( Model ):
    vcd_file = ''  # TestSrcSinkSim needs this defined
    def __init__( s, dtype ):
      s.in_ = InValRdyBundle ( dtype )
      s.out = OutValRdyBundle( dtype )

      s.m   = BundleExample( dtype )

      s.connect( s.in_, s.m.req  )
      s.connect( s.out, s.m.resp )

  model = BundleHarness( 8 )
  sim   = TestSrcSinkSim( model, range(10), range(10), 2, 5 )

  sim.run_test()


