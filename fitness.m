function cand = fitness( cand, ret, covar_mat , fit_fact )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
% cand = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0]
% ret = sum(cand);
bands = ones(1,ret);           %a band array of a candidate
i=1;
j=1;
while i<=length(cand)-2         % running till the candidate's last band
    if(cand(i)==1)
        bands( j ) = i;         % converting ones into band nos by noting down the index of ones.
        j=j+1;
    end
    i=i+1;
end
bands;

ff=1;
i=1;

if fit_fact==1
    
    % determinant of covariance matrix
    temp = ones(ret);
    j=1;
    while (j<=ret)
        k=1;
        while (k<=ret)
            temp(j,k)=covar_mat(bands(j),bands(k));
            k=k+1;
        end
        j=j+1;
    end
    ff=det(temp);


    if ff<0
        ff=-1*ff;
    end
    ff=log(ff);
    
elseif fit_fact==2
    % PEARSON'S COEFFICIENT
    while i<ret
        x = bands(i);
        y = bands(i+1);
        ff = ff*sqrt(covar_mat(x,x))/covar_mat(x,y);
        i=i+1;
    end
    x=bands(i);
    ff = ff*sqrt(covar_mat(x,x));
    if ff<0
        ff=-1*ff;
    end
end


cand(length(cand)-1)=ff;
end

