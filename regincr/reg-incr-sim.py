#!/usr/bin/env python
#=======================================================================
# gcd-sim [options] ncycles
#=======================================================================
#
#  -h --help           Display help.
#  --impl              Select implementation to simulate: {fl,rtl}.
#  --trace             Display line trace.
#  --dump-vcd          Generate a VCD file.
#  --translate         Translate model into Verilog and simulate.

import argparse
import random

random.seed(0xdeadbeef)

from pymtl import *

from RegIncrFL  import RegIncrFL
from RegIncrRTL import RegIncrRTL

#-----------------------------------------------------------------------
# parse_cmdline
#-----------------------------------------------------------------------
def parse_cmdline():

  p = argparse.ArgumentParser()

  p.add_argument( '--impl',      default='rtl', choices=['fl','rtl'],
                                 help='select implementation to simulate')
  p.add_argument( '--trace',     action='store_true',
                                 help='display line trace')
  p.add_argument( '--dump-vcd',  action='store_true',
                                 help='generate a VCD file')
  p.add_argument( '--translate', action='store_true',
                                 help='translate model to verilog and simulate')
  p.add_argument( 'ncycles',     help='number of cycles to execute for')

  opts = p.parse_args()
  return opts

#-----------------------------------------------------------------------
# main
#-----------------------------------------------------------------------
def main():

  opts = parse_cmdline()

  model_impl_dict = {
    'fl'  : RegIncrFL,
    'rtl' : RegIncrRTL,
  }

  model = model_impl_dict[ opts.impl ]( 32 )

  if opts.dump_vcd:
    vcd_name = 'reg-incr-{}-{}.vcd'.format( opts.impl, opts.ncycles )
    model.vcd_file = vcd_name

  if opts.translate:
    assert opts.impl == 'rtl'
    model = TranslationTool( model )

  model.elaborate()

  sim = SimulationTool( model )

  for i in range( int(opts.ncycles) ):
    model.in_.value = random.randrange( 2**32 )
    if opts.trace:
      sim.print_line_trace()
    sim.cycle()

  print 'Done! Executed for {} cycles.'.format( sim.ncycles )

if __name__ == '__main__':
  main()
