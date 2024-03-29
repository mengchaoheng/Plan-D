# Ducted-Fan-UAV-Simulation

<div id="sidebar"><a href="./README.md" target="_blank"><font color=#0000FF size=5px >[ENGLISH]<font></center><a></div>


<img src="./support/control_diagram.jpeg" width="90%" height="90%" />

这是一个关于涵道风扇式无人机(Ducted Fan UAV)的MATLAB & Simulink仿真，始于2019-4-21。

该仿真的特点是为冗余配置操纵面的无人机（如Ducted Fan UAV）提供一个控制系统框架，该框架包括了控制分配环节、一个ADRC控制器、以及一个状态估计器（未完善）。

借助Simulink Coder，本仿真的算法已经在实际的飞机上运行并取得预期效果。

## 关于
**论文**: [涵道风扇式无人机的优先级控制分配](https://hkxb.buaa.edu.cn/CN/10.7527/S1000-6893.2020.24017), 蒙超恒, 裴海龙, 程子欢.

```
@article{蒙超恒:324017,
	author = {蒙超恒, 裴海龙, 程子欢},
	title = {涵道风扇式无人机的优先级控制分配},
	publisher = {航空学报},
	year = {2020},
	journal = {航空学报},
	volume = {41},
	number = {10},
	eid = {324017},
	numpages = {0},
	pages = {324017},
	keywords = {涵道风扇式无人机;过驱动系统;控制分配;优先级分配;线性规划},
	url = {https://hkxb.buaa.edu.cn/CN/abstract/article_17933.shtml},
	doi = {10.7527/S1000-6893.2020.24017}
}    

```
如果您在研究项目中使用我们的代码，请引用我们的论文，非常感谢！

## 模型验证

<img src="./support/frame.png" width="50%" height="50%" />

为考察模型的准确性，采用实际飞行试验与理论模型对比的方法验证，具体包括，在实际飞行试验中，通过给系统一输入信号，对比实际检测的状态响应与理论计算的状态响应。

在实际飞行操作中，直接通过控制舵面的偏角来控制飞行是十分困难的。考虑到飞行安全，在飞行器p、q、r、a_z四个通道各串联一PI控制器，对闭环系统进行验证。此时系统输入变为p、q、r、a_z的参考输入。

在下文的验证对比图中，统一用黑色曲线表示参考输入，蓝色曲线表示状态的实际测量，红色曲线表示状态的理论估计。结果如下图所示，我们的模型是比较准确的。

<img src="./support/FlightTest_diagram.png" width="100%" height="100%" />

<img src="./support/f1.png" width=30%/><img src="./support/f2.png" width=30%/><img src="./support/f3.png" width=30%/>

滚转角速度p的测量与理论计算结果如下图所示

<img src="./support/test_roll_rate.png" width="100%" height="100%" />

滚转角\varphi的测量与理论计算结果如下图所示。

<img src="./support/test_roll.png" width="100%" height="100%" />

地面坐标系下速度V_y的测量与理论计算结果如下图所示。

<img src="./support/test_V_y.png" width="100%" height="100%" />

偏航角速度r的测量与理论计算结果如下图所示。

<img src="./support/test_yaw_rate.png" width="100%" height="100%" />

偏航角\psi的测量与理论计算结果如下图所示。

<img src="./support/test_yaw.png" width="100%" height="100%" />

Z_b轴方向加速度dot{\omega}的测量与理论计算结果如下图所示。

<img src="./support/test_high_acc.png" width="100%" height="100%" />

地面坐标系下的高度速度V_z的测量与理论计算结果如下图所示。

<img src="./support/test_high_V_z.png" width="100%" height="100%" />


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


## Contributing

* **蒙超恒** - *Initial work* - https://github.com/mengchaoheng

## Versioning

V7

## Authors

* **蒙超恒** - *Initial work* - https://github.com/mengchaoheng
* **Dr.C** - *建模* 


## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

特别感谢

* Prof.Peter

	*为本项目提供资金支持。

* Dr.C

	*为本项目提供所有实验数据！特别是关于Ducted Fan的数学模型参数、空气动力学特性数据以及建模的工作。



