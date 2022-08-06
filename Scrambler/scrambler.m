clear
clc

fid = fopen('test.txt','wt');
for q = 1:20
    %  Giving zero to the scrambler
    x = [1,0,0,1,0,1,0];
    data = zeros(1,7);
    n = size(data);
    service = zeros(n);
    for i = 1:n(2)
        service(i) = xor(data(i),x(1));
        temp = xor(x(7),x(4));
        x = circshift(x, 1);
        x(1) = temp;
    
    end
    clear data
    % Generating random data
    data = de2bi(ceil(rand(1,1)*126),7);
    %Writing the random data into the file
    for i = 7:-1:1
        fprintf(fid, '%d', data(i));
    end
    fprintf(fid,'\n');
    
    disp("Input data:");
    disp(data);
    %Giving data to the scrambler
    n = size(data);
    enc = zeros(n);
    for i = 1:n(2)
        enc(i) = xor(data(i),x(1));
        temp = xor(x(7),x(4));
        x = circshift(x, 1);
        x(1) = temp;
    end
    %Writing scrambled data into the file
    for i = 7:-1:1
        fprintf(fid,"%d", enc(i));
    end
    fprintf(fid, "\n");
    %Giving data to the descrambler
    fdata = zeros(n);
    for i = 1:n(2)
        fdata(i) = xor(service(1),enc(i));
        temp = xor(service(7), service(4));
        service = circshift(service,1);
        service(1) = temp;
    end
    %Showing that both data are the same therefore algorithm works
    disp("Final data:");
    disp( fdata);
    
    
end
fclose(fid);


