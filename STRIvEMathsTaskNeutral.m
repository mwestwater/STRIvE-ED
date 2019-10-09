function STRIvEMathsTaskNeutral(condition)

%% Determine which condition
% condition can be 1,2,3,4,5,6 corresponding to worksheet in math_files_final_151017.xlsx  

[NUM TXT RAW] = xlsread('math_files_final_151017.xlsx',condition); 
difficulty=RAW(2:end,5);

%% Preallocate correct
correct = NaN(100,1);

%% Response time
   maxTime= 30; % max time for response to occur

%% Login prompt and open file for writing data out  
output = 'math_N_' ; subid = '1000'; subage ='25'; group ='pilot' ; scan_condition='1A' ;
outputname = [output subid '.xls'];

if exist(outputname)==2 % check to avoid overiding an existing file7
    fileproblem = input('That file already exists! Append a .x (1), overwrite (2), or break (3/default)?');
    if isempty(fileproblem) || fileproblem==37
        return;
    elseif fileproblem==1
        outputname = [outputname '.xls'];
    end
end

outfile = fopen(outputname,'w'); % open a file for writing data out (w=writing mode)
fprintf(outfile,'subid\t subage\t group\t scan_condition\t trial\t Eqn\t difficulty\t response\t response_ID\t RT\t maxTime\t \n');

%% Screen parameters and fixation
Screen('Preference', 'SkipSyncTests', 1);
% Get the screen numbers
screens = Screen('Screens');

% Draw to the external screen if avaliable
screenNumber = max(screens);

[win,rect]=Screen('OpenWindow',screenNumber,[127 127 127]);
Screen('TextSize', 10, 45); %word dimension % 10 is the name of the screen, probably
Screen('TextFont', win, 'Calibri');

%Define cross characteristics 
crossLength =  10;
crossColor = [255 255 255];
crossWidth = 3; 

%Set start and end points of lines 
crossLines = [-crossLength, 0; crossLength, 0; 0, -crossLength; 0, crossLength];
crossLines = crossLines'; 

%Define center of screen 
xCenter = rect(3)/2; % center  
yCenter = rect(4)/2;  

%Draw the lines 
Screen('DrawLines',win,crossLines,crossWidth,crossColor,[xCenter,yCenter]);
Screen('Flip',win);    
WaitSecs(.4);

%% Questions part 1
Questions(win,rect,xCenter,subid,output,1) 

%% Start Task
%DrawFormattedText(win,textString,sx,sy,color,wrapat,flipHorizontal,flipVertical, vSpacing, rightoleft, winRect)

DrawFormattedText(win,'This task will require you to solve maths problems. \n \n You should try to answer as accurately as possible without taking \n too much time to make your response. \n \n \n Press 1 to continue.', xCenter - 600,'center',[255 255 255]);
Screen (win,'Flip');
KbStrokeWait;
   
DrawFormattedText(win,'On each trial, you will see a maths problem and three \npossible answers. \n \nSelect the correct answer using the corresponding button \non the button box. \n \n 1 = Left \n \n 2 = Centre \n \n 3 = Right \n \n Press 1 to continue.', xCenter - 600,'center',[255 255 255]);
Screen (win,'Flip');
KbStrokeWait;

DrawFormattedText(win,'Your performance will not be evaluated. \n \n This is the control condition. \n \n Press 1 to start.', 'center', 'center',[255 255 255]);
Screen (win,'Flip');
KbStrokeWait;
firstTime=GetSecs; % beginning time trial

%% Start loop 
% for practice: n=1:10
for n=1:size(NUM,1)   
    HideCursor
    
    oldenablekeys = RestrictKeysForKbCheck([49, 50, 51]); % the only permitted buttons
    Diff= difficulty{n};
    
    % draw the equations on the screen  
    Eqn = RAW{n+1,1};
    Screen('TextSize', 10, 60);
    DrawFormattedText(win, Eqn, 'center', yCenter - 85 , [255 255 255]); 

    %% vary position possible answers 
    position = randperm(3); 
    answer1= RAW{n+1,position(1)+1}; answer2= RAW{n+1,position(2)+1}; answer3=RAW{n+1,position(3)+1};
    
    Screen('TextSize', 10, 60);
    Screen('DrawText', win, num2str(answer1) , xCenter -  430   , yCenter +  50  , [255 255 255]);
    Screen('DrawText', win, num2str(answer2), xCenter , yCenter +  50  , [255 255 255]);
    Screen('DrawText', win, num2str(answer3), xCenter + 430 , yCenter +  50  , [255 255 255]);
         
    Screen('Flip',win); 
    
    %% Response
    t0 = GetSecs(); 
    keyIsDown=0;
    
    while GetSecs - t0 < maxTime && ~keyIsDown    
        [keyIsDown, t1, keyCode] = KbCheck();  
        RT=t1-t0; % response time
    
        % identify pressed key 
        kp = KbName(keyCode);
    end
    
    if strcmp('1!',kp) == 1
        keypress = 1;
    elseif strcmp('2@',kp) == 1
        keypress = 2;
    elseif strcmp('3#',kp) == 1
        keypress = 3; 
    else 
        keypress = 99; 
        response_ID = 99;
        response = 99;
    end
       
    %% show response to subject     
    DrawFormattedText(win, Eqn, 'center', yCenter - 85, [255 255 255]); 

    % can be made far more efficient 
    if keypress == 1
        colour1 = [248 47 155];
    else 
        colour1 = [255 255 255];
    end
    
    if keypress == 2
        colour2 = [248 47 155];
    else 
        colour2 = [255 255 255];
    end
    
    if keypress == 3
        colour3 = [248 47 155];
    else 
        colour3 = [255 255 255];
    end
    
    Screen('DrawText', win, num2str(answer1) , xCenter -  430   , yCenter +  50  , colour1);
    Screen('DrawText', win, num2str(answer2), xCenter , yCenter +  50  , colour2);
    Screen('DrawText', win, num2str(answer3), xCenter + 430 , yCenter +  50  , colour3);
    
    Screen (win,'Flip');
    pause(0.5); 
    
    % identify whether answer was correct     
    idx = find(position==1); 
    
    if keypress < 99
        if abs(idx - keypress) == 0 
            response = 'correct'; response_ID = 1;
        else 
            response = 'incorrect'; response_ID = 0;
        end
    end
    
        if response_ID == 99
              DrawFormattedText(win, 'Out of time', 'center', 'center', [255 0 0]);
              Screen (win,'Flip');
              pause(1)
        elseif  response_ID == 1
              DrawFormattedText(win, 'Correct', 'center', 'center', [0 255 0]);
              Screen (win,'Flip');
              pause(1)
        end
    
    % vary ITI
    if n == 6 || n == 12 || n == 18 || n == 24 || n == 30 || n == 36 || n == 42    
       ITI = 2;    
    else    
       ITI =randsample(0.5:0.1:1.5,1,'true'); 
    end
        
    DrawFormattedText(win,'+','center','center', [255 255 255]);
    Screen (win,'Flip');
    pause(ITI)
    
    % Saving
    fprintf(outfile, '%s\t %s\t %s\t %s\t %d\t %s\t %s\t %s\t %d\t %.2f\t %.4f\t \n',...,
        subid, subage, group, scan_condition, n, Eqn, Diff, response,...,
        response_ID, RT, maxTime);
    
end

fclose(outfile); %close the data file

%% Questions part 2
Questions(win,rect,xCenter,subid,output,2) 

%% End
Screen('TextSize', 10, 45)
DrawFormattedText(win,'End of this experiment','center','center');
Screen(win,'Flip');
pause(2);

sca
end