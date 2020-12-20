function [W,accuracy] = adaline()

prompt = 'It will run for binary or bi-polar inputs and bi-polar targets ,enter the X, the input matrix  ';
X = input(prompt)
prompt = 'enter the Y, the output vector  ';
y = input(prompt)

prompt = 'enter the number of epochs  ';
epoch = input(prompt)
prompt = 'enter the alpha, learning rate  ';
alpha = input(prompt);

m = length(y); % number of training examples
% adding 1's for bias 
X=[ones(m,1),X]; 

% X is of size m X n
n=size(X,2);
% initializing the weight matrix
W= ones(n,1);

yin=zeros(m,1);
y_pred=zeros(m,1);
for iter = 1:epoch,

   for i=1:m,
       
       yin(i)= X(i,:) * W;  % calculating yin 
       if yin(i)>=0,        %  threshold=0 is taken
           y_pred(i)=1;     
       else,
          y_pred(i)=-1;
       end   
         
   endfor
   for i=1:m,
      if y_pred(i)!= y(i),
         at= alpha* (y(i)- yin(i));  % alpha * (t-y)
         
         W = W + (X(i,:)*at)';   % w(new)= w(old) + alpha*(t-y)*x;
         
      endif  
   endfor  
    
endfor
accuracy=0;
for i=1:m,
     if y_pred(i)==y(i),
       accuracy= accuracy+1;
       endif
endfor

accuracy= (accuracy/m)*100
y_pred
W    
