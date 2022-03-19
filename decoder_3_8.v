module decoder_2_4(E , In , Out);                       //2-4 decoder
input E;                                                //致能腳
input [1:0] In;                                         //兩個輸入腳
output [3:0] Out;                                       //四個輸出腳
wire [3:0] Out;                                         //四根輸出線
assign Out = E ? 1'b1 << In : 4'h0;                     //當E為0時，Out為0000; 當E為1時，Out的初始值為1，並跟據In的值，左移In個位元
endmodule

module decoder_3_8(E , In , Out);
input E;                                                //致能腳
input [2:0] In;                                         //三個輸入腳
output [7:0] Out;                                       //八個輸出腳
wire E1 , G1 , G2;                                      //E1是In[2]的反向線，G1是block1的致能腳，G2是block1的致能腳
not u1(E1 , In[2]);                                     //將In[2]反向，輸出為E1
and a1(G1 , E , In[2]);                                 //將E與In[2] and，輸出為G1
and a2(G2 , E , E1);                                    //將E與E1 and，輸出為G2
decoder_2_4 block1(G1 , In[1 : 0] , Out[7 : 4]);        //引用decoder_2_4的module，並將致能腳設為G1，輸入腳為In[1:0]，輸出腳為Out[7:4]
decoder_2_4 block2(G2 , In[1 : 0] , Out[3 : 0]);        //引用decoder_2_4的module，並將致能腳設為G1，輸入腳為In[1:0]，輸出腳為Out[3:0]
endmodule


module clkgen(clka, clkb, clka_out, clkb_out);
input clka, clkb;                                       //宣告輸入脈波clka，clkb
output clka_out, clkb_out;                              //宣告輸出脈波clka_out，clkb_out
reg clka_out, clkb_out;                                 //將clka_out，clkb_out的值存入暫存器中
always @(clka) begin
    clka_out = clka;                                    //clka的值指定給clka_out
end
always @(clkb) begin
    clkb_out = clkb;                                    //clkb的值指定給clkb_out
end
endmodule
