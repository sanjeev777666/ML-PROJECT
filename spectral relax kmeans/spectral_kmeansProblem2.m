clc;
close all;
X=load('kmeans_datasetXY.m');
k_count=input('enter the count of clusters ');
disp(size(X))
%X=X';
[U, S, V]=svd(X);
disp(size(U));
disp(U)
disp(size(S));
%disp(S)
disp(size(V));
%disp(V)
Y=U(:,1:k_count);
disp(Y);

Y_star=Y*V(1:k_count,1:k_count);
disp(Y_star);
disp(size(Y_star));
% [d,ind] = sort(diag(D),'descend');
% Ds = D(ind,ind);
% Vs = V(:,ind);
% disp(Vs)
% %disp(size(A));
% disp(Ds)
% %disp(Ds(size(Ds,1),size(Ds,1)));
% k1_mat=Vs(:,1:k_count);
% %%% perfromed Dimensionality reduction of matrix thorugh Spectral K means
% %disp(k1_mat);
% Y_star=k1_mat*
% Z=k1_mat'*(X')*X*k1_mat;
% sum1=trace(Z);
% fprintf('the trace of the maximization problem');
% disp(sum1)
% 
x=load('spectral_kmeansX.m');
y=load('spectral_kmeansY.m');
%x=input('Enter the x coordinate of the sequence:');
%y=input('Enter the y coordinate of the sequence:');
x=x';
y=y';
% no of clusters is set to 2
k=2;
m1_newx=input('xCord1  from the given dataset to form 1st cluster');
m1_newy=input('yCord1 from the given dataset to form 1st cluster ');
m2_newx=input('xCord2 from the given dataset to form 2nd cluster');
m2_newy=input('yCord2 from the given dataset to form 2nd cluster');
temp=0;
k1x=[];
k1y=[];
k2x=[];
k2y=[];
while(temp==0)
    cx=[m1_newx m2_newx];
    m1_oldx=cx(1);%m1_oldx=m1_newx
    m2_oldx=cx(2);%m2_oldx=m2_newx
    cy=[m1_newy m2_newy];
    m1_oldy=cy(1);%m1_oldy=m1_newy
    m2_oldy=cy(2);%m2_oldy=m2_newy
    for i=1:length(x)
        xx1=(x(i)-m1_oldx)^2;
        yy1=(y(i)-m1_oldy)^2;
        g=xx1+yy1;
        g1=sqrt(g);
        xx2=(x(i)-m2_oldx)^2;
        yy2=(y(i)-m2_oldy)^2;
        g=xx2+yy2;
        g2=sqrt(g);
        if(g1>g2)
            k2x=[k2x x(i)];
            k2y=[k2y y(i)];
        else
            k1x=[k1x x(i)];
            k1y=[k1y y(i)];
        end
    end
    m1_newx=mean(k1x);
    m2_newx =mean(k2x);
    m1_newy=mean(k1y);
    m2_newy =mean(k2y);
    if(m1_newx ~=m1_oldx && m2_newx ~=m2_oldx && m1_newy ~=m1_oldy && m2_newy ~=m2_oldy)
        k1x=[];
        k2x=[];
        k2y=[];
        k1y=[];
    else
        temp=1;
    end
end
for i=1:length(k1x)
    t=0:0.01:2*pi;
    x=k1x(i)+0.0001*cos(t);
    y=k1y(i)+0.0001*sin(t);
    axis([-0.04 0.1 0 0.1])
%     fill(x,y,'r');
    scatter(x,y,'b');
    
    hold on;
    grid on;
end
hold on;
for i=1:length(k2x)
    t=0:0.1:2*pi;
    x=k2x(i)+0.0001*cos(t);
    y=k2y(i)+0.0001*sin(t);
    axis([-0.04 0.1 0 0.1])
 %      fill(x,y,'g');
    scatter(x,y,'r');
    hold on;
    grid on;
    xlabel('x');
    ylabel('y');
    legend('spectral k means');
end
