clear all;
load('Object_C.mat');

scale = 10;

O = imresize(O, 1/scale);

K_rp = randomPhaseKernel(size(O));
K_gs = makeGaussianDisk(size(O), 7 / scale);
K_rd = makeRoundDisk(size(O), 8 / scale);

noise = 0;
Y_rp_n0 = convolutionForward(O, K_rp, noise);
Y_gs_n0 = convolutionForward(O, K_gs, noise);
Y_rd_n0 = convolutionForward(O, K_rd, noise);

noise = 0.01;
Y_rp_n001 = convolutionForward(O, K_rp, noise);
Y_gs_n001 = convolutionForward(O, K_gs, noise);
Y_rd_n001 = convolutionForward(O, K_rd, noise);

noise = 0.02;
Y_rp_n002 = convolutionForward(O, K_rp, noise);
Y_gs_n002 = convolutionForward(O, K_gs, noise);
Y_rd_n002 = convolutionForward(O, K_rd, noise);

noise = 0.03;
Y_rp_n003 = convolutionForward(O, K_rp, noise);
Y_gs_n003 = convolutionForward(O, K_gs, noise);
Y_rd_n003 = convolutionForward(O, K_rd, noise);

noise = 0.04;
Y_rp_n004 = convolutionForward(O, K_rp, noise);
Y_gs_n004 = convolutionForward(O, K_gs, noise);
Y_rd_n004 = convolutionForward(O, K_rd, noise);

noise = 0.05;
Y_rp_n005 = convolutionForward(O, K_rp, noise);
Y_gs_n005 = convolutionForward(O, K_gs, noise);
Y_rd_n005 = convolutionForward(O, K_rd, noise);

clear noise;
clear scale;

save('data_10x10');

figure; 
subplot(3, 3, 2); hold on; title('Object');
showImage(O);
subplot(3, 3, 4); hold on; title('Random Phase kernel');
showImage(K_rp);
subplot(3, 3, 5); hold on; title('Gaussian kernel');
showImage(K_gs);
subplot(3, 3, 6); hold on; title('Round disk kernel');
showImage(K_rd);
subplot(3, 3, 7); hold on; title('Measurement');
showImage(Y_rp_n005);
subplot(3, 3, 8); hold on; title('Measurement');
showImage(Y_gs_n005);
subplot(3, 3, 9); hold on; title('Measurement');
showImage(Y_rd_n005);


%%
[O_inv, K_inv] = phaseRetrieval_Fienup(Y_rp_n0);

%%
%[O_inv, K_inv] = phaseRetrieval_fista_L1_TV_posi(Y_rp);
%%






