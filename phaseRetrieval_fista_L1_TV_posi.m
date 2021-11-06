function [O, K] = phaseRetrieval_fista_L1_TV_posi(Y)
% This function is a modified phase retrieval algorithm using L1 and TV 
% regularization
% Input
%   Y         A matrix. The measurement = image plus noise
% Output
%   O         A matrix. The object
%   K         A matrix. The kernel

    Mask     = makeRoundDisk(size(Y), 0.3 * min(size(Y)));
    Iter     = 2000;
    alpha_TV = max(max(Y / 60));
    alpha_L1 = 0;%max(max(Y / 4));
    acce     = 0.2;
    
    O     = Y;
    O_pre = O;
    FI    = fft2(Y);
    Amp   = abs(FI);
    
    show_interval = 10;
    
    figure;
    for k = 1:Iter
        
        %Positive projection and acceleration
        R_error = Mask == 0 | O < 0;
        O(R_error) = O_pre(R_error) - acce * O(R_error);
        O_pre = O;
        
        %L1 projection
        O = sign(O).* max(abs(O) - alpha_L1, 0);
        
        %TV projection
        M = O > 0;
        Gradient = gradientTotalVariation(O, M);
        O = O - alpha_TV * Gradient;
        
        %Fourier projection
        FO = fft2(O);
        FO = FO ./ abs(FO) .* Amp;
        O = ifft2(FO);
        K = fftshift(ifft(FI ./ FO));
    
        if(mod(k, show_interval) == 0)
            imagesc(O);
            axis equal;
            axis off;
            colormap gray;
            title(['Iteration Number: ', num2str(k)])
            drawnow;
        end
    end
end