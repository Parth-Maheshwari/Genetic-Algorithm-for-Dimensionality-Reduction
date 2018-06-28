function cand = initialisation( cand, ret, covar_mat , fit_fact )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here


j=1;                                        % initialising a candidate with 
while j<=ret                               % no of 1's should be equal "ret"
    temp = round(rand * (length(cand)-2)); % geterating random integer which will be used as bands to
    if temp==0
        temp = 1;
    end                                  % be retained. The band are denoted by 1s in the array. 
    if cand(1,temp)==0                       
      cand(1,temp)=1;                       % putting 1s at random index (band)
      j=j+1;
    end
end                          
clear j;
clear temp;
cand = fitness(cand, ret, covar_mat , fit_fact);    % Calculating the fitness of initialised candidate.
end

