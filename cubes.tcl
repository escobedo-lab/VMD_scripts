proc hex {cord axis} {
set t [expr sqrt(3)]
set tx [lindex $cord 0]
set ty [lindex $cord 1]
set tz [lindex $cord 2]
set ux [lindex $axis 0]
set uy [lindex $axis 1]
set uz [lindex $axis 2]
set vx [lindex $axis 3]
set vy [lindex $axis 4]
set vz [lindex $axis 5]
set wx [lindex $axis 6]
set wy [lindex $axis 7]
set wz [lindex $axis 8]

set mol [molinfo top]

#set ht [expr $ht/2]

lappend p [list 1 1 1 ]
lappend p [list 1 1 -1 ]
lappend p [list 1 -1 -1 ]
lappend p [list 1 -1 1 ]
lappend p [list -1 -1 -1 ]
lappend p [list -1 -1 1 ]
lappend p [list -1 1 1 ]
lappend p [list -1 1 -1 ] 
 
 
 
for {set i 0} {$i<[llength $p]} {incr i} {
set xx [lindex [lindex $p $i] 0]
set yy [lindex [lindex $p $i] 1]
set zz [lindex [lindex $p $i] 2]

#set nx [expr $ux*$xx + $vx*$yy - $wx*$zz + $tx]
#set ny [expr $uy*$xx + $vy*$yy - $wy*$zz + $ty]
#set nz [expr -$uz*$xx - $vz*$yy + $wz*$zz - $tz]


#Left Handed
#set nx [expr $ux*$xx + $uy*$yy - $uz*$zz + $tx]
#set ny [expr $vx*$xx + $vy*$yy - $vz*$zz + $ty]
#set nz [expr -$wx*$xx - $wy*$yy + $wz*$zz - $tz]
#Right handed
set nx [expr $ux*$xx + $vx*$yy + $wx*$zz + $tx]
set ny [expr $uy*$xx + $vy*$yy + $wy*$zz + $ty]
set nz [expr $uz*$xx + $vz*$yy + $wz*$zz + $tz]
set p [lreplace $p $i $i [list $nx $ny $nz]]
}
graphics $mol triangle [lindex $p 4 ] [lindex $p 7] [lindex $p 2 ]
graphics $mol triangle [lindex $p 5 ] [lindex $p 4] [lindex $p 2 ]
graphics $mol triangle [lindex $p 5 ] [lindex $p 7] [lindex $p 4 ]
graphics $mol triangle [lindex $p 6 ] [lindex $p 7] [lindex $p 5 ]
graphics $mol triangle [lindex $p 3 ] [lindex $p 5] [lindex $p 2 ]
graphics $mol triangle [lindex $p 6 ] [lindex $p 5] [lindex $p 3 ]
graphics $mol triangle [lindex $p 1 ] [lindex $p 3] [lindex $p 2 ]
graphics $mol triangle [lindex $p 7 ] [lindex $p 1] [lindex $p 2 ]
graphics $mol triangle [lindex $p 6 ] [lindex $p 1] [lindex $p 7 ]
graphics $mol triangle [lindex $p 0 ] [lindex $p 3] [lindex $p 1 ]
graphics $mol triangle [lindex $p 6 ] [lindex $p 0] [lindex $p 1 ]
graphics $mol triangle [lindex $p 6 ] [lindex $p 3] [lindex $p 0 ]



unset p
}
