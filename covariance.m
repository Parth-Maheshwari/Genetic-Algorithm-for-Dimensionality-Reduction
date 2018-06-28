function covar_mat = covariance( Image )
% this function calculates the covariance matrix of all the bands.

% A = [5 7 8 5; 0 1 9 4; 4 3 6 2]
% A(:,:,2) = [1 0 4 2; 3 5 6 7; 9 8 7 5]
%Image = A;
dim = size(Image);


temp = zeros(dim(1)*dim(2),1);

ret_mat = temp;

i=1;
b=1;

% Stacking up pixels of a band such that the row corresponds to the pixels
% and column corresponds to the bands.
while b<=dim(3)
    im=Image(:,:,b);
    if(b==1)
        while i<=dim(1)*dim(2)
            ret_mat(i,1)=im(i);
            i=i+1;
            
        end
    else
        i=1;
        while i<=dim(1)*dim(2)
            temp(i,1)=im(i);
            i=i+1;
        end
        ret_mat = [ret_mat,temp];
    end 
    b=b+1;
end

%Normalizing the data, making mean =0;

mbar = mean (ret_mat);
i=1;
while i<=dim(3)
    j=1;
    while j<=dim(1)*dim(2)
        ret_mat(j,i) = ret_mat(j,i) - mbar(i);
        j=j+1;
    end
i=i+1;    
end
ret_mat;

% Calculating the covariance of the normalized matrix
covar_mat = cov(ret_mat);

end