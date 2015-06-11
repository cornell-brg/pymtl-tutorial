from pymtl      import *
from pclib.ifcs import MemReqMsg

def test_BitStructs():

  class ExampleModel( Model ):
    def __init__( s ):

      # MemReqMsg(addr_nbits, data_nbits) is a BitStruct datatype:
      # +------+-----------+------+-----------+
      # | type | addr      | len  | data      |
      # +------+-----------+------+-----------+
      dtype = MemReqMsg( 32, 32 )
      s.in_ = InPort( dtype )

      @s.tick
      def logic():

        # BitStructs are subclasses of Bits, we can slice them
        addr, data = s.in_[34:66], s.in_[0:32]

        # ... but it's usually more convenient to use fields!
        addr, data = s.in_.addr, s.in_.data

        assert s.in_[34:66] == s.in_.addr
        assert s.in_[ 0:32] == s.in_.data
        print addr, data


  model = ExampleModel()
  model.elaborate()
  sim   = SimulationTool( model )
  model.in_.value = MemReqMsg( 32, 32 ).mk_msg( 1, 8, 2, 5 )
  print
  sim.cycle()
  sim.cycle()
  sim.cycle()

