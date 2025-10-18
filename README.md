# UAV-Simulation

<div id="sidebar"><a href="./README.cn.md" target="_blank"><font color=#0000FF size=5px >[中文]<font></center><a></div>


## Getting Started

This project is developed with the help of MATLAB. To run this project, only simple operations are required. The uav routine that comes with Matlab is also organized in a similar way. Through this project, you can understand MATLAB's Simulink Aerospace blockset, matlab Project Management
and source code management in git and Simulink projects.

### Prerequisites

Required software:

1.MATLAB2018 or later。

2.flightgear(optional)。

3.git(optional)。

### Installing

Use git to clone this project to the local:

```
git clone https://github.com/mengchaoheng/Plan-D.git
```

### Running the tests

1. Open MATLAB, and change the matlab folder to the directory where the project is.

2. Double-click the PRJ file `PlanD.prj` in the project root directory to start the simulation program.

3. Click Run in the simulink module named `flightSimulation.slx` to run.

You can set startup items in the `startVars.m` file of `\plan-D\utilities` (after setting, run `startVars.m` and then run `flightSimulation.slx`), select different input signals, controllers , Control allocation algorithms and so on. For example, to use the input of a certain flight as the reference input of the simulation, you can set the `VSS_COMMAND` of the `startVars.m` file to `2`, and run `startVars.m`. Then run `flightSimulation.slx` again (pay attention to setting the simulation time, which is about 53s).



