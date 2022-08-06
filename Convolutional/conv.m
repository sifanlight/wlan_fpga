clear
clc

%% Convolutional encoder 

reg = zeros(1,6);
inputBits = [1, 0, 1, 0, 0, 0, 0, 1];
regOut = zeros(2,8);
regStream = zeros(1, 16);
codeRateN = 1;  %Codeing rate will be decided based on a tabel in page 14 of the standard 
codeRateD = 2;
if (codeRateN == 3)
    counter = 2;
else
    coutner = 0;
end


for i = 1:8
    regOut(1, i) = mod(inputBits(i) + reg(2) + reg(3) + reg(5) + reg(6), 2);
    regOut(2, i)= mode(inputBits(i) + reg(1) + reg(2) + reg(3) + reg(6), 2);
%     if (flag)
        
end


%% Viterbi decoder

input = de2bi(9948704395842298, 64);
counter = 1;
decisions = zeros(32, 64);
costs = zeros(1,64);
for i = 1:32
    for j = 1:64
        temp = de2bi(j-1,6);
        state0 = [temp(2:end), 0];
        state1 = [temp(2:end), 1];
        a = de2bi(temp(1)+temp(3)+temp(4)+temp(5));
        b = de2bi(temp(1)+temp(2)+temp(3)+temp(4));
        cost0 =  bitxor(a(1), input(counter)) + bitxor(b(1),input(counter));
        a = de2bi(temp(1)+temp(3)+temp(4)+temp(5)+1);
        b = de2bi(temp(1)+temp(2)+temp(3)+temp(4)+1);
        cost1 =  bitxor(a(1), input(counter+1)) + bitxor(b(1),input(counter + 1));
        if (costs(bi2de(state0)+1) + cost0 > costs(bi2de(state1)+1) + cost1)
            decisions(j) = 0;
            costs(bi2de(state0)+1) = costs(bi2de(state0)+1) + cost0;
        else
            decisions(j) = 1;
            costs(bi2de(state1)+1) = costs(bi2de(state1)+1) + cost1;
        end
        
    end
    counter = counter + 2;
end

[~,index] = min(costs);
out = zeros(1,32);
counter = 32;

for i=1:32
    temp = de2bi(index,6);
    out(counter) = temp(1);
    temp = [temp(2:6), decisions(i,index+1)];
    counter = counter - 1;
    index = de2bi(temp);
    
end


