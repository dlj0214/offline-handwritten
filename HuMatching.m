function [stats ] = HuMatching(  TestWord,MaskWord,condition ,check)
Maskimg=imgcut2(MaskWord,0);
% [Maskimg,Rate]=Maskimgcut(MaskWord,0);
if check==1
imshow(Maskimg);
dn=['C:\Users\201810\Desktop\ºº×ÖÇÐ¸î\Ä£°å.png'];
imwrite(Maskimg,dn);
end
m1=invariable_moment(Maskimg);
testnames =  strcat(TestWord,'\','*.png');
tests=dir(testnames);          
n=numel(tests);
Hustats=cell(5,7);
Hustats(1,:)=num2cell(m1);
stats=cell(2,5);
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
        stats{1,i}=Name;
        Testimg=imgcut2(TestwordName,1);
%         [Testimg]=Testimgcut(TestwordName,Rate,0);
        if check==1
        imshow(Testimg);
        fn=['C:\Users\201810\Desktop\ºº×ÖÇÐ¸î\',num2str(Name),'.png'];
        imwrite(Testimg,fn);
        end
        m2=invariable_moment(Testimg);
        Hustats(i+1,:)=num2cell(m2);
    end
end
hustats=cell2mat(Hustats);
maxhu=max(hustats);
for j=1:7
     hustats1(:,j)=hustats(:,j)/maxhu(1,j);
end
m3=hustats1(1,:);
for k=2:6
    m4=hustats1(k,:);
    A=sqrt(sum(sum(m3.^2)));
        B=sqrt(sum(sum(m4.^2)));
        C=sum(sum(m3.*m4));
        cos=C/(A*B);
        stats(2,k-1)=num2cell(cos);
end

end