from pymtl      import *
from pclib.ifcs import InValRdyBundle, OutValRdyBundle
from pclib.test import TestSrcSinkSim

class ChildModel( Model ):
  def __init__( s, dtype ):
    s.req   = InValRdyBundle ( dtype )
    s.resp  = OutValRdyBundle( dtype )
    s.connect( s.req, s.resp )

class BundleExample( Model ):
  def __init__( s, dtype ):

    s.req   = InValRdyBundle ( dtype )
    s.resp  = OutValRdyBundle( dtype )

    s.child = ChildModel( dtype )

    # connecting bundled request ports individually

    s.connect( s.req.msg, s.child.req.msg )
    s.connect( s.req.val, s.child.req.val )
    s.connect( s.req.rdy, s.child.req.rdy )

    # connecting bundled response ports in bulk

    s.connect( s.resp,    s.child.resp )

