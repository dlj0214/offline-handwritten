function [Img,Rate ] = Maskimgcut(  img )
img=imread(img);
[height, width, colour]  = size(img);
if colour > 1
    img = rgb2gray(img);
end
img=im2bw(img,graythresh(img));
Sh=sum(img,1);
Sw=sum(img,2);
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
W=R-L+1;
H=D-U+1;
Rate=H/W;
img1=img(U:D,L:R);
img2=imresize(img1,[100 100]);
Img=img2;
end