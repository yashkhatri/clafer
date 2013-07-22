open util/integer
pred show {}


abstract sig c1_options
{ r_c2_size : one c2_size
, r_c5_cache : lone c5_cache }
{ ((some (this.@r_c2_size).@r_c3_small) && (some this.@r_c5_cache)) => (some ((this.@r_c5_cache).@r_c6_size).@r_c7_fixed) }

sig c2_size
{ r_c3_small : lone c3_small
, r_c4_large : lone c4_large }
{ one @r_c2_size.this
  let children = (r_c3_small + r_c4_large) | one children }

sig c3_small
{}
{ one @r_c3_small.this }

sig c4_large
{}
{ one @r_c4_large.this }

sig c5_cache
{ r_c6_size : one c6_size }
{ one @r_c5_cache.this }

sig c6_size
{ ref : one Int
, r_c7_fixed : lone c7_fixed }
{ one @r_c6_size.this }

sig c7_fixed
{}
{ one @r_c7_fixed.this }

abstract sig c16_comp
{ r_c17_version : one c17_version }
{ (this.(@r_c17_version.@ref)) = (1.add[2]) }

sig c17_version
{ ref : one Int }
{ one @r_c17_version.this }

abstract sig c23_ECU extends c16_comp
{}

abstract sig c24_display extends c16_comp
{ r_c25_server : one c25_server
, r_c35_options : one c35_options }
{ all disj x, y : this.@r_c25_server | (x.@ref) != (y.@ref)
  (this.(@r_c17_version.@ref)) >= ((this.@r_c25_server).(@ref.(@r_c17_version.@ref))) }

sig c25_server
{ ref : one c23_ECU }
{ one @r_c25_server.this }

sig c35_options extends c1_options
{}
{ one @r_c35_options.this }

abstract sig c43_plaECU extends c23_ECU
{ r_c44_display : set c44_display }
{ 1 <= #r_c44_display and #r_c44_display <= 2 }

sig c44_display extends c24_display
{}
{ one @r_c44_display.this
  ((this.(@r_c25_server.@ref)) = (this.~@r_c44_display)) && (no (this.@r_c35_options).@r_c5_cache) }

lone sig c53_ECU1 extends c43_plaECU
{}

lone sig c54_ECU2 extends c43_plaECU
{ r_c55_master : one c55_master }
{ all disj x, y : this.@r_c55_master | (x.@ref) != (y.@ref) }

lone sig c55_master
{ ref : one c53_ECU1 }
{ one r_c55_master }

lone sig c65_telematicsSystem
{ r_c66_channel : one c66_channel
, r_c69_extraDisplay : lone c69_extraDisplay
, r_c70_size : one c70_size }
{ (((((some (this.@r_c66_channel).@r_c68_dual) <=> (some c54_ECU2)) && ((some this.@r_c69_extraDisplay) <=> ((#(c53_ECU1.@r_c44_display)) = 2))) && ((some this.@r_c69_extraDisplay) <=> ((some c54_ECU2) => ((#(c54_ECU2.@r_c44_display)) = 2)))) && ((some (this.@r_c70_size).@r_c72_large) <=> (no (((c43_plaECU.@r_c44_display).@r_c35_options).@r_c2_size).@r_c3_small))) && ((some (this.@r_c70_size).@r_c71_small) <=> (no (((c43_plaECU.@r_c44_display).@r_c35_options).@r_c2_size).@r_c4_large)) }

lone sig c66_channel
{ r_c67_single : lone c67_single
, r_c68_dual : lone c68_dual }
{ one r_c66_channel
  let children = (r_c67_single + r_c68_dual) | one children }

lone sig c67_single
{}
{ one r_c67_single }

lone sig c68_dual
{}
{ one r_c68_dual }

lone sig c69_extraDisplay
{}
{ one r_c69_extraDisplay }

lone sig c70_size
{ r_c71_small : lone c71_small
, r_c72_large : lone c72_large }
{ one r_c70_size
  let children = (r_c71_small + r_c72_large) | one children }

lone sig c71_small
{}
{ one r_c71_small }

lone sig c72_large
{}
{ one r_c72_large }

fact { ((some (c65_telematicsSystem.@r_c66_channel).@r_c68_dual) && (some c65_telematicsSystem.@r_c69_extraDisplay)) && (some (c65_telematicsSystem.@r_c70_size).@r_c72_large) }
