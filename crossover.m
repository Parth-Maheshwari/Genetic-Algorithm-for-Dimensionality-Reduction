function pool = crossover( pool , ret, ncand, covar_mat , cross_fact , fit_fact)
%This function crossovers the candidates.

leng = size(pool,2);
ncross = ncand * cross_fact;                           % no of candidates for crossover derived from crossfact

x=1;
while x<=ncross
    k = round(rand * (ncand));              % generating 1st random no.
    if k==0
        k=1;
    end
    j = round(rand *(ncand));               % generating 2nd random no.
    if j==0
        j=1;
    end
    child1 = pool(k,:);                    % 1st random candidate
    child2 = pool(j,:);                    % 2nd random candidate
    if (child1(leng)==0 && child2(leng)==0)  % checks whether the random candidates are already
% not mutated or crossovered and proceed only if they aren't mutated.
        i=1;
        sum1=0;
        sum2=0;
        
        while ( i<=leng-2 )
            sum1 = child1(1,i) + sum1;          % start summing up 1s in 1s candidate
            sum2 = child2(1,i) + sum2;          % summing in second candidate
            if (sum1==sum2 && sum1~=i && sum1~=0 && (ret-sum1~=length(child1)-2-i) && sum1~=ret)
                % Allows crossovering when both the sum are equal and
                % either the left or Right part aren't equal to either 1s
                % or 0s
                temp = child1(1, 1:i);
                child1(1, 1:i) = child2(1, 1:i);
                child2(1, 1:i) = temp;          % crossover has happened
                % making children and parents' last cell 1
                pool(k, leng)=1;
                pool(j, leng)=1;
                child1(1,leng)=1;
                child2(1,leng)=1;
                x=x+1;
                
                %calculating fitness of children
                child1 = fitness(child1, ret, covar_mat , fit_fact);
                child2 = fitness(child2, ret, covar_mat , fit_fact);
                pool = [pool; child1; child2];
                break;
            end
            i=i+1;
        end
        
    end
    
end

end

