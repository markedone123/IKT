%2D FFT Demo

%import images
imageA = rgb2gray(imread('imageA1','jpg'));
imageB = rgb2gray(imread('imageB1','jpg'));

%display images
figure, imshow(imageA)
title('Image A: Magic Ball - Dali ')
figure, imshow(imageB)
title('Image B: Infinite Gratitude - Magritte')

%Perform 2D FFTs
fftA = fft2(double(imageA));
fftB = fft2(double(imageB));

%Display magnitude and phase of 2D FFTs
figure, imshow(abs(fftshift(fftA)),[24 100000]), colormap gray
title('Image A FFT2 Magnitude')
figure, imshow(angle(fftshift(fftA)),[-pi pi]), colormap gray
title('Image A FFT2 Phase')
figure, imshow(abs(fftshift(fftB)),[24 100000]), colormap gray
title('Image B FFT2 Magnitude')
figure, imshow(angle(fftshift(fftB)),[-pi pi]), colormap gray
title('Image B FFT2 Phase')

%Switch magnitude and phase of 2D FFTs
fftC = abs(fftA).*exp(i*angle(fftB));
fftD = abs(fftB).*exp(i*angle(fftA));

%Perform inverse 2D FFTs on switched images
imageC = ifft2(fftC);
imageD = ifft2(fftD);

%Calculate limits for plotting
cmin = min(min(abs(imageC)));
cmax = max(max(abs(imageC)));

dmin = min(min(abs(imageD)));
dmax = max(max(abs(imageD)));

%Display switched images
figure, imshow(abs(imageC), [cmin cmax]), colormap gray
title('Image C  Magnitude')
figure, imshow(abs(imageD), [dmin dmax]), colormap gray
title('Image D  Magnitude')

%Save images
saveas(1,'imageA.png')
saveas(2,'imageB.png')
saveas(3,'imageAfftmag.png')
saveas(4,'imageAfftpha.png')
saveas(5,'imageBfftmag.png')
saveas(6,'imageBfftpha.png')
saveas(7,'imageC.png')
saveas(8,'imageD.png')


