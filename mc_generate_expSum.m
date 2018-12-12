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

function S = mc_generate_expSum(lambdas, nSamples)
%function S = mc_generate_expSum(lambdas, nSamples)
% generates nSamples samples of the sum of numel(lambdas) exponential
% random variables with rate parameters in the lambdas vector.

S = zeros(1,nSamples);

for i=1:numel(lambdas)
    S = S + exprnd(1/lambdas(i),1,nSamples);
end

end