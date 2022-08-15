function [Rstats ] = xiangguanmatch(  TestWord,MaskWord,condition ,check)
Maskimg=imgcut2(MaskWord,0);
% [Maskimg,Rate]=Maskimgcut(MaskWord,0);
if check==1
imshow(Maskimg);
dn=['C:\Users\201810\Desktop\ºº×ÖÇÐ¸î\Ä£°å.png'];
imwrite(Maskimg,dn);
end
m1=double(Maskimg);
testnames =  strcat(TestWord,'\','*.png');
tests=dir(testnames);          
n=numel(tests);
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
        Testimg=imgcut2(TestwordName,0);
%         [Testimg]=Testimgcut(TestwordName,Rate,0);
        if check==1
        imshow(Testimg);
        fn=['C:\Users\201810\Desktop\ºº×ÖÇÐ¸î\',num2str(Name),'.png'];
        imwrite(Testimg,fn);
        end
        m2=double(Testimg);
        result=corrcoef(m1,m2);
        Rstats(2,i)=num2cell(abs(result(1,2)));
        
    end
end



end