A=imread('cameraman.tif');
imshow(A);
j=imnoise(A,'salt & pepper',0.02);
imshow(j);
kaverage=filter2(fspecial('average',3),j)/255;
kmedian=medfilt2(j);
subplot(1,3,1),imshow(kaverage);
title('Median filter');

subplot(1,3,2),imshow(kmedian);
title('Average filter');


modifyA=padarray(A,[1 1]);
x=[1:3];
y=[1:3];
for i=1:size(modifyA,1)-2
    for k=1:size(modifyA,2)-2
        window=reshape(modifyA(i+x-1,k+y-1),[],1);
        j(i,k)=max(window);
        %j(i,k)=min(window);
    end
end
subplot(1,3,3),imshow(j);
title('max filter');
