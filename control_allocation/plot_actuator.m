clc;
% clear all;
close all;
% load('Actuator.mat');
in_x=input.Data(:,1);
in_y=input.Data(:,2);
in_z=input.Data(:,3);
out_inv_x=output_inv.Data(:,1);
out_inv_y=output_inv.Data(:,2);
out_inv_z=output_inv.Data(:,3);
out_dir_x=output_dir.Data(:,1);
out_dir_y=output_dir.Data(:,2);
out_dir_z=output_dir.Data(:,3);
out_wls_x=output_wls.Data(:,1);
out_wls_y=output_wls.Data(:,2);
out_wls_z=output_wls.Data(:,3);
out_prio1_x=output_prio1.Data(:,1);
out_prio1_y=output_prio1.Data(:,2);
out_prio1_z=output_prio1.Data(:,3);
% out_mc_x=output_mc.Data(:,1);
% out_mc_y=output_mc.Data(:,2);
% out_mc_z=output_mc.Data(:,3);
figure,%
time=0:0.01:3;
tt=1:50:301;
subplot(3,1,1)
plot(time,in_x,'k-','Marker','none','MarkerIndices',tt);hold on;
plot(time,out_inv_x,'Color','b','LineStyle','-.','Marker','none','MarkerIndices',tt);hold on;
plot(time,out_dir_x,'Color','g','LineStyle','--','Marker','none','MarkerIndices',tt);hold on;
plot(time,out_prio1_x,'Color','r','LineStyle','-','Marker','none','MarkerIndices',tt);hold on;grid on;
axis([0 3 -0.36 0.45]);
title('伪控制指令响应曲线');
xlabel('\itt \rm(s)');ylabel('\it\Gamma_p \rm(N*m)')
set(gca,'FontSize', 12)%
subplot(3,1,2)

plot(time,in_y,'k-','Marker','none','MarkerIndices',tt);hold on;
plot(time,out_inv_y,'Color','b','LineStyle','-.','Marker','none','MarkerIndices',tt);hold on;
plot(time,out_dir_y,'Color','g','LineStyle','--','Marker','none','MarkerIndices',tt);hold on;
plot(time,out_prio1_y,'Color','r','LineStyle','-','Marker','none','MarkerIndices',tt);hold on;grid on;
axis([0 3 -0.36 0.36]);
xlabel('\itt \rm(s)');ylabel('\it\Gamma_q \rm(N*m)')
set(gca,'FontSize', 12)%

subplot(3,1,3)
plot(time,in_z,'k-','Marker','none','MarkerIndices',tt);hold on;
plot(time,out_inv_z,'Color','b','LineStyle','-.','Marker','none','MarkerIndices',tt);hold on;
plot(time,out_dir_z,'Color','g','LineStyle','--','Marker','none','MarkerIndices',tt);hold on;
plot(time,out_prio1_z,'Color','r','LineStyle','-','Marker','none','MarkerIndices',tt);hold on;grid on;
axis([0 3 0 0.27]);
xlabel('\itt \rm(s)');ylabel('\it\Gamma_r \rm(N*m)')
% h=legend('\tau_{c}','\tau_{i}','\tau_{d}','\tau_{p}');% ,'Location','EastOutside'
h=legend('伪控制指令','伪逆','直接分配','优先级分配');
set(h,'NumColumns',2,'location','south');
set(gca,'FontSize', 12)%
