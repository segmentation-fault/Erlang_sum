%   Copyright (C) 2017  Antonio Franco
%
%     This program is free software: you can redistribute it and/or modify
%     it under the terms of the GNU General Public License as published by
%     the Free Software Foundation, either version 3 of the License, or
%     (at your option) any later version.
% 
%     This program is distributed in the hope that it will be useful,
%     but WITHOUT ANY WARRANTY; without even the implied warranty of
%     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%     GNU General Public License for more details.
% 
%     You should have received a copy of the GNU General Public License
%     along with this program.  If not, see <http://www.gnu.org/licenses/>.

clc;
clear;
close all

nSamples = 1e4;

%Test for the sum of L erlangs
L = 5;  %Total number of Erlangs
shapes = randi([1,5],1,L);
rates = rand(1,L);

S = mc_generate_erlSum(rates, shapes, nSamples);

figure;
hold on
h = histogram(S,'Normalization','pdf');
h.FaceAlpha = 0.5;
x = linspace(h.BinLimits(1),h.BinLimits(2),25);
f = zeros(1,numel(x));
parfor i = 1:numel(x)
    f(i) = erlSumPDF(rates, shapes,x(i));
end
plot(x,f,'LineWidth',2);
ylim([0,1]);
title(['PDF sum of ', num2str(L), ' Erlangs']);
legend({'MC','Analytical'})
hold off

figure;
hold on
h = histogram(S,'Normalization','cdf');
h.FaceAlpha = 0.5;
x = linspace(h.BinLimits(1),h.BinLimits(2),25);
f = zeros(1,numel(x));
parfor i = 1:numel(x)
    f(i) = erlSumCDF(rates, shapes,x(i));
end
plot(x,f,'LineWidth',2);
ylim([0,1]);
title(['CDF sum of ', num2str(L), ' Erlangs']);
legend({'MC','Analytical'})
hold off

%Test for the sum of M exponentials
M = 10;
lambdas = rand(1,M);

S = mc_generate_expSum(lambdas, nSamples);

figure;
hold on
h = histogram(S,'Normalization','pdf');
h.FaceAlpha = 0.5;
x = linspace(h.BinLimits(1),h.BinLimits(2),25);
f = zeros(1,numel(x));
parfor i = 1:numel(x)
    f(i) = expSumPDF(lambdas,x(i));
end
plot(x,f,'LineWidth',2);
ylim([0,1]);
title(['PDF sum of ', num2str(M), ' Exponentials']);
legend({'MC','Analytical'})
hold off

figure;
hold on
h = histogram(S,'Normalization','cdf');
h.FaceAlpha = 0.5;
x = linspace(h.BinLimits(1),h.BinLimits(2),25);
f = zeros(1,numel(x));
parfor i = 1:numel(x)
    f(i) = expSumCDF(lambdas,x(i));
end
plot(x,f,'LineWidth',2);
ylim([0,1]);
title(['CDF sum of ', num2str(M), ' Exponentials']);
legend({'MC','Analytical'})
hold off
