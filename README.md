# lidar_slam
Package to run 3D SLAM with two 2d Lidars, pixhawk imu and the Cartographer package

 
3)roslaunch
# Launch the 2D backpack demo.
roslaunch cartographer_ros demo_backpack_2d.launch bag_filename:=${HOME}/Downloads/cartographer_paper_deutsches_museum.bag

roslaunch cartographer_ros demo_backpack_2d.launch bag_filename:=/home/whu/data/cartographer_paper_deutsches_museum.bag

roslaunch cartographer_ros offline_backpack_2d.launch bag_filenames:=/home/whu/data/cartographer_paper_deutsches_museum.bag


 
-------------------------------------------   20171022
Cartographer现已经支持Toyota HSR、TurtleBots、PR2、RevoLDS这几个机器人平台。

启动ROS 

roscore
1) revo_lds 例子
roslaunch cartographer_ros demo_revo_lds.launch bag_filename:=/home/whu/data/cartographer_paper_revo_lds.bag

2）hokuyo
新终端，启动hokuyo UTM-30LX
ls -l /dev/ttyACM0
若显示为crw-rw----，则为其加权限使其显示为crw-rw-rw-

sudo chmod a+rw /dev/ttyACM0

roslaunch cartographer_ros demo_hokuyo.launch
3)2 hokuyo+imu

例子
roslaunch cartographer_ros demo_backpack_2d.launch bag_filename:=/home/whu/data/cartographer_paper_deutsches_museum.bag

4）myself  1 hokuyo+imu

sudo chmod a+rw /dev/ttyACM0 /dev/ttyUSBO
roslaunch cartographer_ros hokuyo_IMU.launch

4）myself  hokuyo

sudo chmod a+rw /dev/ttyACM0 
roslaunch cartographer_ros demo_hokuyo.launch

-------------------------------------------   20171104 
1)hector test

