open util/integer
pred show {}


abstract sig c1_Measurable
{ r_c2_performance : one c2_performance }

sig c2_performance
{ ref : one Int }
{ one @r_c2_performance.this }

lone sig c3_D extends c1_Measurable
{}

lone sig c4_C extends c1_Measurable
{}

fact { (c4_C.(@r_c2_performance.@ref)) = (-1.mul[(c3_D.(@r_c2_performance.@ref))]) }
