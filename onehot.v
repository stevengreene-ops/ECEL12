// Implement one-hot state machine
module one_hot(
    input w,
    input clk,
    input reset,
    output [4:0] State,
    output z
);
    //wire Anext, Bnext, Cnext, Dnext, Enext;
    //[4:0]next takes the place of Anext, Bnext etc.,
    wire [4:0] next;
//    wire Astate, Bstate, Cstate, Dstate, Estate;

    dff Adff(
        .Default(1'b1),
        .D(next[0]),
        //.D(Anext),
        .clk(clk),
        .reset(reset),
        .Q(State[0])
    );

    dff Bdff(
        .Default(1'b0),
        .D(next[1]),
        //.D(Bnext),
        .clk(clk),
        .reset(reset),
        .Q(State[1])
    );

    dff Cdff(
        .Default(1'b0),
        .D(next[2]),
        //.D(Cnext),
        .clk(clk),
        .reset(reset),
        .Q(State[2])
    );
    
    dff Ddff(
        .Default(1'b0),
        .D(next[3]),
        //.D(Dnext),
        .clk(clk),
        .reset(reset),
        .Q(State[3])
    );
    
    dff Edff(
        .Default(1'b0),
        .D(next[4]),
        //.D(Enext),
        .clk(clk),
        .reset(reset),
        .Q(State[4])
    );

    assign z = State[2] | State[4];

    assign next[0] = 0;
    assign next[1] = (~w & State[0]) | (~w & State[3]) | (~w & State[4]);
    assign next[2] = (~w & State[1]) | (~w & State[2]);
    assign next[3] = (w & State[0]) | (w & State[1]) | (w & State[2]);
    assign next[4] = (w & State[3]) | (w & State[4]);
    
    //the above states take the place of the below Anext, Bnext, Cnext etc.,
//    assign Anext = ~w;
//    assign Bnext = (~w & Bstate) | (~w & Dstate) | (~w & Estate);
//    assign Cnext = (~w & Bstate) | (~w & Cstate);
//    assign Dnext = (w & Astate) | (w & Bstate) | (w & Cstate);
//    assign Enext = (w & Dstate) | (w & Estate);
    
endmodule