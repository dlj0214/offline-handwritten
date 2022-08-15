function [Img ] = Testimgcut(  img ,Rate)
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
TRate=H/W;
if TRate<Rate
    NH=W*Rate;
    AH=round((NH-H)/2);
    AU=1-zeros(AH,W);
    AD=1-zeros(AH,W);
    img1=img(U:D,L:R);
    img2=[AU;img1;AD];
    img3=imresize(img2,[100 100]);
    Img=img3;  
end
if TRate>Rate
    NW=H/Rate;
    AW=round((NW-W)/2);
    AL=1-zeros(H,AW);
    AR=1-zeros(H,AW);
    img1=img(U:D,L:R);
    img2=[AL,img1,AR];
    img3=imresize(img2,[100 100]);
    Img=img3; 
    end
if TRate==Rate    
img1=img(U:D,L:R);
img2=imresize(img1,[100 100]);
Img=img2;
end
end