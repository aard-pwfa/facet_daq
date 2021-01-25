function [BDES, BACT] = set_QS_energy(E)

if E<-20 || E>999
    disp(sprintf('\nThis value is not permitted.\n'));
else
%    disp(sprintf('\nSetting QS quads to the requested X imaging energy.\n'));
    disp(sprintf('\nTemporary version for emulating change of particle energy.\n'));
VAL = (20.35/E)*[-388, 357.08  -109.16]; % Imaging condition for E200 IP or plasma exit in Fall of 2013
control_magnetSet({'LGPS:LI20:3204', 'LGPS:LI20:3261', 'LGPS:LI20:3311'}, VAL,  'action', 'TRIM')
end

pause(1);

[BACT, BDES] = control_magnetGet({'LGPS:LI20:3204',  'LGPS:LI20:3261', 'LGPS:LI20:3311'});
disp(sprintf('\nQS0:\nBDES = %.4f\nBACT = %.4f\n\nQS0:\nBDES = %.4f\nBACT = %.4f\n\nQS2:\nBDES = %.4f\nBACT = %.4f\n', BDES(1), BACT(1), BDES(2), BACT(2), BDES(3), BACT(3)));

    disp(sprintf('\nPress the "any" key to continue.\n'));

pause;
