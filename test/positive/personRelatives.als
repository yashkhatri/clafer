open util/integer
pred show {}


abstract sig c1_Person
{ r_c2_age : one c2_age
, r_c6_maritalStatus : one c6_maritalStatus
, r_c41_childs : set c41_childs
, r_c66_parents : set c66_parents }
{ all disj x, y : this.@r_c41_childs | (x.@ref) != (y.@ref)
  #r_c66_parents <= 2
  all disj x, y : this.@r_c66_parents | (x.@ref) != (y.@ref) }

sig c2_age
{ ref : one Int }
{ one @r_c2_age.this
  (this.@ref) >= 0 }

sig c6_maritalStatus
{ r_c7_neverMarried : lone c7_neverMarried
, r_c8_married : lone c8_married
, r_c31_divorced : lone c31_divorced }
{ one @r_c6_maritalStatus.this
  let children = (r_c7_neverMarried + r_c8_married + r_c31_divorced) | one children
  ((some this.@r_c8_married) || (some this.@r_c31_divorced)) => (((this.~@r_c6_maritalStatus).(@r_c2_age.@ref)) >= 5) }

sig c7_neverMarried
{}
{ one @r_c7_neverMarried.this }

sig c8_married
{ r_c9_spouse : one c9_spouse }
{ one @r_c8_married.this
  all disj x, y : this.@r_c9_spouse | (x.@ref) != (y.@ref)
  (this.(@r_c9_spouse.@ref)) != ((this.~@r_c8_married).~@r_c6_maritalStatus) }

sig c9_spouse
{ ref : one c1_Person }
{ one @r_c9_spouse.this
  (((this.(@ref.@r_c6_maritalStatus)).@r_c8_married).(@r_c9_spouse.@ref)) = (((this.~@r_c9_spouse).~@r_c8_married).~@r_c6_maritalStatus) }

sig c31_divorced
{}
{ one @r_c31_divorced.this }

sig c41_childs
{ ref : one c1_Person }
{ one @r_c41_childs.this
  (this.~@r_c41_childs) in (this.(@ref.(@r_c66_parents.@ref)))
  ((((this.~@r_c41_childs).@r_c6_maritalStatus).@r_c8_married).(@r_c9_spouse.@ref)) in (this.(@ref.(@r_c66_parents.@ref)))
  (this.(@ref.(@r_c2_age.@ref))) < ((this.~@r_c41_childs).(@r_c2_age.@ref)) }

sig c66_parents
{ ref : one c1_Person }
{ one @r_c66_parents.this
  (this.~@r_c66_parents) in (this.(@ref.(@r_c41_childs.@ref))) }

lone sig c81_Alice extends c1_Person
{}
{ (this.(@r_c2_age.@ref)) = 6
  (((this.@r_c6_maritalStatus).@r_c8_married).(@r_c9_spouse.@ref)) = c88_Bob }

lone sig c88_Bob extends c1_Person
{}

lone sig c89_Carol extends c1_Person
{}
{ (this.(@r_c2_age.@ref)) = 1 }

