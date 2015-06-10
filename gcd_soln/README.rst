==========================================================================
GCD Section
==========================================================================

 - Intro slides to this section already goes through FL, CL, RTL modeling?

Start with slide on BitStructs (will we cover BitStructs in PyMTL
mechanics section?). Explain that we want to implement a GcdUnitReqMsg
type with two fields containing the two operands for a GCD operation.

* Task 1. Implement and test BitStruct for GCD request messages.

We give them what is shown in GcdUnitMsg.py. Slide shows them the code to
add to implement a BitStruct and then how to run unit test.

  % vi ../gcd/GcdUnitReqMsg.py

  class GcdUnitReqMsg( BitStructDefinition ):

    def __init__( s ):
      s.a = BitField(16)
      s.b = BitField(16)

    def __str__( s ):
      return "{}:{}".format( s.a, s.b )

  % py.test ../gcd/GcdUnitReqMsg_test.py

Now a slide on port bundles? Show the code for the ValRdyBundle on the
slide? (i.e., the code in pclib/ifcs/ValRdyBundle) Do we want a task
here?

Maybe a slide or two to explain what FL adapters are and how to use them?
Show them FL "cloud diagram" from Figure 39 of the ECE 5745 tutorial?

* Task 2. Implement GCD unit FL model.

We give them what is currently in GcdUnitFL.py, and then need to
implement the code in the s.tick_fl concurrent block. Slide shows them
the code to add to implement FL model:

  % cd ~/pymtl-tutorial/build
  % vi ../gcd/GcdUnitFL.py

  @s.tick_fl
  def block():

    # Use adapter to pop value from request queue
    req_msg = s.req_q.popleft()

    # Use gcd function from Python's standard library
    result = gcd( req_msg.a, req_msg.b )

    # Use adapter to append result to response queue
    s.resp_q.append( result )

Show them slide of src/gcd/sink. Figure 43 from ECE 5745 tutorial? Also
have a slide to explain the line trace? Figure 44 from ECe 5745 tutorial?

* Task 3. Latency insensitive testing of GCD unit FL model.

We give them what is currently in GcdUnitFL_simple_test.py. Slide shows
them how to instantiate the test source, gcd, the test sink, and connect
them together. Then they run the simple test.

  % vi ../gcd/GcdUnitFL_simple_test.py

  class TestHarness (Model):

    def __init__( s, src_msgs, sink_msgs ):

      # Instantiate models

      s.src  = TestSource ( GcdUnitReqMsg(), src_msgs )
      s.gcd  = GcdUnitFL  ()
      s.sink = TestSink   ( Bits(16), sink_msgs )

      # Connect

      s.connect( s.src.out,  s.gcd.req  )
      s.connect( s.gcd.resp, s.sink.in_ )

  % py.test ../gcd/GcdUnitFL_simple_test.py -sv

We also direct them to look at GcdUnitFL_test.py to see how to write more
parameterized tests, and then have them run these?

  % py.test ../gcd/GcdUnitFL_test.py
  % py.test ../gcd/GcdUnitFL_test.py -k basic_0x0 -sv
  % py.test ../gcd/GcdUnitFL_test.py -k random_3x9 -sv

Now we transition to CL modeling. Show them CL "cloud diagram". Figure 45
in ECE 5745 tutorial.

* Task 4. Implement and test GCD unit CL model.

We give them what is currently in GcdUnitCL.py. Slide asks them first to
run the test and verify that each GCD transaction is taking a fixed two
cycles. Then instruct them to edit the current helper function so that it
keeps track of the number of iterations of the while loop and returns a
tuple with the result of the GCD along with the number of iterations.
Should we show them the code?

  % py.test ../gcd/GcdUnitCL_test.py
  % py.test ../gcd/GcdUnitCL_test.py -k basic_0x0 -sv
  % vi ../gcd/GcdUnitCL.py

  def gcd( a, b ):

    ncycles = 0
    while True:
      ncycles += 1
      if a < b:
        a,b = b,a
      elif b != 0:
        a = a - b
      else:
        return (a,ncycles)

  % py.test ../gcd/GcdUnitCL_test.py -k basic_0x0 -sv

Make sure we emphasize how we can reuse the same unit tests from the FL
model!

Now we transition to RTL modeling. Show them RTL dpath and FSM (Figures
50 and 51 from ECE 5745 tutorial). We should show some of the dpath/ctrl
on the slide? or direct them to look at it?

* Task 5. Implement and test GCD unit RTL model.

We give them what is currently in GcdUnitRTL.py. There is a bug in this
code, that they are supposed to fix. The bug is that the FSM transitions
out of the CALC state whenever a < b, instead of when (a >= b and b == 0)
First they run the tests, see it fail, then they are supposed to fix one
of the state transitions. We show them how to change the state transition
logic.

  % py.test ../gcd/GcdUnitRTL_test.py
  % vi ../gcd/GcdUnitRTL.py

      if ( curr_state == s.STATE_CALC ):
        if ( not s.is_a_lt_b and s.is_b_zero ):
          next_state = s.STATE_DONE

  % py.test ../gcd/GcdUnitRTL_test.py

* Task 6. Experiment with GCD unit.

Show them how to use --test-verilog. Instruct them to look at the
generated Verilog.

  % py.test ../gcd/GcdUnitRTL_test.py --test-verilog
  % vi GcdUnitRTL_0x791afe0d4d8c.v

  % ../gcd/gcd-sim --stats --impl cl  --input random
  % ../gcd/gcd-sim --stats --impl rtl --input random

Notice that since our GCD unit CL model is a cycle-approximate model, the
total number of cycles for the two models do not match exactly. You can
generate the Verilog and waveforms to drive an FPGA or ASIC toolflow
using the simulator like this:

  % ../gcd/gcd-sim --impl rtl --input random --translate --dump-vcd
  % ../gcd/gcd-sim --impl rtl --input small  --translate --dump-vcd
  % ../gcd/gcd-sim --impl rtl --input zeros  --translate --dump-vcd

