open util/integer
pred show {}


abstract sig c1_A
{ r_c2_b : set c2_b }
{ some  b1 : this.@r_c2_b | some b1.@r_c3_c }

sig c2_b
{ r_c3_c : lone c3_c }
{ one @r_c2_b.this }

sig c3_c
{}
{ one @r_c3_c.this }

lone sig c10_a1 extends c1_A
{}

