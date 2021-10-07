`timescale 1ns/1ns

module codedlock_tb;
	reg q;
	reg u;
	reg n;
	reg b;
	reg d;
	reg e;
	reg f;
	//reg realcode;
	
	wire led1;
	wire led2;

	codedlock u1(
				.q(q),
				.u(u),
				.n(n),
				.b(b),
				.d(d),
				.e(e),
				.f(f),
				//.realcode(realcode),
				.led1(led1),
				.led2(led2)
	);
	
	initial begin
		q = 0;u = 0;n = 0;b = 0;d = 0;
		#200;
		q = 0;u = 0;n = 0;b = 1;d = 0;
		#200;
		q = 0;u = 0;n = 1;b = 0;d = 0;
		#200;
		q = 0;u = 0;n = 1;b = 1;d = 0;
		#200;
		q = 0;u = 1;n = 0;b = 0;d = 0;
		#200;
		q = 0;u = 1;n = 0;b = 1;d = 0;
		#200;
		q = 0;u = 1;n = 1;b = 0;d = 0;
		#200;
		q = 0;u = 1;n = 1;b = 1;d = 0;
		#200;
		q = 1;u = 0;n = 0;b = 0;d = 0;
		#200;
		q = 1;u = 0;n = 0;b = 1;d = 0;
		#200;
		q = 1;u = 0;n = 1;b = 0;d = 0;
		#200;
		q = 1;u = 0;n = 1;b = 1;d = 0;
		#200;
		q = 1;u = 1;n = 0;b = 0;d = 0;
		#200;
		q = 1;u = 1;n = 0;b = 1;d = 0;
		#200;
		q = 1;u = 1;n = 1;b = 0;d = 0;
		#200;
		q = 1;u = 1;n = 1;b = 1;d = 0;
		#200;
		
		$stop;
	
	end


endmodule