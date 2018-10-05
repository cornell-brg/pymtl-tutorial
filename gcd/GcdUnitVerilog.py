#=========================================================================
# GCD Unit Verilog Import
#=========================================================================

from pymtl       import *
from pclib.ifcs  import InValRdyBundle, OutValRdyBundle

from GcdUnitMsg  import GcdUnitReqMsg

class GcdUnitVerilog( VerilogModel ):

  # Constructor

  def __init__( s ):

    #---------------------------------------------------------------------
    # TASK 3.8: Instantiating PyMTL port bundles and set them to track
    #           the value of Verilog input/output ports.
    #---------------------------------------------------------------------

    raise NotImplementedError(
      'GcdUnitVerilog has not been implemented yet!\n '
      'Put your implementation code here!'
    )
