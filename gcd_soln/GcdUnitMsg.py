#=========================================================================
# GcdUnitMsg
#=========================================================================

from pymtl import *

#-------------------------------------------------------------------------
# GcdUnitReqMsg
#-------------------------------------------------------------------------
# BitStruct designed to hold two operands for a GCD operation.

class GcdUnitReqMsg( BitStructDefinition ):

  def __init__( s ):
    s.a = BitField( 16 )
    s.b = BitField( 16 )

  def __str__( s ):
    return "{}:{}".format( s.a, s.b )


