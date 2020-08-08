# FromantEstimation
This project aims to estimate the formant frequencies of speech signals using Linear Predictive Coding (LPC) approach.
LPC analysis is usually most appropriate for modeling vowels which are periodic, except nasalized vowels.
Given code is tested for more than 15 samples and result obtained matched with the formant frequencies of corresponding sounds.

DOCUMENTATION OF FUNCTIONS USED

1.audioread
Syntax:	[y,Fs] = audioread(filename,samples)

Input Parameters: Filename :Name of file to read
		  Samples : Audio samples to read
           
Output Parameters: y : Audio data, matrix
        	   Fs :Sample rate


2.audiowrite
Syntax:	audiowrite(filename,y,Fs) 
	
Input Parameters: Filename :Name of file to write
	          y :Audio data to write matrix
	          Fs :Sample rate
	
Output Parameters: Audio file created
	
3.spectrogram
Syntax:	s = spectrogram(x,window,noverlap,nfft)
	
Input Parameters: x : Input signal
		  window : Window
		  noverlap : Number of overlapped samples
		  nfft : Number of DFT points

Output Parameters: uses nfft sampling points to calculate the discrete Fourier transform
	
4.hamming 
Syntax:	w= hamming(L) 

Input Parameters: L :window length, positive integer
	 
Output Parameters: W :  L-point symmetric Hamming window


5.filter
Syntax:	y = filter(b,a,x)


Input Parameters: b : Numerator coefficients of rational transfer function
		  a : Denominator coefficients of rational transfer function
		  x : Input data


Output Parameters: returns the filtered data as a vector of the same size as x.
	
6.lpc
Syntax:	[a,g] = lpc(x,p)

Input Parameters: p : order of the prediction filter polynomial
	 	  X :  real-valued time series 
	
Output Parameters: coefficients of a forward linear predictor by minimizing the prediction error in the least squares sense

7.roots
Syntax:	r= roots(p)

Input Parameters: p :Polynomial coefficients

Output Parameters: r: roots of the polynomial represented by p


8.sort
Syntax:	B= sort(A)

Input Parameters: A :Input array
	
Output Parameters: B :Sorted array
