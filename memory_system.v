module memory_system(
    input [7:0] data,
    input store,
    input [1:0] addr,
    output [7:0] memory
);

wire [7:0] mem0, mem1, mem2, mem3;
wire [3:0] store_demux;

demultiplexer store_demux_inst(
        .data({4{store}}), 
        .sel(addr),
        .A(store_demux[0]),
        .B(store_demux[1]),
        .C(store_demux[2]),
        .D(store_demux[3])
    );

    
    byte_memory mem_inst0(
        .data(data),
        .store(store_demux[0]),
        .memory(mem0)
    );
    byte_memory mem_inst1(
        .data(data),
        .store(store_demux[1]),
        .memory(mem1)
    );
    byte_memory mem_inst2(
        .data(data),
        .store(store_demux[2]),
        .memory(mem2)
    );
    byte_memory mem_inst3(
        .data(data),
        .store(store_demux[3]),
        .memory(mem3)
    );

    reg [7:0] mem_out;
    always @(*) begin
        case(addr)
            2'b00: mem_out = mem0;
            2'b01: mem_out = mem1;
            2'b10: mem_out = mem2;
            2'b11: mem_out = mem3;
            default: mem_out = 8'b0;
        endcase
    end

    assign memory = mem_out;


    // This should instantiate 4 instances of
    // byte_memory, and then demultiplex
    // data and store into the one selected by
    // addr

    // It should then multiplex the output of the
    // memory specified by addr into the memory
    // output for display on the LEDs

    // you will need 2 demultiplexers:
    // 1. Demultiplex data -> selected byte
    // 2. Demultiplex store -> selected byte

    // and one multiplexer:
    // 1. Multiplex selected byte -> memory

endmodule