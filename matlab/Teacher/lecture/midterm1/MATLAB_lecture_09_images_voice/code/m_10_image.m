<<<<<<< HEAD
x = size(I);
I2 = I;
for i = [1:x(1)]
    f = i/x(1);
    for j = [1:x(2)]
        v = sum(I2(i,j,:))/3;
        I2(i,j,:) = v;
    end
end
imshow(I2);

x = size(I);
I2 = I;
for i = [1:x(2)]
    if (i < x(2)/2) 
        f = i/x(2)*5;
    else
        f = 5-i/x(2)*5;
    end
    I2(:,i,:) = I(:,i,:)*f;
end
imshow(I2);

I2(:,1:100,:) = 50;
imshow(I2);

[~, threshold] = edge(G, 'sobel');
fudgeFactor = .5;
BWs = edge(G,'sobel', threshold * fudgeFactor);
=======
x = size(I);
I2 = I;
for i = [1:x(1)]
    f = i/x(1);
    for j = [1:x(2)]
        v = sum(I2(i,j,:))/3;
        I2(i,j,:) = v;
    end
end
imshow(I2);

x = size(I);
I2 = I;
for i = [1:x(2)]
    if (i < x(2)/2) 
        f = i/x(2)*5;
    else
        f = 5-i/x(2)*5;
    end
    I2(:,i,:) = I(:,i,:)*f;
end
imshow(I2);

I2(:,1:100,:) = 50;
imshow(I2);

[~, threshold] = edge(G, 'sobel');
fudgeFactor = .5;
BWs = edge(G,'sobel', threshold * fudgeFactor);
>>>>>>> 542a0a8303d7514c52d858d6ed680356c059c9eb
figure, imshow(BWs), title('binary gradient mask');