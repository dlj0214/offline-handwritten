clear
%%%%%%%%%%%%%%%%%%%%%%ģ���ֶ�ֵ��%%%%%%%%%%%%%%%%%%%%%%%%
% Img='C:\Users\201810\Desktop\1.bmp';
% imread(Img);
% img=imread(Img);
% img=rgb2gray(img);
% img=im2bw(img,graythresh(img));
% imshow(img);
% fn=['C:\Users\201810\Desktop\112.bmp'];
% imwrite(img,fn);
%%%%%%%%%%%%%%%%%%%%%%%%%����ƥ���������%%%%%%%%%%%%%%%%%%%%
MaskWord='E:\����\ģ����\tong11.png';
TestWord='E:\����\100����\ͬ5';
[Rstats ] = graymatch(  TestWord,MaskWord,'png');
% [stats ] = Matching(  TestWord,MaskWord,'bmp');
% [stats ] = WordMatching(  TestWord,MaskWord,'bmp');
