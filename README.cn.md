# UAV-Simulation



## 快速开始

本项目借助MATLAB进行开发，要运行这个工程，只需要简单的操作。Matlab自带的uav例程也是类似的组织方式。通过这个工程可以了解MATLAB的Simulink Aerospace blockset、matlab Project Management
以及git和Simulink工程中的源代码管理。

### 先决条件

需要的软件：

1.MATLAB2018及以上版本。

2.flightgear(可选)。

3.git(可选)。

### 下载

使用git克隆本工程到本地：

```
git clone https://github.com/mengchaoheng/Plan-D.git
```

### 运行步骤

1.打开MATLAB,并将文件夹定位到工程所在目录。

2.双击工程根目录的PRJ文件 `PlanD.prj` ，即可开启仿真程序。

3.在名为 `flightSimulation.slx` 的simulink模块中点击`Run`即可运行。

可以在`\plan-D\utilities`的`startVars.m`文件中设置启动项（设置完要运行该`startVars.m`文件后再运行 `flightSimulation.slx`），选择不同的输入信号、控制器、控制分配方式等等。例如将某次飞行的输入作为仿真的参考输入，可将`startVars.m`文件的`VSS_COMMAND`设置为`2`，并运行`startVars.m`。再重新运行 `flightSimulation.slx` 即可（注意设置仿真时间，约等于53s）。

