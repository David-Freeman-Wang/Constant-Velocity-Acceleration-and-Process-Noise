function XNext = consv2d(X,dt,varargin)
% The third input argument cannot be a 3-by-3 covariance matrix for the process
% noise of x, y, and z directions

Zeros2 = zeros(2,2);

%STM
Fsub = [1  dt;
              0  1];          
F = [Fsub   Zeros2;
    Zeros2  Fsub];

if nargin == 2
    
    XNext = F*X;
    
end

if nargin == 3
    
    XNext = F*X + mvnrnd(zeros(4,1),varargin{1})'; % Use multi-variate normal random distribution function (Matlab, Statistic toolbox)
    
end


end
