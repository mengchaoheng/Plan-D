function euler = quatern2euler(q)
%QUATERN2EULER Converts a quaternion orientation to ZYX Euler angles
%
%   q = quatern2euler(q)
%
%   Converts a quaternion orientation to ZYX Euler angles where phi is a
%   rotation around X, theta around Y and psi around Z.
%
%   For more information see:
%   http://www.x-io.co.uk/node/8#quaternions
%
%	Date          Author          Notes
%	27/09/2011    SOH Madgwick    Initial release
    w = q(1); x = q(2); y =q(3);z = q(4);
    phi = atan2(2*(w*x + y*z),1 - 2*(x^2+y^2));
    theta = asin(2*(w*y-z*x));
    psi = atan2(2*(w*z + x*y),1 - 2*(y^2+z^2));

    euler = [phi(1,:)' theta(1,:)' psi(1,:)'];
end

