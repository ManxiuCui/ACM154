function G = gradientTotalVariation(I, M)
% this
    [Gx, Gy] = imgradientxy(I);    

    D = sqrt(Gx.^2 + Gy.^2);
    
    GxD = zeros(size(M));
    GxD(M) = Gx(M) ./ D(M);
    
    GyD = zeros(size(M));
    GyD(M) = Gy(M) ./ D(M);
    
    [GGx, ~] = imgradientxy(GxD);
    [~, GGy] = imgradientxy(GyD);

    G = - GGx - GGy;
    G(isnan(G)) = 0;
end