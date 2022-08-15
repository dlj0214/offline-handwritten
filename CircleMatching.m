function [Rstats ] = CircleMatching(  TestWord,MaskWord,condition ,check)
Maskimg=imgcut2(MaskWord,1);
% [Maskimg,Rate]=Maskimgcut(MaskWord,0);
if check==1
imshow(Maskimg);
dn=['C:\Users\201810\Desktop\ºº×ÖÇÐ¸î\Ä£°å.png'];
imwrite(Maskimg,dn);
end
m1=circle3m(Maskimg,0);
testnames =  strcat(TestWord,'\','*.png');
tests=dir(testnames);          
n=numel(tests);
stats=cell(n,24);
stats(1,:)=num2cell(m1(1,:));
Rstats=cell(2,n);
for i=1:n
    if ~isempty(  strfind(tests(i).name, condition) )
        TestwordName = strcat(TestWord,'\', tests(i).name);
        folderNamelength=length(TestWord);
        imgNamelength=length(TestwordName);
        Length=imgNamelength-folderNamelength;
        if Length==6
           Name = [TestwordName( imgNamelength-4  : imgNamelength-4 ) ];
        end
        if Length==7
           Name = [TestwordName( imgNamelength-5  : imgNamelength-4 ) ];
        end
        Rstats{1,i}=Name;
        Testimg=imgcut2(TestwordName,1);
%         [Testimg]=Testimgcut(TestwordName,Rate,0);
        if check==1
        imshow(Testimg);
        fn=['C:\Users\201810\Desktop\ºº×ÖÇÐ¸î\',num2str(Name),'.png'];
        imwrite(Testimg,fn);
        end
        m2=circle3m(Testimg,0);
        stats(i+1,:)=num2cell(m2(1,:));
    end
end
Stats=cell2mat(stats);
m3=Stats(1,:);
for k=2:n+1
    m4=Stats(k,:);
%     Re=zeros(1,16);
%     for j=1:16  
%         Re(1,j)=(m4(1,j)-m3(1,j))^2/(m4(1,j)+m3(1,j));
%     end
%         Rstats(2,k-1)=num2cell(sum(Re(:)));
    A=sqrt(sum(sum(m3.^2)));
        B=sqrt(sum(sum(m4.^2)));
        C=sum(sum(m3.*m4));
        cos=C/(A*B);
        Rstats(2,k-1)=num2cell(cos);
%         result=corrcoef(m3,m4);
%         Rstats(2,k-1)=num2cell(result(1,2));
end

end