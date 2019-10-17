if [expr [molinfo top] != -1] { mol delete all }
mol load graphics "polygon"

graphics top material AOShiny

source color.tcl
source cubes.tcl
set lx 24.14
set ly 24.14
set lz 24.14
#set pax 0.35
#set pay -0.64
#set paz 0.6778
set r1 1.23
set na2 864

set fp [open "path/coord file"]
set m2 [read $fp]
close $fp

set fp [open "path/axes file"]
set m [read $fp]
close $fp

set n 0
for {set i 0} {$i<[llength $m]} {incr i 9} {
set axis($n) [list [lindex $m [expr $i +0]] [lindex $m [expr $i +1]] [lindex $m [expr $i +2]] [lindex $m [expr $i +3]] [lindex $m [expr $i +4]] [lindex $m [expr $i +5]] [lindex $m [expr $i +6]] [lindex $m [expr $i +7]] [lindex $m [expr $i +8]]]
set n [expr $n +1]
}


set n 0
for {set i 10} {$i<[llength $m2]} {incr i 3} {
set cord($n) [list [lindex $m2 [expr $i +1]] [lindex $m2 [expr $i +2]] [lindex $m2 [expr $i +3]]]
set n [expr $n +1]
}

set min 0
set max 1.0
graphics top color silver
for {set ii 0} {$ii<[expr $n-1]} {incr ii} {
#graphics top color $c
if {$ii<$na2} { 
graphics top color silver
hex $cord($ii) $axis($ii)

} else {
 
graphics top color red
draw sphere $cord($ii) radius $r1 resolution 30 
} 
#if {[lindex $cord($ii) 1]>5 & [lindex $cord($ii) 2]>10} {} 

#if {[lindex $cord($ii) 0]<0} { 
#hex [lreplace $cord($ii) 0 0 [expr [lindex $cord($ii) 0] + $lx]] $axis($ii)
#hex [lreplace $cord($ii) 1 1 [expr [lindex $cord($ii) 1] + $ly]] $axis($ii)
#hex [lreplace $cord($ii) 2 2 [expr [lindex $cord($ii) 2] + $lz]] $axis($ii)
#}
}
