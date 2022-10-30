function Rn2b=Rn2bf(Roll,Pitch,Yaw)
Rn2b=[          cos(Pitch)*cos(Yaw)                                     cos(Pitch)*sin(Yaw)        					 -sin(Pitch);
          -cos(Roll)*sin(Yaw)+sin(Roll)*sin(Pitch)*cos(Yaw)     cos(Roll)*cos(Yaw)+sin(Roll)*sin(Pitch)*sin(Yaw)        sin(Roll)*cos(Pitch);
          sin(Roll)*sin(Yaw)+cos(Roll)*sin(Pitch)*cos(Yaw)		-sin(Roll)*cos(Yaw)+cos(Roll)*sin(Pitch)*sin(Yaw)		cos(Roll)*cos(Pitch)];
end