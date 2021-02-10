%fixing n  = 10 and p = 0.1
clc
n = 10;
p = 0;

m = zeros(3, n);
for i = 1:n
    
    A = binornd(n, p, [3 3]);
    A = (-1).^randi(2, size(A))  .* A;
    B = binornd(n, p, [3 1]);
        
    if( det(A) ~= 0)
        X = inv(A)*B;
        X(isnan(X))=0;
        m(1, c) = X(1);
        m(2, c) = X(2);
        m(3, c) = X(3);
        
    else
        continue;
    end
    
    
    p = p+0.1;
end

s = sum(m, 2)

mean1 = s(1,1)/n
mean2 = s(2,1)/n
mean3 = s(3,1)/n

%%
p_vec = 0:0.1:2;
tiledlayout(3,1) % Requires R2019b or later

% Top plot
nexttile
plot(p_vec, mean1, '-o');
title("mean x1 vs p");

% Middle plot
nexttile
plot(p_vec, mean2, '-o');
title("mean x2 vs p");

%bottom plot
nexttile
plot(p_vec, mean3, '-o');
title("mean x3 vs p");




