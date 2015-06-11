#=========================================================================
# GcdUnitMsg
#=========================================================================

from pymtl import *

#-------------------------------------------------------------------------
# GcdUnitReqMsg
#-------------------------------------------------------------------------
# BitStruct designed to hold two operands for a GCD operation.

#----------------------------------------------------------
# TASK 3.1: Comment out the Exception below.
#           Implement GcdUnitMsg code shown on the slides.
#----------------------------------------------------------
class GcdUnitReqMsg( BitStructDefinition ):

  def __init__( s ):
    s.a = BitField( 16 )
    s.b = BitField( 16 )

  def __str__( s ):
    return "{}:{}".format( s.a, s.b )


