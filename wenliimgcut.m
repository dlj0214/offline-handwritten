function [Img ] = wenliimgcut(  img)
%%%%%%%%%%用于灰度图像的切割%%%%%%%%%
img1=imread(img);
[height, width, colour]  = size(img1);
if colour > 1
    img1 = rgb2gray(img1);
end
img2=im2bw(img1,graythresh(img1));
img3=255-zeros(height,width);
for m=1:height
    for n=1:width
        if img2(m,n)==0
           img3(m,n)=img1(m,n);
        end
    end
end
Sh=sum(img2,1);
Sw=sum(img2,2);
for i=1:width
if (Sh(1,i)-height*1)<0
L=i;
break
end
end
for j=1:width
if (Sh(1,j)-height*1)<0
R=j;
end
end
for k=1:height
if (Sw(k,1)-width*1)<0
U=k;
break
end
end
for l=1:height
if (Sw(l,1)-width*1)<0
D=l;
end
end
img4=uint8(img3(U:D,L:R));
img5=imresize(img4,[100 100]);
Img=img5;
end