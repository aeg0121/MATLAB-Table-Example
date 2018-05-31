clear; clc; close all;

%% Table Construction
%The data of a table can be formed by matrix columns and row.
%The names of each row, the model number of the PAs in our case, must be a
%cell array. A more efficient method that doesn't require going from matrix
%to table should be sought, but the MATLAB documentation suggests that this
%is the main way of plugging data into a table

% Create a matrix of the data to put in the table. 
Models = {'00424';'00031';'00235';'00125';'00097';'00012';'00725';'00621';'00225';'00379'};
B = rand(10,10) + 1i*rand(10,10);   % 10x10 random complex matrix
B1 = B(:,1); % column 1
B3 = B(:,2);
B5 = B(:,3);
B7 = B(:,4);
B9 = B(:,5);
B1_1 = B(:,6);
B3_1 = B(:,7);
B5_1 = B(:,8);
B7_1 = B(:,9);
B9_1 = B(:,10);

%The inputs to a table are all columns. After all the columns are put down,
%one should specify the name of the rows, or from where the names of the
%rows come from. Labeled row names come in handy for indexing. What comes 
%after 'RowNames' must be a cell, not a matrix or character. For some
%reason, the names of the columns can come directly from the names of the
%matrix columns that give their values. No cell is necessary for naming the
%columns. 

T = table(B1,B3,B5,B7,B9,B1_1,B3_1,B5_1,B7_1,B9_1,'RowNames',Models)

T.Properties.Description = 'An example table of the coefficients of a 9th order, 2 memory tap model';
%See the properties of the table.
properties_1 = T.Properties;

%"Variables" is the default name of the second dimension of a
%table, the other being "Row". In other words, these are the collected values. 
%If you want to change the name to something more specific to what the table 
%is about, like "Coefficients", you can change it.
T.Properties.DimensionNames{2} = 'Coefficients';
properties_2 = T.Properties


%% Accessing Table Data:
%Note that all these values are in the form of subtables, and aren't
%variables that stand by themselves. See how the row name and column names
%are used instead of number locations. 
specific_entry = T('00125','B5_1');
specific_row = T('00012',:);
specific_column = T(:,'B3_1');

%All the values can be retrieved from a table as a matrix by the following.
%If you don't assign a DimensionName{2}, then it would be using the default
%name, "Variables."
coefficients = T.Coefficients;

%A specific value can be retrieved without being attatched to a table as
%such:
specific_value = T.B5;

%% Computing Based on Columns:
%Given how we are dealing with complex coefficients, the average we would
%want out of one of them would more specifically be the average of the
%magnitudes of that coefficient.
B3_avg = mean(abs(T.B3));
B3_avg_phase = mean(angle(T.B3));

%% Appending New Columns:
%Columns can be appended to a table directly. These additions can be based
%on operations using other columns. The table doesn't seem to have to be 
%recreated every time one wants to add a new column, unlike new rows. 
T.appended_column = T.B9 + T.B7_1;    

%% Appending New Rows:
%Rows have to be added by completely reforming the table with the new row
%attatched, unlike a new column. It may perhaps be necessary to form a
%table of zeros beforehand and filling it in with the PA data to prevent memory
%issues. 
new_row = {rand + 1i*rand, rand + 1i*rand, rand + 1i*rand, rand + 1i*rand, rand + 1i*rand, rand + 1i*rand, rand + 1i*rand, rand + 1i*rand, rand + 1i*rand, rand + 1i*rand, rand + 1i*rand};
T = [T;new_row];
T.Properties.RowNames(11) = {'00481'};

T