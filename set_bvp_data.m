function [bvpdata] = set_bvp_data()
bvpdata.domain = [-1, 1];
bvpdata.diffusioncoeff = @(x) x.*0 + 1;
bvpdata.reactioncoeff = @(x, u) -(sin(2.*x).*cos(u)) +2.*u;
bvpdata.partialureaction = @(x, u) sin(2.*x).*sin(u) + 2;
bvpdata.forcecoeff =@(x) -2 - (sin(2.*x).*cos(x.^2 - 1)) + 2.*(x.^2 - 1);
bvpdata.leftbdryisDirichlet = true;
bvpdata.rightbdryisDirichlet = true;
bvpdata.leftbdryvalue = 0;
bvpdata.rightbdryvalue = 0;
bvpdata.leftgamma = 0;
bvpdata.rightgamma = 0;
bvpdata.initial_cond = @(x) sin(3*pi.*x);
end