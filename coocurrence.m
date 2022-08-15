function T =coocurrence(Image)

% Color= imread(Image);

% Gray=rgb2gray(Color);
Gray=Image;

[M,N] = size(Gray);

%Ϊ�˼��ټ���������ԭʼͼ��Ҷȼ�ѹ������Gray������16��

for i = 1:M

    for j = 1:N

        for n = 1:256/16

            if (n-1)*16<=Gray(i,j)&Gray(i,j)<=(n-1)*16+15

                Gray(i,j) = n-1;

            end

        end

    end

end

%�����ĸ���������P,ȡ����Ϊ1���Ƕȷֱ�Ϊ0,45,90,135

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

% �Թ��������һ��

for n = 1:4

    P(:,:,n) = P(:,:,n)/sum(sum(P(:,:,n)));

end

%�Թ�����������������ء����Ծء������4����������

H = zeros(1,4);

I = H;

Ux = H;      Uy = H;

deltaX= H;  deltaY = H;

C =H;

for n = 1:4

    E(n) = sum(sum(P(:,:,n).^2)); %%����

    for i = 1:16

        for j = 1:16

            if P(i,j,n)~=0

                H(n) = -P(i,j,n)*log(P(i,j,n))+H(n); %%��

            end

            I(n) = (i-j)^2*P(i,j,n)+I(n);  %%���Ծ�

           

            Ux(n) = i*P(i,j,n)+Ux(n); %������Ц�x

            Uy(n) = j*P(i,j,n)+Uy(n); %������Ц�y

        end

    end

end

for n = 1:4

    for i = 1:16

        for j = 1:16

            deltaX(n) = (i-Ux(n))^2*P(i,j,n)+deltaX(n); %������Ц�x

            deltaY(n) = (j-Uy(n))^2*P(i,j,n)+deltaY(n); %������Ц�y

            C(n) = i*j*P(i,j,n)+C(n);             

        end

    end

    C(n) = (C(n)-Ux(n)*Uy(n))/deltaX(n)/deltaY(n); %�����   

end

%���������ء����Ծء�����Եľ�ֵ�ͱ�׼����Ϊ����8ά��������

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


