if [expr [molinfo top] != -1] { mol delete all }
mol load graphics "polygon"
set steps 50
set dx [expr 1.0/$steps]
set x 1
set y 0
set z 0
for {set i 0} {$i<$steps} {incr i} {
set y [expr $i*$dx] 
color change rgb [expr $i+100] $x $y $z
}
set x 1
set y 1
set z 0
for {set i $steps} {$i<=2*$steps} {incr i} {
set x [expr 1.0-($i-$steps)*$dx] 
set z [expr ($i-$steps)*$dx] 
color change rgb [expr $i+100] $x $y $z
}
