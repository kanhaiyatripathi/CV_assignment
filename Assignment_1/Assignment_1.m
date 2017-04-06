clear;
pen1=imread('input.jpg');   
ref1=imread('reference.jpg');
pen=rgb2gray(pen1);
ref=rgb2gray(ref1);
[rows1 columns1] = size(pen);
[rows2 columns2] = size(ref);
%find the index of intitial point of pen
for i=1:rows1
    for j=1:columns1
        flag=1;
        if pen(i,j)<70
            x=i;
            y=j;
            flag=0;
        end
        if flag==0
            break;
        end
    end
    if flag==0
        break;
    end
end
%find the index of final point of pen
for i=rows1:-1:1
    for j=columns1:-1:1
        flag=1;
        if pen(i,j)<70
            x1=i;
            y1=j;
            flag=0;
        end
            if flag==0
        break;
    end
    end
    if flag==0
        break;
    end
end
%mark the initial and final point of pen with color
for j=-20:20
    for i=-100:100
        % fill a color of RGB is (250,62,150)
        pen1(j+x,i+y,1)=255;
        pen1(j+x,i+y,2)=62;
        pen1(j+x,i+y,3)=150;
        pen1(j+x1,i+y1,1)=255;
        pen1(j+x1,i+y1,2)=62;
        pen1(j+x1,i+y1,3)=150;
    end
end
% show original photo with mark
imtool(pen1); 
% calculate length of pen in pixel
lengthOfpenINpixel=sqrt((x-x1)^2 + (y-y1)^2); 
%find the index of intitial point of reference object
for i=1:rows2
    for j=1:columns2
        flag=1;
        if ref(i,j)<70
            x=i;
            y=j;
            flag=0;
        end
        if flag==0
            break;
        end
    end
    if flag==0
        break;
    end
end
flag=1;
%find the index of intitial point of reference object
for i=rows2:-1:1
    for j=columns2:-1:1
        flag=1;
        if ref(i,j)<70
            x1=i;
            y1=j;
            flag=0;
        end
        if flag==0
            break;
        end
    end
    if flag==0
        break;
    end
end
%mark the initial and final point of reference with a color
for j=-20:20
    for i=-100:100
        % fill a color of RGB is (250,62,150)
        ref1(j+x,i+y,1)=255;
        ref1(j+x,i+y,2)=62;
        ref1(j+x,i+y,3)=150;
        ref1(j+x1,i+y1,1)=255;
        ref1(j+x1,i+y1,2)=62;
        ref1(j+x1,i+y1,3)=150;
    end
end
imtool(ref1);
Length_pixel = sqrt((x-x1)^2 + (y-y1)^2);
orignal_Length_OF_ref = 45;
Length_mm = (orignal_Length_OF_ref*lengthOfpenINpixel)/Length_pixel;

fileID = fopen('output.txt','w');
fprintf(fileID,'Length of reference object(in pixel) : %d\n',Length_pixel);
fprintf(fileID,'Length of pen(in pixel) : %d\n',lengthOfpenINpixel);
fprintf(fileID,'Length of pen (in mm) : %d\n',Length_mm);
fprintf(fileID,'Length of pen (in cm) : %d\n',Length_mm/10);
