#=========================================================================
# GCD Unit Verilog Import
#=========================================================================

from pymtl       import *
from pclib.ifcs  import InValRdyBundle, OutValRdyBundle

from GcdUnitMsg  import GcdUnitReqMsg

class GcdUnitVerilog( VerilogModel ):

  def __init__( s ):

    # Interface

    s.req   = InValRdyBundle  ( GcdUnitReqMsg() )
    s.resp  = OutValRdyBundle ( Bits(16)        )

    # Verilog ports

    s.set_ports({
      'clk'         : s.clk,
      'reset'       : s.reset,
      'req_val'     : s.req.val,
      'req_rdy'     : s.req.rdy,
      'req_msg'     : s.req.msg,
      'resp_val'    : s.resp.val,
      'resp_rdy'    : s.resp.rdy,
      'resp_msg'    : s.resp.msg,
    })
