
# Ted Obuchowicz
# XDC file for complete CPU

set_property CLOCK_DEDICATED_ROUTE  FALSE [ get_nets clk ] ;

# set the reset to the left most switch

set_property -dict { PACKAGE_PIN V10 IOSTANDARD LVCMOS33 }  [ get_ports { reset }  ] ;

# use the centre pushbutton as the clock

set_property -dict { PACKAGE_PIN N17 IOSTANDARD LVCMOS33 }  [ get_ports { clk }  ] ;


# set pc_out to left hand LEDS 

set_property -dict { PACKAGE_PIN V11   IOSTANDARD LVCMOS33 } [ get_ports { pc_out[3] }  ] ;
set_property -dict { PACKAGE_PIN V12 IOSTANDARD LVCMOS33 }   [ get_ports { pc_out[2] }  ] ;
set_property -dict { PACKAGE_PIN V14 IOSTANDARD LVCMOS33 }   [ get_ports { pc_out[1] }  ] ;
set_property -dict { PACKAGE_PIN V15 IOSTANDARD LVCMOS33 }   [ get_ports { pc_out[0] }  ] ;

# set overflow and zero immediately after pc_out

set_property -dict { PACKAGE_PIN T16 IOSTANDARD LVCMOS33 }   [ get_ports { overflow }  ] ;
set_property -dict { PACKAGE_PIN U14 IOSTANDARD LVCMOS33 }   [ get_ports { zero }  ] ;


# set rs_out and rt_out to the right hand LEDS  with a gap between the two

# rs_out
set_property -dict { PACKAGE_PIN V16 IOSTANDARD LVCMOS33 }   [ get_ports { rs_out[3] }  ] ;
set_property -dict { PACKAGE_PIN U16 IOSTANDARD LVCMOS33 }   [ get_ports { rs_out[2] }  ] ;
set_property -dict { PACKAGE_PIN U17 IOSTANDARD LVCMOS33 }   [ get_ports { rs_out[1] }  ] ;
set_property -dict { PACKAGE_PIN V17 IOSTANDARD LVCMOS33 }   [ get_ports { rs_out[0] }  ] ;

# rt_out
set_property -dict { PACKAGE_PIN N14  IOSTANDARD LVCMOS33 }  [ get_ports { rt_out[3] }  ] ;
set_property -dict { PACKAGE_PIN J13 IOSTANDARD LVCMOS33 }   [ get_ports { rt_out[2] }  ] ;
set_property -dict { PACKAGE_PIN K15 IOSTANDARD LVCMOS33 }   [ get_ports { rt_out[1] }  ] ;
set_property -dict { PACKAGE_PIN H17 IOSTANDARD LVCMOS33 }   [ get_ports { rt_out[0] }  ] ;


