module Airplane(clk, airplanex);
 
    input clk;
    output reg [9:0] airplanex=60;
	 
	 reg dir=1;
 
    always@(posedge clk)
		begin
			airplanex=airplanex+dir;
			if (airplanex<=10) 
				begin
					airplanex=10;
					dir = dir*-5;
				end
			else if (airplanex>=470) 
				begin
					airplanex=470;
					dir = dir*-5;
				end
			else 
				airplanex=airplanex;          
      end 
endmodule