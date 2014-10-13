function writeTopple(IC)

fid = fopen('ToppleFromRest.m','w');

fprintf(fid,'function Critical = ToppleFromRest(P)\n');
fprintf(fid,'\n');
fprintf(fid,'AUTOMATICALLY GENERATED FILE  --  DO ONT EDIT\n');
fprintf(fid,'\n');
fprintf(fid,'%%This function uses conservation of energy to compute the dynamcis as the\n');
fprintf(fid,'%%stick topples from rest. This assumes that toppling will be in the\n');
fprintf(fid,'%%positive theta direction.\n');
fprintf(fid,'\n');
fprintf(fid,'%%%%%%%% Find the critical angle at which slipping occurs:\n');
fprintf(fid,'\n');
fprintf(fid,'options = optimset( ''Display'',''off'',...\n');
fprintf(fid,'                    ''TolX'',1e-14,...\n');
fprintf(fid,'                    ''TolFun'',1e-12);\n');
fprintf(fid,'[th_left,~,flag_left] = fzero(@(th)FrictionConeLeft(th,P),pi/4,options);\n');
fprintf(fid,'[th_right,~,flag_right] = fzero(@(th)FrictionConeRight(th,P),pi/4,options);\n');
fprintf(fid,'\n');
fprintf(fid,'if th_left > th_right\n');
fprintf(fid,'    %Then slips forwards first\n');
fprintf(fid,'    th_crit = th_left;\n');
fprintf(fid,'    flag = flag_left;\n');
fprintf(fid,'     Critical.exit = ''SlipForwards'';\n');
fprintf(fid,'else\n');
fprintf(fid,'    %Then slips backwards first\n');
fprintf(fid,'    th_crit = th_right;\n');
fprintf(fid,'    flag = flag_right;\n');
fprintf(fid,'    Critical.exit = ''SlipBackwards'';\n');
fprintf(fid,'end\n');
fprintf(fid,'\n');
fprintf(fid,'if flag~=1 %Then something went wrong\n');
fprintf(fid,'    Critical.exit = ''Fail'';\n');
fprintf(fid,'    th_crit = [];\n');
fprintf(fid,'    dth_crit = [];\n');
fprintf(fid,'    H_crit = [];\n');
fprintf(fid,'elseif th_crit < 0 || th_crit > pi/2\n');
fprintf(fid,'    Critical.exit = ''OutOfBounds'';\n');
fprintf(fid,'    th_crit = [];\n');
fprintf(fid,'    dth_crit = [];\n');
fprintf(fid,'    H_crit = [];   \n');
fprintf(fid,'    \n');
fprintf(fid,'else\n');
fprintf(fid,'    dth_crit = AngularRate(th_crit,P);\n');
fprintf(fid,'    H_crit = ContactHorizontal(th_crit,P);\n');
fprintf(fid,'end\n');
fprintf(fid,'\n');
fprintf(fid,'Critical.th = th_crit;\n');
fprintf(fid,'Critical.dth = dth_crit;\n');
fprintf(fid,'Critical.H = H_crit;\n');
fprintf(fid,'\n');
fprintf(fid,'end\n');
fprintf(fid,'\n');
fprintf(fid,'\n');
fprintf(fid,'function FCL = FrictionConeLeft(th,P)\n');
fprintf(fid,'\n');
fprintf(fid,'u = P.u;\n');
fprintf(fid,'H = ContactHorizontal(th,P);\n');
fprintf(fid,'V = ContactVertical(th,P);\n');
fprintf(fid,'FCL = H+u*V;\n');
fprintf(fid,'\n');
fprintf(fid,'end\n');
fprintf(fid,'\n');
fprintf(fid,'function FCR = FrictionConeRight(th,P)\n');
fprintf(fid,'\n');
fprintf(fid,'u = P.u;\n');
fprintf(fid,'H = ContactHorizontal(th,P);\n');
fprintf(fid,'V = ContactVertical(th,P);\n');
fprintf(fid,'FCR = H-u*V;\n');
fprintf(fid,'end\n');
fprintf(fid,'\n');
fprintf(fid,'function V = ContactVertical(th,P)\n');
fprintf(fid,'\n');
fprintf(fid,'m = P.m;\n');
fprintf(fid,'g = P.g;\n');
fprintf(fid,'L = P.L;\n');
fprintf(fid,'I = P.I;\n');
fprintf(fid,'\n');
fprintf(fid,['V = ' vectorize(IC.V(1)) ';\n']);
fprintf(fid,'\n');
fprintf(fid,'end\n');
fprintf(fid,'\n');
fprintf(fid,'function H = ContactHorizontal(th,P)\n');
fprintf(fid,'\n');
fprintf(fid,'m = P.m;\n');
fprintf(fid,'g = P.g;\n');
fprintf(fid,'L = P.L;\n');
fprintf(fid,'I = P.I;\n');
fprintf(fid,'\n');
fprintf(fid,['H = ' vectorize(IC.H(1)) ';\n']);
fprintf(fid,'\n');
fprintf(fid,'end\n');
fprintf(fid,'\n');
fprintf(fid,'function dth = AngularRate(th,P)\n');
fprintf(fid,'\n');
fprintf(fid,'m = P.m;\n');
fprintf(fid,'g = P.g;\n');
fprintf(fid,'L = P.L;\n');
fprintf(fid,'I = P.I;\n');
fprintf(fid,'\n');
fprintf(fid,['dth = ' vectorize(IC.dth(1)) ';\n']);
fprintf(fid,'\n');
fprintf(fid,'end\n');

fclose(fid);

end