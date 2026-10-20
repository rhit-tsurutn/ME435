function [A1, A2, A3, A4, A5, A6] = create_ABB_A_matrices(jointAngles)
% Create the A matrices for the arm.
A1 = create_A_matrix(0, 270, 0, jointAngles(1));
A2 = create_A_matrix(270, 0, 0, jointAngles(2));
A3 = create_A_matrix(70, 90, 0, jointAngles(3));
A4 = create_A_matrix(0, 90, 302, jointAngles(4));
A5 = create_A_matrix(0, 270, 0, jointAngles(5));
A6 = create_A_matrix(0, 0, 72, jointAngles(6));
end