clear
%%%%%%%%%%%%%%%%%%%%%%模板字二值化%%%%%%%%%%%%%%%%%%%%%%%%
% Img='C:\Users\201810\Desktop\1.bmp';
% imread(Img);
% img=imread(Img);
% img=rgb2gray(img);
% img=im2bw(img,graythresh(img));
% imshow(img);
% fn=['C:\Users\201810\Desktop\112.bmp'];
% imwrite(img,fn);
%%%%%%%%%%%%%%%%%%%%%%%%%汉子匹配度主程序%%%%%%%%%%%%%%%%%%%%
MaskWord='E:\楷体\模板字\tong11.png';
TestWord='E:\楷体\100汉字\同5';
[Rstats ] = graymatch(  TestWord,MaskWord,'png');
% [stats ] = Matching(  TestWord,MaskWord,'bmp');
% [stats ] = WordMatching(  TestWord,MaskWord,'bmp');
