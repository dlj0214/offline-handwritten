function [stats ] = wenlimatch(  TestWord,MaskWord,condition )
[Maskimg]=wenliimgcut(MaskWord);
%%%%%%%%%%%%%%%%ÒÑÇÐ¸îÈ¥³ý°×±ß%%%%%%%%%%%%%%%%%%%%%%%
% Maskimg=imread(MaskWord);
% [height, width, colour]  = size(Maskimg);
% if colour > 1
%     Maskimg = rgb2gray(Maskimg);
% end
% Maskimg=imresize(Maskimg,[100 100]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
m1=coocurrence(Maskimg);
testnames=strcat(TestWord,'\','*.png');
tests=dir(testnames);          
n=numel(tests);
m2=cell(n,8);
stats=cell(2,n);
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
        Testimg=wenliimgcut(TestwordName);
%%%%%%%%%%%%%%%%%%%%%%ÒÑÇÐ¸îÈ¥³ý°×±ß%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%         Testimg=imread(TestwordName);
%         [height, width, colour]  = size(Testimg);
%         if colour > 1
%              Testimg = rgb2gray(Testimg);
%         end
%         Testimg=im2bw(Testimg,graythresh(Testimg));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%        
        mt=coocurrence(Testimg);
        m2(i,:)=num2cell(mt);
    end
end
m2=cell2mat(m2);
m=[m1;m2];
Maxm=max(m);
for j=1:8
    m(:,j)=m(:,j)/Maxm(1,j);
end
m1=m(1,:);
m2=m(2:end,:);
for k=1:n
    mT=m2(k,:);
    A=sqrt(sum(sum(m1.^2)));
        B=sqrt(sum(sum(mT.^2)));
        C=sum(sum(m1.*mT));
        cos=C/(A*B);
        stats(2,k)=num2cell(cos);

end

end