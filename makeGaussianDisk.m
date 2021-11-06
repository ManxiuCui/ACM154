function D = makeGaussianDisk(Size, std)
% This function generate a Gaussian shaped image. It can be a kernel.
% Input
%   Size      The matrix size of the disk you generate is Size(1) rows
%             times Size(2) columns
%   std       A scalar. The standard deviation of the gaussian disk.The 
%             unit is pixels.
% Output
%   D         A matrix. The Gaussian shaped disk

    [X, Y] = meshgrid(1:Size(2), 1:Size(1));
    Xm = (Size(2) + 1) / 2;
    Ym = (Size(1) + 1) / 2;

    D = exp((-(X - Xm).^2 - (Y - Ym).^2) / (2 * std^2));
    D = D / sqrt(sum(sum(D.^2)));
end