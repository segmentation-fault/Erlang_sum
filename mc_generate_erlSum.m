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

function S = mc_generate_erlSum(rates, shapes, nSamples)
%function S = mc_generate_erlSum(rates, shapes, nSamples)
% generates nSamples samples of a sum of numel(rates) Erlang random
% variables with rate parameters in the rates vector and the shape
% parameters in the shapes vector. The number of elements in rates must be
% equal to the number of elements in shapes.

assert(numel(rates) == numel(shapes));

lambdas = [];

for i=1:numel(rates)
    lambdas = [lambdas,rates(i)*ones(1,shapes(i))];
end

S = mc_generate_expSum(lambdas, nSamples);

end
