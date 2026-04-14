module top(
    input sw, // w
    output [9:0] led, // see IO table
    input btnC, // clk
    input btnU // reset
);

    // Hook up binary and one-hot state machines
    one_hot ohAll(
        .clk(btnC),
        .reset(btnU),
        .w(sw),
        .z(led[0]),
        .State(led[6:2])
        );

     binary binZ (
        .clk(btnC),
        .reset(btnU),
        .w(sw),
        .z(led[1]),
        .State(led[9:7])
        );
         
//    one_hot ohA (
//        .clk(btnC),
//        .reset(btnU),
//        .w(Astate),
//        .Anext(led[2])
//        );
        
//    one_hot ohB (
//        .clk(btnC),
//        .reset(btnU),
//        .w(Bstate),
//        .Bnext(led[3])
//        );
        
//    one_hot ohC (
//        .clk(btnC),
//        .reset(btnU),
//        .w(Cstate),
//        .Cnext(led[4])
//        );
      
//     one_hot ohD (
//        .clk(btnC),
//        .reset(btnU),
//        .w(Dstate),
//        .Dnext(led[5])
//        );
        
//     one_hot ohE (
//        .clk(btnC),
//        .reset(btnU),
//        .w(Estate),
//        .Enext(led[6])
//        );
        

endmodule