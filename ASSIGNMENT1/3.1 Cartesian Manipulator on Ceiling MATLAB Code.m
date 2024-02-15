disp('CARTESIAN')
syms a1 a2 a3 a4

%% Link Lengths

a1 = 2;
a2 = 2;
a3 = 2;
a4 = 2;

%% D-H Parameters [theta, d, r, alpha, offset]
% if prismatic joint: theta = theta, d = 0, offset = 1, after offset put the value of d

% if revolute joint: theta = 0,offset = 0, after offset put the value of theta

H0_1 = Link([0,0,0,pi/2,1,-a1]);
H0_1.qlim = [0 0];

H1_2 = Link([pi/2,0,0,pi/2,1,a2]);
H1_2.qlim = [0 5];

H2_3 = Link([pi/2,0,0,(3*pi)/2,1,a3]);
H2_3.qlim = [0 5];

H3_4 = Link([0,0,0,0,1,a4]);
H3_4.qlim = [0 5];

Cartesian = SerialLink([H0_1 H1_2 H2_3 H3_4], 'name', 'Cartesian')

Cartesian.plot([30 0 0 0], 'workspace', [-10 10 -10 10 -10 10])

Cartesian.teach

%% Forward Kinemtics

Af = ([5,pi/2,pi/2]); %joint_variables FK =Cartesian.fkine(Af)




