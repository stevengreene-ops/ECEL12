# Number Theory: Addition

In this lab, you’ve learned about One Hot and Binary state machines and how to build them.

## Rubric

| Item | Description | Value |
| ---- | ----------- | ----- |
| Summary Answers | Your writings about what you learned in this lab. | 25% |
| Question 1 | Your answers to the question | 25% |
| Question 2 | Your answers to the question | 25% |
| Question 3 | Your answers to the question | 25% |

## Name
Steven Greene Diego Vargas

## Summary

In this lab we built a One-Hot, and a Binary Assignment state machine using Dflip flops. We were given a list of 5 states, and their logic to the next states, and using DFF's to store the logic, we had to wire them in combinatorial logic to the DFF's to control the output based on the next state given to us from the state table. 

Using one-hot encoding, we were able to isolate one specific state at a time, to allow us to visualize one LED per-state. This is less efficient as it requires a DFF per state, and an LED per state. 

Using Binary encoding, we are able to reduce the cost by reducing the dff's down to only three dffs. This allowed us to reduce the amount of LEDs as well so that we could represent values in binary on the LEDs rather than the one-hot LED. 

## Lab Questions

### Compare and contrast One Hot and Binary encodings
One-Hot and binary encodings differ primarily in their trade-off between flip-flop usage and combinatorial logic complexity. Binary encoding is space-efficient
but it requires dense logic to decode state transitions, which can increase propagation delay. In contrast, One-Hot encoding uses one flip-flop per state, 
consuming more registers but drastically simplifying the logic paths. This simplicity allows for higher clock frequencies, making One-Hot the standard choice for high-performance FPGA designs where registers are plentiful, while binary remains ideal for register-constrained architectures like CPLDs or small, area-sensitive machines.

### Which method did your team find easier, and why?

Although it might have been more costly, we found one-hot easier to implement because there was less combinatorial logic to reduce down and implement in the one-hot file, although it used more DFFs which would turn costly, it allowed us to easily copy and paste the logic. 

### In what conditions would you have to use one over the other? Think about resource utilization on the FPGA.
The choice between One-Hot and Binary encoding on an FPGA centers on the trade-off between registers and combinatorial logic. One-Hot encoding is generally preferred because FPGA uses one flip-flop per state which simplifies the next-state logic, which reduces propagation delay and enables higher clock speeds. In contrast, Binary encoding minimizes flip-flop usage but requires more complex decoding, creating deeper logic paths that can limit performance. Ultimately, One-Hot is the standard for high-performance FPGA designs, while Binary is better suited for register-constrained devices or very small state machines where saving a few flip-flops is a priority.
