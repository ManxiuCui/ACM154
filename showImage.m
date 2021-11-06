function showImage(I)
    imagesc(I);
    colormap gray;
    axis equal;
    axis off;
    set(gca, 'Ydir', 'normal');
end