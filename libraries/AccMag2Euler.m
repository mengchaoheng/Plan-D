function eulerAng = AccMag2Euler(acc, mag)
% check
eulerAng = zeros(3,1);
g = norm(acc); % g = acc_g;
eulerAng(1) = atan2(acc(2), acc(3)); % roll
eulerAng(2) = asin(limitVar(-acc(1) / g, -1, 1 )); % pitch
eulerAng(3) = mag2yaw(eulerAng, mag); % yaw

%----------------------------------------------------------------
function yaw = mag2yaw(eulerAng, mag)
mag_calib = zeros(1,3);
phi = eulerAng(1);
theta = eulerAng(2);

mag_calib(1) =  mag(1) * cos(theta) + mag(2) * sin(theta) * sin(phi) + mag(3) * sin(theta) * cos(phi);
mag_calib(2) = -mag(2) * cos(phi)   + mag(3) * sin(phi);

if mag_calib(1) ~= 0
    yaw = atan2(mag_calib(2), mag_calib(1));
else
    if mag_calib(2) < 0
        yaw = -pi/2;
    else
        yaw = pi/2;
    end
end

%----------------------------------------------------------------
function y = limitVar(f, fmin, fmax)
if f < fmin
    y = fmin;
else
    if f > fmax
        y = fmax;
    else
        y = f;
    end
end

% EOF
