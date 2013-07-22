open util/integer
pred show {}


abstract sig c1_Entity
{ r_c2_type : one c2_type }

sig c2_type
{ ref : one Int }
{ one @r_c2_type.this }

lone sig c3_E1 extends c1_Entity
{}
{ (this.(@r_c2_type.@ref)) = 0 }

lone sig c7_E2 extends c1_Entity
{}
{ (this.(@r_c2_type.@ref)) = 0 }

lone sig c11_E3 extends c1_Entity
{}
{ (this.(@r_c2_type.@ref)) = 0 }

sig c15_E1TEntities
{ ref : one c1_Entity }
{ (c1_Entity.(@r_c2_type.@ref)) = 0 }

fact { all disj x, y : c15_E1TEntities | (x.@ref) != (y.@ref) }
fact { (#c15_E1TEntities) = 3 }
