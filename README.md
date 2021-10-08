# cfntt_ref
## Introduction
This project is tailored for the paper entitled "CFNTT: Scalable Radix-2/4 NTT Multiplication Architecture with an Efficient Conflict-free Memory Mapping Scheme". It is mainly organized as three parts:   
(1) Hardware codes for radix-2 and radix-4 NTT/INTT kernels written in Verilog HDL;    
(2) Algorithmic models for radix-2 and radix-4 NTT/INTT  written in Python;   
(3) Resource usages broken down across different modules tailored for radix-2 and radix-4 NTT kernels with different number of BFUs, which is reported by Vivado 2020.2 on Windows 10 using Xilinx Virtex-7 FPGA (xc7vx690tffg1761-3);   
## Notes
In this paper, we take the parameters (N = 1024, q = 14-bit modulus) as a case study to implement the radix-2 and radix-4 NTT kernels with different number of butterfly units. One can achieve the scalability of radix-2/4 NTT architecture by re-defining the vector length N, modulus q and number of parallel BFUs based on the design framework. The proposed radix-4 NTT core requires vector length N to be powers-of-4, which can be applied in third-round-candidate PQC algorithms like Falcon-1024 (N = 1024, q = 12289), Dilithium (N = 256, q = 8380417) and Saber (N = 256, q with prime lift trick). While Falcon-512 (N = 512, q = 12289) can resort to the radix-2 NTT core. 
