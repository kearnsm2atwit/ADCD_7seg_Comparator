module lab05(input [3:0]A, B, input C, output [7:0]Z1, Z2, Z3);

	reg [3:0]X;									// Register to use as input for HEX[0]
	sevenseg segone(A, Z1);					// Display input 1 on HEX[4]
	sevenseg segthree(B, Z3);				// Display input 2 on HEX[2]
	sevenseg segtwo(X, Z2);					// Display min/max on HEX[0]
	
	
	always @(A, B, C , X)					// Always block to allow value going to HEX[0] to change
		
		begin						
			if(C == 1'b0 && A > B)			// If the button is pressed and A is the max
				X = A;							// Display A on HEX[0]
			else if (C == 1'b1 && A < B)	// If the button is not pressed and A is the min
				X = A;							// Display A on HEX[0]
			else									// Else statement covers both cases for displaying B
				X = B;							// Display B on HEX[0]
		end										// End always block
		
endmodule
