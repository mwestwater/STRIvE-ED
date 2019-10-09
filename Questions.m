function Questions(win,rect,xCenter,subid,output,which_Q)

%% Info
% which_Q=1 => first 3 questions
% which_Q=2 => final 6 questions

%% Instruction
%% Open window
% screens = Screen('Screens');
% screenNumber = max(screens);
% [win, rect] = Screen('OpenWindow', screenNumber, [127 127 127]);
% 
% xCenter = rect(3)/2; % center  
% yCenter = rect(4)/2;

Screen('TextSize', 10, 45)
DrawFormattedText(win,' Please answer the following questions. \n \n \n \n \n Press 1 to continue.', xCenter - 600,'center',[255 255 255]);
Screen (win,'Flip');
KbStrokeWait;

if which_Q==1
    
    %saving questions
    output2='first_Quest';
    outputname2 = [output2 subid output '.xls'];
    outfile2 = fopen(outputname2,'w'); % open a file for writing data out (w=writing mode)
    fprintf(outfile2, 'subid\t stress_1\t alert_1\t hunger_1\t control_1\t \n');
    
    %first
    phrase='\n\n\n\n\n\n\nHow stressed do you feel right now?';
    [resp]=hb_scaleResponse_HOW(win,rect,1, phrase);
    stress_1=resp;
    %%fixation cross 
    DrawFormattedText(win,'+','center','center');
    Screen (win,'Flip');
    pause(1.5)
    %second
    phrase='\n\n\n\n\n\n\nHow alert do you feel right now?';
    [resp]=hb_scaleResponse_HOW(win,rect,1, phrase);
    alert_1=resp;
    %%fixation cross 
    DrawFormattedText(win,'+','center','center');
    Screen (win,'Flip');
    pause(1.5)
    %third
    phrase='\n\n\n\n\n\n\nHow hungry do you feel right now?';
    [resp]=hb_scaleResponse_HOW(win,rect,1, phrase);
    hunger_1=resp;
    %%fixation cross 
    DrawFormattedText(win,'+','center','center');
    Screen (win,'Flip');
    pause(1.5)
    %fourth
    phrase='\n\n\n\n\n\n\nHow in control do you feel right now?';
    [resp]=hb_scaleResponse_HOW(win,rect,1, phrase);
    control_1=resp;
    fprintf(outfile2, '%s\t %.2f\t %.2f\t %.2f\t %.2f\t \n',...
            subid, stress_1, alert_1, hunger_1, control_1);

   fclose(outfile2);

elseif which_Q==2
    output2='last_Quest';
    outputname2 = [output2 subid output '.xls'];
    outfile2 = fopen(outputname2,'w'); % open a file for writing data out (w=writing mode)
    fprintf(outfile2, 'subid\t stress_2\t alert_2\t hunger_2\t control_2\t intensity\t pain\t unpleasant\t \n');

    %first
    phrase='\n\n\n\n\n\nHow stressed do you feel right now?';
    [resp]=hb_scaleResponse_HOW(win,rect,1, phrase);
    stress_2=resp;
    %%fixation cross 
    DrawFormattedText(win,'+','center','center');
    Screen (win,'Flip');
    pause(1.5)
    %second
    phrase='\n\n\n\n\n\nHow alert do you feel right now?';
    [resp]=hb_scaleResponse_HOW(win,rect,1, phrase);
    alert_2=resp;
    %%fixation cross 
    DrawFormattedText(win,'+','center','center');
    Screen (win,'Flip');
    pause(1.5)
    %third
    phrase='\n\n\n\n\n\nHow hungry do you feel right now?';
    [resp]=hb_scaleResponse_HOW(win,rect,1, phrase);
    hunger_2=resp;
    %%fixation cross 
    DrawFormattedText(win,'+','center','center');
    Screen (win,'Flip');
    pause(1.5)
    %fourth
    phrase='\n\n\n\n\n\n\nHow in control do you feel right now?';
    [resp]=hb_scaleResponse_HOW(win,rect,1, phrase);
    control_2=resp;
    %%fixation cross 
    DrawFormattedText(win,'+','center','center');
    Screen (win,'Flip');
    pause(1.5)
    %fifth
    phrase='\n\n\n\n\n\nHow intense was the stimulation?';
    [resp]=hb_scaleResponse_HOW(win,rect,1, phrase);
    intensity=resp;
    %sixth
    phrase='\n\n\n\n\n\nHow painful was the stimulation?';
    [resp]=hb_scaleResponse_HOW(win,rect,1, phrase);
    pain=resp;
    %%fixation cross 
    DrawFormattedText(win,'+','center','center');
    Screen (win,'Flip');
    pause(1.5)
    %seventh
    phrase='\n\n\n\n\n\nHow unpleasant was the stimulation?';
    [resp]=hb_scaleResponse_HOW(win,rect,1, phrase);
    unpleasant=resp;
    %close questions file
    fprintf(outfile2, '%s\t %.2f\t %.2f\t %.2f\t %.2f\t %.2f\t %.2f\t %.2f\t \n',...
        subid, stress_2, alert_2, hunger_2,...
        control_2, intensity, pain, unpleasant);
    
    fclose(outfile2);
end
end
