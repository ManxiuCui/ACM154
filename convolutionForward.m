function Y = convolutionForward(O, K, noise)
% This function is the forward model
% Input
%   O         A matrix. The object
%   K         A matrix. The kernel
%   noise     A scalar. The standard deviation of Gaussian noise
% Output
%   Y         A matrix. The measurement = image plus noise

    if(all(size(O) == size(K)))
        I = ifft2(fft2(ifftshift(K)) .* fft2(O));
        Y = I + noise * randn(size(I));
    else
        error('The size of object O and kernel K should be the same!')
    end
end