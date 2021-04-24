clc;
clear all;
close all;
load ('USPS-dataset.mat');
fprintf('size of matrix A');
disp(size(A))

[U, S ,V]=svd(A);
fprintf('size of U');
disp(size(U));
fprintf('size of S');
disp(size(S));
fprintf('size of V');
disp(size(V));
%disp(V);
n=input('enter the count of principal componenets');
error1_arr=zeros(1,n);
%error2_arr=zeros(1,n);
P=zeros(1,n);
A2 = reshape(A(1000,:), 16, 16);
subplot(1,n,1);
imshow(A2');
% A2_arr_recons=zeros(size(A2));
for i=1:n
    p=input('enter the value of principal component');
    
    Y=V(:,1:p);
    fprintf('Size of matrix Y of order (features * p)')
    disp(size(Y));
    
    A_redx=A*Y;
    fprintf('Size of reduction matrix of A of order (n * p)')
    disp(size(A_redx));
    
    A_recons=A_redx*Y';
    fprintf('Size of reconstructed matrix of A of order (n * f)')
    disp(size(A_recons));
    
    % finding the error through frbenius norm between A and A reconstructed.
    Error_Mat=A- A_recons;
    error1=norm(Error_Mat,'fro')^2;
    error1_arr(i)=error1;
    % implementing error thorugh trace
    %error2=trace(Error_Mat'*Error_Mat);
    %error2_arr(i)=error2;
    
    P(i)=p;
    subplot(1,n+1,i+1); % 1st row allocated for initial image so na+1 for successive iterations
    
    A2_recons = reshape(A_recons(1000,:), 16, 16);
   % Reconstructed image in each iteration of given image
    imshow(A2_recons');
    

end
figure()
plot(P,error1_arr);
%plot(P,error2_arr);
grid on

legend('error1');
xlabel('Principle components');
ylabel('error');