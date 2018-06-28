function  pool  = mutation( pool, ret, ncand, covar_mat , mut_fact , fit_fact)
%This function will mutate a candidate.
%	ncand=size(pool,1);           % gives no of candidates
% mut_fact denotes the percentage of mutation slected through radiobutton.
nmut = ncand * mut_fact;                 % no of candidates for mutation
x=1;
while x<=nmut
    n = round(rand*(ncand));
    if n==0
        n=1;
    end
    j=0; k=0; l=0;                                 %Variables
    a=pool(n,:);
    if a(length(a))==0
        while l >= 0                                   %loop for mutation. function outputs only 1 mutated candidate
            l = l + 1;                                 
            m = round(rand*(length(a)-2));                    %Round-off
            if m==0
                m=1;
            end
            if a(m)==0 && j==0                         %Swap Mutation Convert 0 to 1
                a(m)=1;
                j=1;
            elseif a(m)==1 && k==0                     %Swap Mutation Convert 1 to 0
                 a(m)=0;
                k=1;
            elseif j==1 && k==1                                      %Stop Mutation
                break;
            end
        end
        a(length(a))=1;                                %Last cell as 1 shows candidate has 
                                                        %undergone mutation/crossover 
        x=x+1;
        pool(n,length(a))=1;
        a = fitness(a, ret, covar_mat , fit_fact);      % Calculating the fitness of child.
        pool = [pool ; a];
    end
    
end
end


