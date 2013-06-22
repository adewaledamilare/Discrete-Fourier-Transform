
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Discrete Fourier Transformation program                    %%
%%                                                            %%
%% To Generate Different Different Spectra                    %%
%%                                                            %%
%% According to the User's Request.                           %%
%%                                                            %%
%% By Adewale Damilare Ezekiel                                %%
%%                                                            %%
%% MSc Computer Systems Engineering                           %%
%%                                                            %%
%% Enrolment Number: 1030828                                  %%
%%                                                            %%
%% 16th November 2012                                         %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Question 1a                                                  %%
%% Note :- Question 1a Parameters :(Sampling Frequency)Fs=20000,%%
%% n_min=0, Amplitude=15, num_of_samples=200, frequency=2000    %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Question 1b                                                  %%
%% Note :- Question 1b Parameters: (Sampling Frequency)Fs=20000,%%
%% n_min=0, Amp=0:20, num_of_samples=200, frequency=500         %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Question 1c                                                 %%     
%% Note:- Question 1c Parameters: (Sampling Frequency)Fs=20000,%%
%% n_min=0, Amp=10, num_of_samples=200, frequency=5050         %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Introduce to the user what the program does, and the default values of
%% the parameters
function dft_Solution_All_Combined
clear
clc
disp('This program helps you to select which DFT Spectra you would like to generate');
disp(' ');
disp('FOR SIMPLICITY, THE DEFAULT PARAMETERS FOR EACH OPTIONS ARE GIVEN BELOW');
disp(' ');
disp('Note :- Question 1a Parameters : Fs=20000, n_min=0, Amp=15, num_of_samples=200, f=2000');
disp('--------------------------------------------------------------------------------------');
disp(' ');
disp('Note :- Question 1b Parameters : Fs=20000, n_min=0, Amp=0:20, num_of_samples=200, f=500');
disp('----------------------------------------------------------------------------------------')
disp(' ');
disp('Note :- Question 1c Parameters : Fs=20000, n_min=0, Amp=10, num_of_samples=200, f=5050');
disp('--------------------------------------------------------------------------------------');
disp(' ');

%% Retrieve the approriate parameters from the program user
disp('First of all, Let us know our Sampling Frequency');
disp('------------------------------------------------');
Fs = input('What is your Sampling Frequency? : ');
disp(' ');

disp('Next, We Need some details about the graph to be plotted');
disp('--------------------------------------------------------');
n_min = input('Where would you like your graph to start plotting from? : ');

%% Test whether the user has specified that the program should start from%%
%% the origin. If not, ask the user to select the zero origin            %%
while(n_min~=0)
    disp('Sorry, the starting point of the graph must be at the zero origin');
    n_min = input('Where would you like your graph to start plotting from? : ');
end
disp(' ');

disp('Now, how many samples do you have at hand');
disp('-----------------------------------------');
num_of_samples = input('How many samples do you have? : ');
disp(' ');

disp('How Frequent are these samples you supplied above');
disp('-------------------------------------------------');
f = input('What is the frequency? : ');
disp(' ');

Amp = input('What is the Amplitude? : ');
disp(' ');

%% Declare and initialize the needed variables accordingly
dF = Fs/num_of_samples;    %Frequency Resolution

sampling_period = 1/Fs;    %T

n_max = num_of_samples;

n_vector = [n_min:n_max];

%% Interact with the user in order to know which graph to be plotted
disp('Which type of Graph would you like to plot?');
disp(' ');
disp('Type c or C to plot Cosine Wave');
disp(' ');
disp('Type q or Q to plot Square Wave');
disp(' ');
disp('Type s or S to plot Sine Wave');
disp(' ');
chosen_type = input('Which type of Graph? : ','s');

%% Test whether the user has selected out of the permitted range on choices
%% that is made available, if not, refuse to continue and ask again
while ~((chosen_type=='c')||(chosen_type=='C')||(chosen_type=='s')||(chosen_type=='S')||(chosen_type=='q')||(chosen_type=='Q'))
  disp('Sorry, an unavailable character has been selected, please check the available options above')
  chosen_type = input('Which type of Graph? : ','s');
end
  %% Test the type of graph selected by the user and perform the needed
  %% calculation accordingly

%% Test if the option selected is to plot a square wave  
if(chosen_type=='q')||(chosen_type=='Q')
    x = Amp*[sin(2*pi*f*[0:num_of_samples]*sampling_period)]; %A*Sin(2*Pi*f*T)
    N = length (x);
    N2 = round (N/2);
    x = ones(N, 1);
    x(N2+1:N) = - 1 * ones(N - N2, 1);   
end

%% Test if the option selected is to plot a Cosine wave
if(chosen_type=='c')||(chosen_type=='C')
    x = Amp*[cos(2*pi*f*[0:num_of_samples]*sampling_period)];
    N = length (x);
end

%% Test if the option selected is to plot a Sine wave
if(chosen_type=='s')||(chosen_type=='S')
    x = Amp*[sin(2*pi*f*[0:num_of_samples]*sampling_period)];
    N = length (x);
end
   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Call the DFT function for the x samples dammysDft(x)%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
DammysSpectra = dammysDft(x,N);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Get The Scaling Factor of absolute Value of the New Spectra   %
%% Generated by the DFT function Dammys Spectra%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
W = 2*(abs(DammysSpectra)/N);

%% Plot the Input values
Hf_1 = figure;
set(Hf_1,'NumberTitle');
subplot(2,1,1);
H_s1 = stem(n_vector,x,'filled');
set(H_s1,'markersize',3);hold;
plot(n_vector,x);

%% Adjust the Amplitude of the waveform if a Square Plot is selected.
if(chosen_type=='q')||(chosen_type=='Q')
axis([-1,N+1,-1,1]);
else
axis([-1,N+1,-15,15]);
end
xlabel('n');
ylabel('x(n)');

%% Plot the Single-Sided output Spectra for the Amplitude and Frequencies
subplot(2,1,2); 
H_s2 = stem(n_vector/10,W','filled'); 
set(H_s2,'markersize',3);
axis([0,((N/2)+1)/10,0,max(W)+1]);
xlabel('Frequency(KHz)');
ylabel('Amplitude');
