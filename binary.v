// Implement binary state machine
module binary(
    input w,
    input clk,
    input reset,
    output z,
    output [2:0] State
);

//    wire [2:0] State;
//    wire [2:0] currState; //replaces State on line 10
    wire [2:0] Next;
//    wire [2:0] nextState;

    dff zero(
//        .D(Next[0]),
        .Default(1'b0),
        .D(Next[0]),
        .reset(reset),
        .clk(clk),
        .Q(State[0])
//        .Q(State[0])
    );

    dff one(
//        .D(Next[1]),
        .Default(1'b0),
        .D(Next[1]),
        .reset(reset),
        .clk(clk),
//        .Q(State[1])
        .Q(State[1])
    );
    
    dff two(
//        .D(Next[2]),
        .Default(1'b0),
        .D(Next[2]),
        .clk(clk),
        .reset(reset),
        .Q(State[2])
//        .Q(State[2])
    );

    assign z = (State[1] & ~State[0] | 
                    State[2]);
                    
    assign Next[0] = (~w & ~State[1] & ~State[0]) |
                    (w & ~State[2] & ~State[1]) | 
                    (~w & State[1] & State[0]) | 
                    (w & ~State[2] & ~State[0]);
                    
    assign Next[1] = (w & ~State[2] & ~State[1]) | (~State[1] & State[0]) | (State[1] & ~State[0]);
    
    assign Next[2] = (w & State[2]) | (w & State[1] & State[0]);

endmodule