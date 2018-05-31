clear; clc; close all

Models = {'00424';'00031';'00235';'00125';'00097';'00012';'00725';'00621';'00225';'00379'};
B = rand(10,10) + 1i*rand(10,10);
B1 = B(:,1);
B3 = B(:,2);
B5 = B(:,3);
B7 = B(:,4);
B9 = B(:,5);
B1_1 = B(:,6);
B3_1 = B(:,7);
B5_1 = B(:,8);
B7_1 = B(:,9);
B9_1 = B(:,10);

C = rand(10,10) + 1i*rand(10,10);
C1 = C(:,1);
C3 = C(:,2);
C5 = C(:,3);
C7 = C(:,4);
C9 = C(:,5);
C1_1 = C(:,6);
C3_1 = C(:,7);
C5_1 = C(:,8);
C7_1 = C(:,9);
C9_1 = C(:,10);

T = table(B1,B3,B5,B7,B9,B1_1,B3_1,B5_1,B7_1,B9_1,'RowNames',Models);
U = table(C1,C3,C5,C7,C9,C1_1,C3_1,C5_1,C7_1,C9_1,'RowNames',Models);

save('Table_Saving_Example','T','U');

clear; clc;


for x = 1:5
    new_models = {'00481'; '00356';'00088';'00512';'00101'};
    load('Table_Saving_Example','T','U');
    
    new_row_t = {rand + 1i*rand, rand + 1i*rand, rand + 1i*rand, rand + 1i*rand, rand + 1i*rand, rand + 1i*rand, rand + 1i*rand, rand + 1i*rand, rand + 1i*rand, rand + 1i*rand};
    T = [T;new_row_t];
    T.Properties.RowNames(10+x) = new_models(x);

    new_row_u = {rand + 1i*rand, rand + 1i*rand, rand + 1i*rand, rand + 1i*rand, rand + 1i*rand, rand + 1i*rand, rand + 1i*rand, rand + 1i*rand, rand + 1i*rand, rand + 1i*rand};
    U = [U;new_row_u];
    U.Properties.RowNames(10+x) = new_models(x);

    save('Table_Saving_Example','T','U');

    if x ~= 5
        clear;clc;
    end
end

T
U