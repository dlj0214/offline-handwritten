
function bw2=GJ(img) 
I=img;
subplot(2,2,1);
imshow(I);
title('原图像');
% level=graythresh(I);
% I=im2bw(I,level);subplot(2,2,2);...
imshow(I);
re=ones(100,100);
I=re-I;
subplot(2,2,2);
imshow(I);
title('二值化的图像');
bwl=bwmorph(I,'skel',Inf);
subplot(2,2,3);
imshow(bwl);
title('骨架提取');
bw2=bwmorph(bwl,'spur',4);
subplot(2,2,4)
imshow(bw2)
title('消除毛刺后的图像');
end