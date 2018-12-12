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

function f=expSumCDF(lambdas,y)
%function f=expSumCDF(lambdas,y)
% returns the CDF calculated in y of numel(lambdas) exponential random
% variables with rate parameters in the lambdas vector. Algorithm according
% to: Imran Shafique Ansari and Ferkan Yilmaz and Mohamed-Slim Alouini and
% Oguz Kucur: "ew Results on the Sum of Gamma Random Variates With
% Application to the Performance of Wireless Communication Systems over
% Nakagami-m Fading Channels", https://arxiv.org/abs/1202.2576

beta = unique(lambdas);
L = numel(beta);
z = exp(-y);

m = zeros(1,L);
psi1 = [];
psi2 = [];
fac = 1;
for i=1:L
    m(i) = sum(lambdas == beta(i));
    psi2 = [psi2, beta(i)*ones(1,m(i))];
    psi1 = [psi1, (1+beta(i))*ones(1,m(i))];
    fac = fac * beta(i)^m(i);
end

f = fac * meijerG([],[psi1,1],[psi2,0],[],z);

end