#!/usr/bin/env python
#=======================================================================
# gcd-sim [options]
#=======================================================================
#
#  -h --help           Display help
#  --impl              {fl,rtl}

import argparse
import random

from pymtl import *

from RegIncrFL  import RegIncrFL
from RegIncrRTL import RegIncrRTL

#-----------------------------------------------------------------------
# parse_cmdline
#-----------------------------------------------------------------------
def parse_cmdline():

  p = argparse.ArgumentParser()

  p.add_argument( '--impl',      default='fl', choices=['fl','rtl'] )
  p.add_argument( '--translate', action='store_true' )
  p.add_argument( '--trace',     action='store_true' )
  p.add_argument( 'ncycles', help='number of cycles to execute for')

  opts = p.parse_args()
  return opts

#-----------------------------------------------------------------------
# main
#-----------------------------------------------------------------------
def main():

  opts = parse_cmdline()

  #---------------------------------------------------------------------
  # TASK 3: Add an entry in model_impl_dict for RegIncrRTL below.
  #---------------------------------------------------------------------

  model_impl_dict = {
    'fl'  : RegIncrFL,
  }

  model = model_impl_dict[ opts.impl ]( 32 )
  if opts.translate:
    model = TranslationTool( model )
  model.elaborate()

  sim = SimulationTool( model )

  for i in range( int(opts.ncycles) ):
    model.in_.value = random.randrange( 2**32 )
    sim.cycle()
    if opts.trace:
      sim.print_line_trace()

  print 'Done! Executed for {} cycles.'.format( sim.ncycles )

if __name__ == '__main__':
  main()
