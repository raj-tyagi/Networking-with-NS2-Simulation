#Create a simulatr object
set ns [new Simulator]
#Open the nam trace file
set nf [open out.tr w]
$ns trace-all $nf
set namfile [open outnam.nam w]
$ns namtrace-all $namfile
#Define a 'finish' procedure
proc finish {} {
global ns nf namfile
$ns flush-trace
#Close the trace file
close $namfile
close $nf
#Execute nam on the trace file
exec nam outnam.nam &
exit 0
}
#Create two nodes
set n0 [$ns node]
set n1 [$ns node]
#Create a duplex link between the nodes
$ns duplex-link $n0 $n1 1Mb 10ms DropTail
#Call the finish procedure after 5 seconds of simulation time
$ns at 5.0 "finish"
#Run the simulation
$ns run
