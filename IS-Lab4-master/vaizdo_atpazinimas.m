close all
clear all
clc
%% raidziu pavyzdziu nuskaitymas ir pozymiu skaiciavimas
%% read the image with hand-written characters
pavadinimas = 'train_data.png';
pozymiai_tinklo_mokymui = pozymiai_raidems_atpazinti(pavadinimas, 3);
%% Atpazintuvo kûrimas
%% Development of character recognizer
% pozymiai is celiu masyvo perkeliami i matricà
% take the features from cell-type variable and save into a matrix-type variable
P = cell2mat(pozymiai_tinklo_mokymui);
% sukuriama teisingu atsakymu matrica: 11 raidziu, 8 eilutes mokymui
% create the matrices of correct answers for each line (number of matrices = number of symbol lines)
T = [eye(7), eye(7), eye(7)];
% sukuriamas SBF tinklas duotiems P ir T sarysiams
% create an RBF network for classification with 13 neurons, and sigma = 1
tinklas = newrb(P,T,0,1,13);

%% Tinklo patikra | Test of the network (recognizer)
% skaiciuojamas tinklo isëjimas nezinomiems pozymiams
% estimate output of the network for unknown symbols (row, that were not used during training)
P2 = P(:,12:21);
Y2 = sim(tinklas, P2);
% ieskoma, kuriame isejime gauta didziausia reiksmë
% find which neural network output gives maximum value
[a2, b2] = max(Y2);
%% Rezultato atvaizdavimas
%% Visualize result
% apskaiciuosime raidziu skaiciu - pozymiu P2 stulpeliu skaiciu
% calculate the total number of symbols in the row
raidziu_sk = size(P2,2);
% rezultatà saugosime kintamajame 'atsakymas'
% we will save the result in variable 'atsakymas'
atsakymas = [];
for k = 1:raidziu_sk
    switch b2(k)
        case 1
            atsakymas = [atsakymas, 'A'];
        case 2
            atsakymas = [atsakymas, 'E'];
        case 3
            atsakymas = [atsakymas, 'C'];
        case 4
            atsakymas = [atsakymas, 'B'];
        case 5
            atsakymas = [atsakymas, 'F'];
        case 6  
            atsakymas = [atsakymas, 'D'];
        case 7
            atsakymas = [atsakymas, 'G'];
    end
end
% pateikime rezultata komandiniame lange
% show the result in command window
disp(atsakymas)
% % figure(7), text(0.1,0.5,atsakymas,'FontSize',38)
%% zodzio "KADA" pozymiu isskyrimas 
%% Extract features of the test image
pavadinimas = 'test_data.png';
pozymiai_patikrai = pozymiai_raidems_atpazinti(pavadinimas, 1);

%% Raidziu atpazinimas
%% Perform letter/symbol recognition
% pozymiai is celiu masyvo perkeliami i matricà
% features from cell-variable are stored to matrix-variable
P2 = cell2mat(pozymiai_patikrai);
% skaiciuojamas tinklo isëjimas nezinomiems pozymiams
% estimating neuran network output for newly estimated features
Y2 = sim(tinklas, P2);
% ieskoma, kuriame isëjime gauta didziausia reiksmë
% searching which output gives maximum value
[a2, b2] = max(Y2);
%% Rezultato atvaizdavimas | Visualization of result
% apskaiciuosime raidziu skaiciu - pozymiu P2 stulpeliu skaiciu
% calculating number of symbols - number of columns
raidziu_sk = size(P2,2);
% rezultatà saugosime kintamajame 'atsakymas'
atsakymas = [];
for k = 1:raidziu_sk
    switch b2(k)
        case 1
            atsakymas = [atsakymas, 'A'];
        case 2
            atsakymas = [atsakymas, 'E'];
        case 3
            atsakymas = [atsakymas, 'C'];
        case 4
            atsakymas = [atsakymas, 'B'];
        case 5
            atsakymas = [atsakymas, 'F'];
        case 6  
            atsakymas = [atsakymas, 'D'];
        case 7
            atsakymas = [atsakymas, 'G'];
    end
end
% pateikime rezultatà komandiniame lange
% disp(atsakymas)
figure(8), text(0.1,0.5,atsakymas,'FontSize',38), axis off
%% þodþio "FIKCIJA" pozymiu iðskyrimas 
% %% extract features for next/another test image
% pavadinimas = 'test_fikcija.png';
% pozymiai_patikrai = pozymiai_raidems_atpazinti(pavadinimas, 1);
% 
% %% Raidþiø atpaþinimas
% % poþymiai ið celiø masyvo perkeliami á matricà
% P2 = cell2mat(pozymiai_patikrai);
% % skaièiuojamas tinklo iðëjimas neþinomiems poþymiams
% Y2 = sim(tinklas, P2);
% % ieðkoma, kuriame iðëjime gauta didþiausia reikðmë
% [a2, b2] = max(Y2);
% %% Rezultato atvaizdavimas
% % apskaièiuosime raidþiø skaièiø - poþymiø P2 stulpeliø skaièiø
% raidziu_sk = size(P2,2);
% % rezultatà saugosime kintamajame 'atsakymas'
% atsakymas = [];
% for k = 1:raidziu_sk
%     switch b2(k)
%         case 1
%             atsakymas = [atsakymas, 'A'];
%         case 2
%             atsakymas = [atsakymas, 'B'];
%         case 3
%             atsakymas = [atsakymas, 'C'];
%         case 4
%             atsakymas = [atsakymas, 'D'];
%         case 5
%             atsakymas = [atsakymas, 'E'];
%         case 6
%             atsakymas = [atsakymas, 'F'];
%         case 7
%             atsakymas = [atsakymas, 'G'];
%         case 8
%             atsakymas = [atsakymas, 'H'];
%         case 9
%             atsakymas = [atsakymas, 'I'];
%         case 10
%             atsakymas = [atsakymas, 'K'];
%         case 11
%             atsakymas = [atsakymas, 'J'];
%     end
% end
% % pateikime rezultatà komandiniame lange
% % disp(atsakymas)
% figure(9), text(0.1,0.5,atsakymas,'FontSize',38), axis off
% 
