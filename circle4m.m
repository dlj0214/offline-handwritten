function [m]=circle4m(img,check)
[o,p]=size(img);
x0=ceil(o/2);
y0=ceil(p/2);
for k=1:16
    eval(['img', num2str(k), '=', '1-zeros(o,p)',';']);
end
r=round(sqrt(2)*o);
for i=1:o
    for j=1:p
       R = round(  sqrt (  (x0-i)^2 + (y0-j)^2  )   );
       if i<x0&&j<y0&&i<j&&R<r/2&&R>r/4
           img1(i,j)=img(i,j);
       else
           img1(i,j)=1;
       end
       if i<x0&&j<y0&&i>j&&R<r/2&&R>r/4
           img2(i,j)=img(i,j);
       else
           img2(i,j)=1;
       end
       if i>x0&&j<y0&&o-i+1>j&&R<r/2&&R>r/4
           img3(i,j)=img(i,j);
       else
           img3(i,j)=1;
       end
       if i>x0&&j<y0&&o-i+1<j&&R<r/2&&R>r/4
           img4(i,j)=img(i,j);
       else
           img4(i,j)=1;
       end
       if i>x0&&j>y0&&i>j&&R<r/2&&R>r/4
           img5(i,j)=img(i,j);
       else
           img5(i,j)=1;
       end
       if i>x0&&j>y0&&i<j&&R<r/2&&R>r/4
           img6(i,j)=img(i,j);
       else
           img6(i,j)=1;
       end
       if i<x0&&j>y0&&o-i+1<j&&R<r/2&&R>r/4
           img7(i,j)=img(i,j);
       else
           img7(i,j)=1;
       end
       if i<x0&&j>y0&&o-i+1>j&&R<r/2&&R>r/4
           img8(i,j)=img(i,j);
       else
           img8(i,j)=1;
       end
       if i<x0&&j<y0&&i<j&&R<r/4&&R>0
           img9(i,j)=img(i,j);
       else
           img9(i,j)=1;
       end
       if i<x0&&j<y0&&i>j&&R<r/4&&R>0
           img10(i,j)=img(i,j);
       else
           img10(i,j)=1;
       end
       if i>x0&&j<y0&&o-i+1>j&&R<r/4&&R>0
           img11(i,j)=img(i,j);
       else
           img11(i,j)=1;
       end
       if i>x0&&j<y0&&o-i+1<j&&R<r/4&&R>0
           img12(i,j)=img(i,j);
       else
           img12(i,j)=1;
       end
       if i>x0&&j>y0&&i>j&&R<r/4&&R>0
           img13(i,j)=img(i,j);
       else
           img13(i,j)=1;
       end
       if i>x0&&j>y0&&i<j&&R<r/4&&R>0
           img14(i,j)=img(i,j);
       else
           img14(i,j)=1;
       end
       if i<x0&&j>y0&&o-i+1<j&&R<r/4&&R>0
           img15(i,j)=img(i,j);
       else
           img15(i,j)=1;
       end
       if i<x0&&j>y0&&o-i+1>j&&R<r/4&&R>0
           img16(i,j)=img(i,j);
       else
           img16(i,j)=1;
       end

    end
end
if check==1
for l = 1:16
imshow(eval(['img', num2str(l)])) ;
fn=['C:\Users\201810\Desktop\16·Ö\',num2str(l),'.png'];
imwrite(eval(['img', num2str(l)]),fn);
end
end
m=zeros(1,16);
for h=1:16
    m(1,h)=sum(1-eval(['img',num2str(h),'(:)']));
end
end