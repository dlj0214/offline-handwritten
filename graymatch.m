function [stats ] = graymatch(  TestWord,MaskWord,condition )
% [Maskimg,Rate]=Maskimgcut(MaskWord);
Maskimg=imgcut2(MaskWord,1);
%%%%%%%%%%%%%%%%ÒÑÇÐ¸îÈ¥³ý°×±ß%%%%%%%%%%%%%%%%%%%%%%%
% Maskimg=imread(MaskWord);
% [height, width, colour]  = size(Maskimg);
% if colour > 1
%     Maskimg = rgb2gray(Maskimg);
% end
% Maskimg=imresize(Maskimg,[100 100]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[m11,m12,m13,m14,m15,m16]=img2m(Maskimg);
testnames =  strcat(TestWord,'\','*.png');
tests=dir(testnames);          
n=numel(tests);
m21=cell(n,100);
m22=cell(n,100);
m23=cell(n,50);
m24=cell(n,50);
m25=cell(n,50);
m26=cell(n,50);
stats=cell(12,n);
for i=1:n
    if ~isempty(  strfind(tests(i).name, condition) )
        TestwordName = strcat(TestWord,'\', tests(i).name);
        folderNamelength=length(TestWord);
        imgNamelength=length(TestwordName);
        Length=imgNamelength-folderNamelength;
        if Length==8
           Name = [TestwordName( imgNamelength-6 : imgNamelength-4 ) ];
        end
        if Length==9
           Name = [TestwordName( imgNamelength-7  : imgNamelength-4 ) ];
        end
        if Length==10
           Name = [TestwordName( imgNamelength-8  : imgNamelength-4 ) ];
        end
        if Length==6
           Name = [TestwordName( imgNamelength-4  : imgNamelength-4 ) ];
        end
        stats{1,i}=Name;
%         Testimg=Testimgcut(TestwordName,Rate);
        Testimg=imgcut2(TestwordName,1);
%%%%%%%%%%%%%%%%%%%%%%ÒÑÇÐ¸îÈ¥³ý°×±ß%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%         Testimg=imread(TestwordName);
%         [height, width, colour]  = size(Testimg);
%         if colour > 1
%              Testimg = rgb2gray(Testimg);
%         end
%         Testimg=im2bw(Testimg,graythresh(Testimg));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%        
        [mt1,mt2,mt3,mt4,mt5,mt6]=img2m(Testimg);
        m21(i,:)=num2cell(mt1);
        m22(i,:)=num2cell(mt2);
        m23(i,:)=num2cell(mt3);
        m24(i,:)=num2cell(mt4);
        m25(i,:)=num2cell(mt5);
        m26(i,:)=num2cell(mt6);
    end
end
m21=cell2mat(m21);
m22=cell2mat(m22);
m23=cell2mat(m23);
m24=cell2mat(m24);
m25=cell2mat(m25);
m26=cell2mat(m26);
for k=1:n
    mTW1=m21(k,:);
    A1=sqrt(sum(sum(m11.^2)));
        B1=sqrt(sum(sum(mTW1.^2)));
        C1=sum(sum(m11.*mTW1));
        cos1=C1/(A1*B1);
        stats(2,k)=num2cell(cos1);
    mTH1=m22(k,:);
    A2=sqrt(sum(sum(m12.^2)));
        B2=sqrt(sum(sum(mTH1.^2)));
        C2=sum(sum(m12.*mTH1));
        cos2=C2/(A2*B2);
        stats(3,k)=num2cell(cos2);
    mTW2=m23(k,:);    
    A3=sqrt(sum(sum(m13.^2)));
        B3=sqrt(sum(sum(mTW2.^2)));
        C3=sum(sum(m13.*mTW2));
        cos3=C3/(A3*B3);
        stats(4,k)=num2cell(cos3);
    mTW3=m24(k,:);    
    A4=sqrt(sum(sum(m14.^2)));
        B4=sqrt(sum(sum(mTW3.^2)));
        C4=sum(sum(m14.*mTW3));
        cos4=C4/(A4*B4);
        stats(5,k)=num2cell(cos4);
    mTH2=m25(k,:);    
    A5=sqrt(sum(sum(m15.^2)));
        B5=sqrt(sum(sum(mTH2.^2)));
        C5=sum(sum(m15.*mTH2));
        cos5=C5/(A5*B5);
        stats(6,k)=num2cell(cos5);
    mTH3=m26(k,:);    
    A6=sqrt(sum(sum(m16.^2)));
        B6=sqrt(sum(sum(mTH3.^2)));
        C6=sum(sum(m16.*mTH3));
        cos6=C6/(A6*B6);
        stats(7,k)=num2cell(cos6);           
        stats(8,k)=num2cell(cos1*cos2);
        stats(9,k)=num2cell(cos3*cos5);
        stats(10,k)=num2cell(cos4*cos5);
        stats(11,k)=num2cell(cos3*cos6);
        stats(12,k)=num2cell((cos1+cos2)/2);
end

end







