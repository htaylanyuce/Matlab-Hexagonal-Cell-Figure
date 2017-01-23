%% Group 5 Project Assignment
% CAS plotting

clear all
clc
%% main cell
center_cell = zeros(7,2);
 
k = 2;
R = 1000;
type = 0;
% RRUs in central cell
 
for i = 0:60:300
    
    center_cell(k,:) = type/3* R * [cos(i * pi / 180) sin(i * pi / 180)];
    k = k + 1;
       
end
 
%% first tier cells
k = 1;
neg_cell = zeros(7,12);
 
for i = 30:60:330
    
    
    % Distance between centers of central cell and first-tier
    
    cc = sqrt(3) * R * cos(i * pi / 180) * ones(7,1);
    cc(:,2) = sqrt(3) * R * sin(i * pi / 180) * ones(7,1);
    
    neg_cell(:,k:k+1) = center_cell + cc;
    k = k + 2;
    cc = 0;
       
end
 
 
%% second tier cells
 
for i = 30:30:360
    
    
    % Distance between centers of central cell and second-tier
   
    if mod(i,60) == 0
        cc = 3 * R * cos(i * pi / 180) * ones(7,1);
        cc(:,2) = 3 * R * sin(i * pi / 180) * ones(7,1);
    else
        cc = 2*sqrt(3) * R * cos(i * pi / 180) * ones(7,1);
        cc(:,2) = 2*sqrt(3) * R * sin(i * pi / 180) * ones(7,1);
    end
    
    neg_cell(:,k:k+1) = center_cell + cc;
    k = k + 2;
    cc = 0;
       
end
 
%%% plotting RRUs

plot(center_cell(2:7,1),center_cell(2:7,2),'<r')
hold on
x = [center_cell(2,1),center_cell(2,2);center_cell(7,1),center_cell(7,2)];
plot(x(:,1),x(:,2),'<r')
hold on
flag = 0;
plot(center_cell(1,1),center_cell(1,2),'<r')

for i = 1:18
    if(flag == 0)
        plot(neg_cell(2:7,2*i-1),neg_cell(2:7,2*i),'<g')
        hold on
        x = [neg_cell(2,2*i-1),neg_cell(2,2*i);
        neg_cell(7,2*i-1),neg_cell(7,2*i)];
        plot(x(:,1),x(:,2),'<g')
        hold on
        plot(neg_cell(1,2*i-1),neg_cell(1,2*i),'<g')
        hold on
    end
    if(i == 7)
        flag = 1;
    end
    if(flag == 1)
        plot(neg_cell(2:7,2*i-1),neg_cell(2:7,2*i),'<b')
        hold on
        x = [neg_cell(2,2*i-1),neg_cell(2,2*i);
        neg_cell(7,2*i-1),neg_cell(7,2*i)];
        plot(x(:,1),x(:,2),'<b')
        hold on
        plot(neg_cell(1,2*i-1),neg_cell(1,2*i),'<b')
        hold on
    end
    
end


%%%%%

% plotting Hexagonals
hexagon(1000,center_cell(1,1),center_cell(1,2))
hold on

for i = 1 : 18
   hexagon(1000,neg_cell(1,2*i-1),neg_cell(1,2*i)); 
   hold on
end
title('RRUs in the Cells for CAS')
xlabel('meter')
ylabel('meter')
hold off

