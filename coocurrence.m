function T =coocurrence(Image)

% Color= imread(Image);

% Gray=rgb2gray(Color);
Gray=Image;

[M,N] = size(Gray);

%为了减少计算量，对原始图像灰度级压缩，将Gray量化成16级

for i = 1:M

    for j = 1:N

        for n = 1:256/16

            if (n-1)*16<=Gray(i,j)&Gray(i,j)<=(n-1)*16+15

                Gray(i,j) = n-1;

            end

        end

    end

end

%计算四个共生矩阵P,取距离为1，角度分别为0,45,90,135

P = zeros(16,16,4);

for m = 1:16

    for n = 1:16

        for i = 1:M

            for j = 1:N

                if j<N&Gray(i,j)==m-1&Gray(i,j+1)==n-1

                    P(m,n,1) = P(m,n,1)+1;

                    P(n,m,1) = P(m,n,1);

                end

                if i>1&j<N&Gray(i,j)==m-1&Gray(i-1,j+1)==n-1

                    P(m,n,2) = P(m,n,2)+1;

                    P(n,m,2) = P(m,n,2);

                end

                if i<M&Gray(i,j)==m-1&Gray(i+1,j)==n-1

                    P(m,n,3) = P(m,n,3)+1;

                    P(n,m,3) = P(m,n,3);

                end

                if i<M&j<N&Gray(i,j)==m-1&Gray(i+1,j+1)==n-1

                    P(m,n,4) = P(m,n,4)+1;

                    P(n,m,4) = P(m,n,4);

                end

            end

        end

        if m==n

            P(m,n,:) = P(m,n,:)*2;

        end

    end

end

% 对共生矩阵归一化

for n = 1:4

    P(:,:,n) = P(:,:,n)/sum(sum(P(:,:,n)));

end

%对共生矩阵计算能量、熵、惯性矩、相关性4个纹理参数

H = zeros(1,4);

I = H;

Ux = H;      Uy = H;

deltaX= H;  deltaY = H;

C =H;

for n = 1:4

    E(n) = sum(sum(P(:,:,n).^2)); %%能量

    for i = 1:16

        for j = 1:16

            if P(i,j,n)~=0

                H(n) = -P(i,j,n)*log(P(i,j,n))+H(n); %%熵

            end

            I(n) = (i-j)^2*P(i,j,n)+I(n);  %%惯性矩

           

            Ux(n) = i*P(i,j,n)+Ux(n); %相关性中μx

            Uy(n) = j*P(i,j,n)+Uy(n); %相关性中μy

        end

    end

end

for n = 1:4

    for i = 1:16

        for j = 1:16

            deltaX(n) = (i-Ux(n))^2*P(i,j,n)+deltaX(n); %相关性中σx

            deltaY(n) = (j-Uy(n))^2*P(i,j,n)+deltaY(n); %相关性中σy

            C(n) = i*j*P(i,j,n)+C(n);             

        end

    end

    C(n) = (C(n)-Ux(n)*Uy(n))/deltaX(n)/deltaY(n); %相关性   

end

%求能量、熵、惯性矩、相关性的均值和标准差作为最终8维纹理特征

a1 = mean(E) ;  

b1 = sqrt(cov(E));

a2 = mean(H) ;

b2 = sqrt(cov(H));

a3 = mean(I);  

b3 = sqrt(cov(I));

a4 = mean(C);

b4 = sqrt(cov(C));

T=[a1,a2,a3,a4,b1,b2,b3,b4];

T=T/sum(T);



