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

  print
  msg = GcdUnitReqMsg()
  print msg
  msg.a = 1
  print msg
  msg.b = 2
  print msg

  # Verify msg

  assert msg.a == 1
  assert msg.b == 2

#-------------------------------------------------------------------------
# test_str
#-------------------------------------------------------------------------

def test_str():

  # Create msg

  print
  msg = GcdUnitReqMsg()
  print msg
  msg.a = 0xdead
  print msg
  msg.b = 0xbeef
  print msg

  # Verify string

  assert str(msg) == "dead:beef"

