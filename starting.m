clc;
close all;
clear all;
clearvars;
a=load('C:\Users\FIREBIRD\Desktop\GA\Draive Shared\Indian_pines.mat');
                                           %Loadint .mat version of Indian_pines There cane be
                                           %more than one matrices in .mat
Image=a.indian_pines;                      % Load indian_pines /  salinas_corrected   

% r=mat2gray(Image(:,:,50));               
% g=mat2gray(Image(:,:,27));
% b=mat2gray(Image(:,:,17));
% FCC=cat(3,r,g,b);
% figure(1)
% title('False Colour Composite')
% imshow(FCC)
                                          % to display the fcc of the %image
datasize = size(Image);                         % the size of the image

covar_mat = covariance(Image);


retained = 10;                             % no of bands to be retained i.e. feature selection

pool_size = 100;                          % No of Candidates in a pool.

pool = zeros(pool_size*2,datasize(3)+2);   % pool of candidates i.e. total candidates with all entries as 0
                        
% Initialising all candidates with randomly distributed ones depicting the
% location as the bands which will be retained.

generation = 200;
cross_fact=0.35;
mut_fact=0.05;
fit_fact=1;
random1=80;

i=1;                                        
while i<=pool_size*2;
    pool(i,:) = initialisation( pool(i,:) , retained, covar_mat , fit_fact);
    i=i+1;
end
%sum(sum(pool));

%Selection
% pool = selection(pool(:,:), pool_size , random1);

% tic
% igen=1;
% while igen<=generation
%     %crossover
%     
%      pool = crossover ( pool(:,:) , retained , pool_size,covar_mat , cross_fact , fit_fact);
%     
% 
%     % Crossovering the 50% of candidates of the whole pool
%     % The entries with 0 in the mu/cross index column (cell) will be 
%     % used in crossovers. The parents and child both are kept in the pool.
% 
%     % Mutation
%   
%     pool = mutation(pool(:,:),retained, pool_size, covar_mat , mut_fact , fit_fact);
%  
% 
%     % Mutating the 2% of candidates of the whole pool, the argument is the pool.
%     % The entries with last column 1 are mutated or crossovered entries.
%     % the entries with 0 in the last column denotes untouched entries. The
%     % mutated and original candidates coexist in the pool.
%     
%     %Selection
%     pool = selection(pool(:,:), pool_size , random1);
% 
%     igen=igen+1;
% end
% toc
% 
% pool=sortrows(pool,-(size(pool,2)-1)); %one last time sorting before selecting the top band
% 
% 
% bands = zeros(1,retained);           %a band array of a candidate
% i=1;
% j=1;
% while i<=length(pool(1,:))-2         % running till the candidate's last band
%     if(pool(1,i)==1)
%         bands( j ) = i;         % converting ones into band nos by noting down the index of ones.
%         j=j+1;
%     end
%     i=i+1;
% end
% bands

% ca = Classification_accuracy(bands);