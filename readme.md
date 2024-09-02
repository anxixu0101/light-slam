## SLAM by MATLAB


### The purpose

**In order to allow people who want to learn SLAM to complete the basic theory of SLAM without relying on ros, I have completed the theory required for SLAM in the form of MATLAB**


### The theory

**In my opinion, SLAM is divided into three types: fusion algorithm, matching algorithm and optimization algorithm required by the backend. In the front end, it has always puzzled me how to achieve accurate odometry calculations without other sensors but radar. Since the function of the ICP algorithm is a concave function, it is inevitable to fall into a local optimum. To this end, I optimized the ICP to try to find the global optimal solution to complete accurate odometer calculations.**


### How to use

**No need to use any toolbox, just move the program directly into MATLAB and run it**
