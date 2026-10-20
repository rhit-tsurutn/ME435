function T0n = fwdkin_Tsurutome(a, alpha, d, theta)
% Computes forward kinematics for a robot with n joints

n = length(a);
T0n = eye(4);

for i = 1:n

    ca = cos(alpha(i));
    sa = sin(alpha(i));
    ct = cos(theta(i));
    st = sin(theta(i));


    Ti = [ct, -st*ca,  st*sa, a(i)*ct;
          st,  ct*ca, -ct*sa, a(i)*st;
           0,     sa,     ca,    d(i);
           0,      0,      0,       1 ];
    
    T0n = T0n*Ti
end
