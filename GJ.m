
function bw2=GJ(img) 
I=img;
subplot(2,2,1);
imshow(I);
title('ԭͼ��');
% level=graythresh(I);
% I=im2bw(I,level);subplot(2,2,2);...
imshow(I);
re=ones(100,100);
I=re-I;
subplot(2,2,2);
imshow(I);
title('��ֵ����ͼ��');
bwl=bwmorph(I,'skel',Inf);
subplot(2,2,3);
imshow(bwl);
title('�Ǽ���ȡ');
bw2=bwmorph(bwl,'spur',4);
subplot(2,2,4)
imshow(bw2)
title('����ë�̺��ͼ��');
end