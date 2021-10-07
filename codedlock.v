module codedlock(

	input wire q,u,n,b,//密码锁
	input wire d,//开关
	
	input wire e,//进入修改密码状态
	input wire f,//修改密码确定键
	
	output wire led1,//红灯
	output wire led2 //绿灯
	
	);
	
	wire [3:0] code;
	reg open;
	reg alarm;
	
	reg [3:0] realcode = 4'b1111;
//	initial begin
//		realcode = 4'b1010;//初始密码
//		end
//	
	assign code = {q,u,n,b};

	
	always@(d or code or e or f)
	if(d == 1'b0)
		begin 
			if(code == realcode)//判断密码输入是否正确
				begin 
					open = 1'b1;
					alarm = 1'b0;//正确则绿灯亮
				end
			else
				begin
					open = 1'b0;
					alarm = 1'b1;//错误则红灯亮
				end
		end
	
	else
	 begin
		if(e == 1'b0)//更改密码按键被按下
			begin
				if(f == 1'b0)//输入原始密码确定键
					begin
						if(code == realcode)
						  begin
								open = 1'b1;
								alarm = 1'b1;
								realcode <= code;//原始密码正确则可修改
						  end
						else
						  begin
								open = 1'b0;
								alarm = 1'b1;//原始密码错误红灯亮
						  end
					end
				else
					begin
						open = 1'b0;
						alarm = 1'b1;//未按下确定键保持红灯
					end
			end
		else 
			begin 
				open = 1'b0;
				alarm = 1'b0;//未操作两灯均保持不亮
			end
	 end
	assign led1 = ~open;
	assign led2 = ~alarm;
	
endmodule