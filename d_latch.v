module d_latch(
    input D, E,
    output reg Q, 
    output NotQ
);

always @(D, E) begin
    if (E)
        Q <= D;

end
assign NotQ = ~Q;



    // Will contain D-Latch behavior

endmodule