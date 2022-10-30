function q = euler2quaternion(angle)
q = zeros(4,1);
angle = angle * pi/180;
cphi = cos(0.5 * angle(1));
sphi = sin(0.5 * angle(1));
cthe = cos(0.5 * angle(2));
sthe = sin(0.5 * angle(2));
cpsi = cos(0.5 * angle(3));
spsi = sin(0.5 * angle(3));
q = [cphi * cthe * cpsi + sphi * sthe * spsi;
     sphi * cthe * cpsi - cphi * sthe * spsi;
     cphi * sthe * cpsi + sphi * cthe * spsi;
     cphi * cthe * spsi - sphi * sthe * cpsi];
end