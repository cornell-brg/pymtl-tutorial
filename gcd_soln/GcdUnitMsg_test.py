#=========================================================================
# GcdUnitMsg_test
#=========================================================================
# Test suite for the GCD unit message

from pymtl      import *
from GcdUnitMsg import GcdUnitReqMsg

#-------------------------------------------------------------------------
# test_fields
#-------------------------------------------------------------------------

def test_fields():

  # Create msg

  msg = GcdUnitReqMsg()
  msg.a = 1
  msg.b = 2

  # Verify msg

  assert msg.a == 1
  assert msg.b == 2

#-------------------------------------------------------------------------
# test_str
#-------------------------------------------------------------------------

def test_str():

  # Create msg

  msg = GcdUnitReqMsg()
  msg.a = 0xdead
  msg.b = 0xbeef

  # Verify string

  assert str(msg) == "dead:beef"

