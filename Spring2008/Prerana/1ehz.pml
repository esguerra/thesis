load 1ehz.pdb
bg white
hide everything
set label_color, black
#show labels, resi

select ss1, resi 76+75+74+73+72
#set stick_color, grey, ss1
cmd.color("grey60","ss1")

select ss2, resi 65-71+1-7
#set stick_color, purple, ss2
cmd.color("purple","ss2")

select ss3, resi 61-65+49-53
#set stick_color, green, ss3
cmd.color("green","ss3")

select ss4, resi 54-60
#set stick_color, yellow, ss4
cmd.color("yellow","ss4")

select ss5, resi 14-21
#set stick_color, cyan, ss5
cmd.color("cyan","ss5")

select ss6, resi 10-13+22-25
#set stick_color, red, ss6
cmd.color("red","ss6")

select ss7, resi 38-44+26-32
#set stick_color, blue, ss7
cmd.color("blue","ss7")

select ss8, resi 33-37+8+9+45-48
#set stick_color, black, ss8
cmd.color("black","ss8")

load t2.r3d






set_view (\
     0.042999886,   -0.620083392,   -0.783355296,\
    -0.610870659,   -0.636756778,    0.470507175,\
    -0.790562451,    0.458297342,   -0.406170934,\
    -0.000042168,    0.000056863, -220.670730591,\
    59.610282898,   36.405796051,   27.291042328,\
   171.288055420,  270.071655273,    0.000000000 )



show sticks		

ray 800,600
png terstrtRNA.png