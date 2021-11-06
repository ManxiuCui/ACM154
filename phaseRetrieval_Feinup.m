function [O, K] = phaseRetrieval_Feinup(Y)
% This function is the Feinup algorithm for solving the phase retrieval 
% problem
% Input
%   Y         A matrix. The measurement = image plus noise
% Output
%   O         A matrix. The object
%   K         A matrix. The kernel

    Mask = makeRoundDisk(size(Y), 0.3 * min(size(Y))) > 0;
    
    FI = fft2(Y);
    Amp = abs(FI);
    
    Iter = 2000;
    show_interval = 10;
    acce = 0.2;
    
    O = Y;
    O_pre = O;
    
    figure;
    for k = 1:Iter
        %Positive projection and acceleration
        R_error = Mask == 0 | O < 0;
        O(R_error) = O_pre(R_error) - acce * O(R_error);
        O_pre = O;
        
        %Fourier projection
        FO = fft2(O);
        FO = FO./abs(FO) .* Amp;
        O = real(ifft2(FO));
        K = fftshift(real(ifft2(FI ./ FO)));
        
        if(mod(k, show_interval) == 0)
            showImage(O);
            title(['Iteration Number: ', num2str(k)])
            drawnow;
        end
    end
end