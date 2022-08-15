function [Img ] = imgcut(  img,gujia )
img=imread(img);
[height, width, colour]  = size(img);
if colour > 1
    img = rgb2gray(img);
end
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
img1=img(U:D,L:R);
img2=imresize(img1,[127 127]);
if gujia==1
    Img=1-GJ(img2);
else
    Img=img2;
end
end






