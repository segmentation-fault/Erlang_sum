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

function f=erlSumCDF(rates, shapes, y)
%function f=erlSumCDF(rates, shapes, y)
% returns the CDF calculated in y of numel(rates) Erlang random variables
% with rate parameters in the rates vector and the shape parameters in the
% shapes vector. The number of elements in rates must be equal to the number
% of elements in shapes. Algorithm according to:
% Imran Shafique Ansari and Ferkan Yilmaz and Mohamed-Slim Alouini and Oguz
% Kucur: "ew Results on the Sum of Gamma Random Variates With Application 
% to the Performance of Wireless Communication Systems over Nakagami-m
% Fading Channels", https://arxiv.org/abs/1202.2576

assert(numel(rates) == numel(shapes));

lambdas = [];

for i=1:numel(rates)
    lambdas = [lambdas,rates(i)*ones(1,shapes(i))];
end

f = expSumCDF(lambdas,y);

end