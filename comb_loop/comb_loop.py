from migen import *
from migen.fhdl.verilog import convert


class CombLoop(Module):
    def __init__(self):
        self.clock_domains.cd_sys = ClockDomain('sys', reset_less=True)
        self.a = Signal(reset=1)
        self.b = Signal()
        self.c = Signal()
        self.comb += [
            self.a.eq(~self.cd_sys.clk),
            self.b.eq(self.c),
            If(self.a, [
                self.c.eq(0)
            ]).Else([
                self.c.eq(1)
            ])
        ]


if __name__ == '__main__':
    test = CombLoop()
    convert(test, {test.cd_sys.clk, test.a, test.b, test.c}).write('comb_loop_migen.v')
