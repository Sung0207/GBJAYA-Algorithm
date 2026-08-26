
% Matriks untuk menyimpan Best RMSE dari All1
BestRMSE_All1 = zeros(MaxIt+1, LoopIter);  % Baris untuk iterasi (0-200), Kolom untuk iterasi utama (1-30)

% Ambil nilai Best RMSE dari All1(i).Stat (dari baris 0 hingga 200)
for i = 1:LoopIter
    for gen = 1:MaxIt+1  % dimulai dari baris 0 hingga baris ke-200
        % Ambil nilai Best RMSE (kolom pertama) dari All1(i).Stat
        BestRMSE_All1(gen, i) = All1(i).Stat(gen, 1);  % Kolom pertama adalah BestCost
    end
end

% Matriks untuk menyimpan Best RMSE dari All1
BestRMSE_All2 = zeros(MaxIt+1, LoopIter);  % Baris untuk iterasi (0-200), Kolom untuk iterasi utama (1-30)

% Ambil nilai Best RMSE dari All1(i).Stat (dari baris 0 hingga 200)
for i = 1:LoopIter
    for gen = 1:MaxIt+1  % dimulai dari baris 0 hingga baris ke-200
        % Ambil nilai Best RMSE (kolom pertama) dari All1(i).Stat
        BestRMSE_All2(gen, i) = All2(i).Stat(gen, 1);  % Kolom pertama adalah BestCost
    end
end

% Matriks untuk menyimpan Best RMSE dari All1
BestRMSE_All3 = zeros(MaxIt+1, LoopIter);  % Baris untuk iterasi (0-200), Kolom untuk iterasi utama (1-30)

% Ambil nilai Best RMSE dari All1(i).Stat (dari baris 0 hingga 200)
for i = 1:LoopIter
    for gen = 1:MaxIt+1  % dimulai dari baris 0 hingga baris ke-200
        % Ambil nilai Best RMSE (kolom pertama) dari All1(i).Stat
        BestRMSE_All3(gen, i) = All3(i).Stat(gen, 1);  % Kolom pertama adalah BestCost
    end
end

% Matriks untuk menyimpan Best RMSE dari All1
BestRMSE_All4 = zeros(MaxIt+1, LoopIter);  % Baris untuk iterasi (0-200), Kolom untuk iterasi utama (1-30)

% Ambil nilai Best RMSE dari All1(i).Stat (dari baris 0 hingga 200)
for i = 1:LoopIter
    for gen = 1:MaxIt+1  % dimulai dari baris 0 hingga baris ke-200
        % Ambil nilai Best RMSE (kolom pertama) dari All1(i).Stat
        BestRMSE_All4(gen, i) = All4(i).Stat(gen, 1);  % Kolom pertama adalah BestCost
    end
end

% Matriks untuk menyimpan Best RMSE dari All1
BestRMSE_All5 = zeros(MaxIt+1, LoopIter);  % Baris untuk iterasi (0-200), Kolom untuk iterasi utama (1-30)

% Ambil nilai Best RMSE dari All1(i).Stat (dari baris 0 hingga 200)
for i = 1:LoopIter
    for gen = 1:MaxIt+1  % dimulai dari baris 0 hingga baris ke-200
        % Ambil nilai Best RMSE (kolom pertama) dari All1(i).Stat
        BestRMSE_All5(gen, i) = All5(i).Stat(gen, 1);  % Kolom pertama adalah BestCost
    end
end