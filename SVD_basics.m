% Aim of this code - To see the basic usage of SVD
% author - Jishnu Goswami, MS Engg., EMU

% adopted from Steve brunton's youtube lecture
% link to the lecture - https://www.youtube.com/watch?v=QQ8vxj-9OfQ&list=PLMrJAkhIeNNSVjnsviglFoY2nXildDCcv&index=6

%% Singular value decomposition

% Reading the image of a dog
img = imread('dog.jpg') ;

% Converting the image to grayscale image
img_gray = rgb2gray(img) ;

% converting the gray scale image to double precision value from uint8
img_gray = double(img_gray) ;

% Visualizing the images
subplot(1,1,1)
imagesc(img_gray),axis off
colormap(gray)
title('Original Dog')
set(gcf,'position',[1400 100 1200 1600])

%% Computing the economy SVD

% Getting the data matrix to perform SVD
% In this case, we are computing SVD on the high resolution dog image
X = img_gray ;
[U,S,V] = svd(img_gray,'econ') ;

%% Visualizing different rank r matrix approximation
[n_row,n_col] = size(X) ;

for i=1:4
    r1=[n_col,5,20,100] ;
    X_approx = U(:,1:r1(i))*S(1:r1(i),1:r1(i))*V(:,1:r1(i))' ;
    subplot(2,2,i)
    imagesc(X_approx)
    axis off
    colormap('gray')
    if i ==1
        title('Original Image',fontsize=14,color='blue')
    else
        title('r= '+string(r1(i))+' approximation',fontsize=14,color='blue')
    end
    
end

%% Plotting the singular values
subplot(1,2,1)
semilogy(diag(S),linewidth=1.5,color='black')
xlabel('rank r values',fontsize=12,color='blue')
ylabel('Singular Values',fontsize=12,color='blue')

subplot(1,2,2)
cum_sum_S = cumsum(diag(S)) ;
semilogy(cum_sum_S,LineWidth=1.5,color='black')
xlabel('rank r values',fontsize=12,color='blue')
ylabel('Cummulative Sum of Singular Values',fontsize=12,color='blue')

%% Correlation matrices
x_xT = X*X' ;
xT_x = X'*X ;

subplot(1,2,1)
imagesc(x_xT)
axis off
colormap('gray')

subplot(1,2,2)
imagesc(xT_x)
axis off
colormap('gray')
