function [segment] = my_fast_detector(img,t)
    [m,n]=size(img);
    segment = zeros(m,n);
    bright = zeros(m,n);
    dark = zeros(m,n);
    img_bright = img + t;
    img_dark = img - t;
        
    value = circshift(img,3,1) > img_bright;
    bright = bright+value;
    value = circshift(img,3,1) < img_dark;
    dark = dark+value;
        
    value = circshift(img,-3,1) > img_bright;
    bright = bright+value;
    value = circshift(img,-3,1) < img_dark;
    dark = dark+value;
        
    value = circshift(img,3,2) > img_bright;
    bright = bright+value;
    value = circshift(img,3,2) < img_dark;
    dark = dark+value;
        
    value = circshift(img,-3,2) > img_bright;
    bright = bright+value;
    value = circshift(img,-3,2) < img_dark;
    dark = dark+value;
        
     for x=1:m
         for y=1:n
             if bright(x,y) >= 3 || dark(x,y) >= 3
                 segment(x,y) = 1;
             end
         end
     end
end

% sob = [-1 0 1; -2 0 2; -1 0 1];
% gaus = fspecial('gaussian', 5, 1);
% dog = conv2(gaus,sob);
% ix = imfilter(seg, dog);
% iy = imfilter(seg, dog');
% ix2g = imfilter(ix .* ix, gaus);
% iy2g = imfilter(iy .* iy, gaus);
% ixiyg = imfilter(ix .* iy, gaus);
% harcor = ix2g .* iy2g - ixiyg .* ixiyg - 0.05 * (ix2g+iy2g) .^2;
% localmax = imdilate(harcor, ones(3));
% imshow((harcor == localmax) .* (harcor > 0.0001));

% SURF sample
%points1 = detectSURFFeatures(I1);
%points2 = detectSURFFeatures(I2);
%[f1,vpts1] = extractFeatures(I1,points1);
%[f2,vpts2] = extractFeatures(I2,points2);
%indexPairs = matchFeatures(f1,f2) ;
%matchedPoints1 = vpts1(indexPairs(:,1));
%matchedPoints2 = vpts2(indexPairs(:,2));
%showMatchedFeatures(I1,I2,matchedPoints1,matchedPoints2);