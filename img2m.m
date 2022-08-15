function [m1,m2,m3,m4,m5,m6]=img2m(img)
[o,p]=size(img);
m1=zeros(1,100);
m2=zeros(1,100);
m3=zeros(1,50);
m4=zeros(1,50);
m5=zeros(1,50);
m6=zeros(1,50);
% for i=1:100
% %     m(1,i)=sum(sum(img(i:10:end,:)));
% end
% Img=img';
% for j=1:100
% %     m(1,j+10)=sum(sum(Img(j:10:end,:)));
% 
% end
m1(1:100)=sum(img);
m3(1:50)=m1(1:50);
m4(1:50)=m1(51:100);
Img=img';
m2(1:100)=sum(Img);
m5(1:50)=m2(1:50);
m6(1:50)=m2(51:100);
m1=100-m1;
m2=100-m2;
m3=100-m3;
m4=100-m4;
m5=100-m5;
m6=100-m6;
end