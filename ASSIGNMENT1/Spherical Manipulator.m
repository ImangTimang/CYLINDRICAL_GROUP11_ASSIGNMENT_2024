disp('Spherical')

syms a1 a2 a3 

%% Link lengths

a1 = 10;

a2 = 8;

a3 = 5;

%% D-H Parameters [theta, d, r, alpha, offset]

% if prismatic joint: theta = theta, d = 0, offset = 1, after offset put the value of d

% if revolute joint: theta = 0,offset = 0, after offset put the value of theta

H0_1 = Link([0,a1,0,pi/2,0,0]);

H0_1.qlim = pi/180*[-90 90];

H1_2 = Link([0,0,a2,pi/2,0,pi/2]);

H1_2.qlim = pi/180*[-90 90];

H2_3 = Link([0,0,0,0,1,a3]);

H2_3.qlim = [0 5];

Spherical = SerialLink([H0_1 H1_2 H2_3], 'name', 'Spherical')

Spherical.plot([0 0 0], 'workspace', [-5 25 -25 25 0 25])

Spherical.teach

%% Forward Kinemtics

%syntax: FK = robot_variable.fkine(joint_variables)

Af = ([5,pi/2,pi/2]); %joint_variables FK = Spherical.fkine(Af)

