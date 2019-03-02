function [bestEpsilon bestF1] = selectThreshold(yval, pval)
%SELECTTHRESHOLD Find the best threshold (epsilon) to use for selecting
%outliers
%   [bestEpsilon bestF1] = SELECTTHRESHOLD(yval, pval) finds the best
%   threshold to use for selecting outliers based on the results from a
%   validation set (pval) and the ground truth (yval).
%

bestEpsilon = 0;
bestF1 = 0;
F1 = 0;

stepsize = (max(pval) - min(pval)) / 1000;
for epsilon = min(pval):stepsize:max(pval)
    cvPredictions = pval < epsilon;   %creates a vector of 1s and 0s after comparing pval and epsilon
	tp = sum((cvPredictions == 1) & (yval == 1 )); %no.of examples that are true positive 
	fp = sum((cvPredictions == 1 ) & (yval == 0)); %no.of examples that are false positive
	fn = sum((cvPredictions == 0 ) & (yval == 1 )); %no.of examples that are false negative
	p = tp/(tp +fp); %precision
	r = tp/(tp+fn); %recall
	F1 = (2*p*r)/(p+r); %f1 Score
	
	
    % ====================== YOUR CODE HERE ======================
    % Instructions: Compute the F1 score of choosing epsilon as the
    %               threshold and place the value in F1. The code at the
    %               end of the loop will compare the F1 score for this
    %               choice of epsilon and set it to be the best epsilon if
    %               it is better than the current choice of epsilon.
    %               
    % Note: You can use predictions = (pval < epsilon) to get a binary vector
    %       of 0's and 1's of the outlier predictions













    % =============================================================

    if F1 > bestF1 %انت عايز ده يكون كبير عشان المعامل ده حلو  ومؤشر جيد ، فكل مرة لو لقاه اكبر هيحفظه و يكمل عليه و يقارن الجديد بيه
       bestF1 = F1; 
       bestEpsilon = epsilon;
    end
end

end
