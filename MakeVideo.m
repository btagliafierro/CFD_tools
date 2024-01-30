clear; close all; fclose all;

videoOut = VideoWriter('t','MPEG-4'); %create the video object
videoOut.Quality = 100;
videoOut.FrameRate=20;
open(videoOut);
name='location_where_the_files_are/yyy.';
dt=0.1;

for ii=0:600
   disp(ii)
  %I = im2double(imread(['' name num2str(ii,'%i') '.png'])); 
  I = (imread(['' name num2str(ii,'%04i') '.png'])); 
  %   I=imresize(I,[1920 1080]);
   I=I(1:end,1:end-0,:);
    position =  [10 80];
    value = ['Time= ' num2str(ii*dt,'%02.2f') ' s'];
    I = insertText(I,position,value,'AnchorPoint','LeftBottom','Font','LucidaBrightRegular','BoxColor','w','FontSize',20 );
  writeVideo(videoOut,I);
  
end
close(videoOut); 
