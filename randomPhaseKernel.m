function K = randomPhaseKernel(Size)
% This function generate a random phase kernel. It can be used to simulate
% the phase retrieval
% Input
%   Size      The matrix size of the kernel you generate is Size(1) rows
%             times Size(2) columns
% Output
%   K         A matrix. The random phase kernel

    Seed = rand(Size);
    Seed = [Seed, Seed(:, 1)];
    Seed = [Seed; Seed(1, :)];

    Seed = (Seed - rot90(Seed,2));
    Seed = Seed(1:Size(1), 1:Size(2));

    Phase = exp(1i * 2 * pi * Seed);
    K = ifft2(Phase);
end