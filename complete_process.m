%% Converting Image to MIF

clear all; 
close all;
image_size=255*255;
image_name='aishwarya_255.png';
img=imread(strcat('.\originals\',image_name));
figure(1);
imshow(img);
title('Original');
h = gca;
h.Visible = 'On';


img=reshape(img,[1,image_size]);
output=zeros(1,image_size);
for i=1:image_size
    output(i)=img(i);
end
%%create mif file
dfv = image_size;
fid = fopen(('original_image.mif'),'w');
str = 'WIDTH=8;\nDEPTH=65536;\n\nADDRESS_RADIX=UNS;\nDATA_RADIX=UNS;\n\n';
fprintf(fid,str);
str = 'CONTENT BEGIN';
fprintf(fid,'%s\n',str);
%n = 0;
for k=1:image_size
    fprintf(fid,'%d : %d;\n',k-1,output(k));
   % n=n+1;
end
fprintf(fid,'END;\n');
fclose(fid);

%% Downsampled Image Displaying

image_size=127*127;
line_size=127;

fo=fopen('downsampled_image.hex','r');
image=zeros(1,image_size);

for i=1:image_size
    line=fgetl(fo);
    image(i)=(sscanf(line(10:11),'%x'));
end
image=reshape(image,line_size,line_size);
image=uint8(image);
%figure;
%imshow(image);
%title('Downsampled Image');
%h = gca;
%h.Visible = 'On';


%% Error Analysis

im =double(imread(strcat('.\originals\',image_name)));
% im=ones(255,255)*100;
out=zeros(1,127*127);
index=1;
for i=1:2:253
    for j=1:2:253
        
        out(index)=(im(i,j)+2*im(i,j+1)+im(i,j+2)+2*im(i+1,j)+4*im(i+1,j+1)+2*im(i+1,j+2)+im(i+2,j)+2*im(i+2,j+1)+im(i+2,j+2))/16;
        index=index+1;
        
    end
end
 simulated_image=reshape(out,[127,127]);
 simulated_image=uint8(simulated_image);
 simulated_image=transpose(simulated_image);
 
 figure;
 imshow(simulated_image);
 title('Downsampled Image');
 h = gca;
h.Visible = 'On';
 
 figure;
 imshow(simulated_image);
 title('Downsampled using MATLAB');
 h = gca;
h.Visible = 'On';
 
 error=sum(sum(abs(image-simulated_image)))*0
  