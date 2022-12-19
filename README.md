# Ducted-Fan-UAV-Simulation

![system](https://user-images.githubusercontent.com/43166007/143251187-1fea2e86-f317-4ee6-9376-652430c47b76.jpg)


这是一个关于涵道风扇式无人机(Ducted Fan UAV)的MATLAB & Simulink仿真，始于2019-4-21。
它可以通过链接flightfear提供可视化的仿真结果，借助Simulink Coder可以提高开发速度
当然，一切的前提是你已经得到了对象的数学模型。

## Getting Started

本项目在Windows下借助MATLAB进行开发，要运行这个工程，只需要简单的操作。Matlab自带的uav例程也是类似的组织方式。通过这个工程可以了解MATLAB的Simulink Aerospace blockset、matlab Project Management
以及git和Simulink 工程中的源代码管理。值得一提的是Simulink 工程使用git是非常方便的，不需要命令行而是通过图形化界面就可以操作。

### Prerequisites

需要的软件：

1.MATLAB2018及以上版本。
2.flightgear(可选)。
3.git(可选)。

### Installing

使用git克隆本工程到本地

## Running the tests

1.打开MATLAB,并将文件夹定位到工程所在目录
2.双击工程根目录的PRJ文件PlanD，即可开启仿真程序
3.在名为flightSimulation的simulink模块中点击Run即可运行，可以在\plan-D\utilities的startVars.m文件
中设置启动项，选择不同的输入信号、控制器、控制分配方式等等。

## Contributing

* **蒙超恒** - *Initial work* - https://github.com/mengchaoheng

## Versioning

V7

## Authors

* **蒙超恒** - *Initial work* - https://github.com/mengchaoheng

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

特别感谢

* Prof.Peter

	*为本项目提供资金支持。

* Dr.CZH

	*为本项目提供所有实验数据！特别是关于Ducted Fan的数学模型参数、空气动力学特性数据。



