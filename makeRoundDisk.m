function D = makeRoundDisk(Size, R)
% This function generate a round disk image. It can be a kernel.
% Input
%   Size      The matrix size of the disk you generate is Size(1) rows
%             times Size(2) columns
%   R         A scalar. The radius of the disk. The unit is pixels.
% Output
%   D         A matrix. The round disk

    [X, Y] = meshgrid(1:Size(2), 1:Size(1));
    Xm = (Size(2) + 1) / 2;
    Ym = (Size(1) + 1) / 2;

    D = ((X - Xm).^2 + (Y - Ym).^2) < R^2;
    D = D / sqrt(sum(sum(D.^2)));
end