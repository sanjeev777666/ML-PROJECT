clc
close all
x=load('kmeans_datasetX.m');
y=load('kmeans_datasetY.m');
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
    x=k1x(i)+0.01*cos(t);
    y=k1y(i)+0.01*sin(t);
    axis square
%     fill(x,y,'r');
    scatter(x,y,'r');
    hold on;
    
    grid on;
end
hold on;
for i=1:length(k2x)
    t=0:0.01:2*pi;
    x=k2x(i)+0.01*cos(t);
    y=k2y(i)+0.01*sin(t);
    axis square
 %      fill(x,y,'g');
    scatter(x,y,'b');
    hold on;
    grid on;
end