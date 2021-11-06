clear all;
load('Object_C.mat');

K_rp = randomPhaseKernel(size(O));
K_gs = makeGaussianDisk(size(O), 7);
K_rd = makeRoundDisk(size(O), 8);

noise = 0.03;

Y_pr = convolutionForward(O, K_rp, noise);
Y_gs = convolutionForward(O, K_gs, noise);
Y_rd = convolutionForward(O, K_rd, noise);

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
showImage(Y_pr);
subplot(3, 3, 8); hold on; title('Measurement');
showImage(Y_gs);
subplot(3, 3, 9); hold on; title('Measurement');
showImage(Y_rd);

%%
[O_inv, K_inv] = phaseRetrieval_Feinup(Y_pr);

%%
[O_inv, K_inv] = phaseRetrieval_fista_L1_TV_posi(Y_pr);
%%






