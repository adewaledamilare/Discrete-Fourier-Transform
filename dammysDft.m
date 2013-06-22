
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Discrete Fourier Transform To Perform Different Operations %%
%%                                                            %%
%% According to the User's Request.                           %%
%%                                                            %%
%% By Adewale Damilare Ezekiel,                               %%
%%                                                            %%
%% MSc Computer Systems Engineering                           %%
%%                                                            %%
%% Enrolment Number: 1030828                                  %%
%%                                                            %%
%% 16th November 2012                                         %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Dammy's DFT Function                                                     %%
%%                                                                          %%
%% This function is used to compute the values of DFT in all other functions%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [Q] = dammysDft(z,N)
clc
Q = zeros(N, 1);
for t = 0:N - 1
    omega_t = 2 * pi * t/N;
    for n = 0:N - 1
        Q(t + 1) = Q(t + 1) + z(n + 1) * exp ( - j * n * omega_t);
    end
end
