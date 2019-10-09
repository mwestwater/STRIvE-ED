daqreset;

%% START DAQ
s = daq.createSession('ni');
s.addAnalogOutputChannel('Dev1','ao0','Voltage');               % Set device and channel/s (NI box)
s.Rate = 100000;
s.IsContinuous = false;
stimWave             = zeros(20,1);                             % Create square wave
stimWave(6:15,1)     = ones(10,1);
current              = 24;                                      % change this to change intensity for a DS5 device

%% SET SHOCK PARAMETERS
load('maggie_shock_pars.mat');
reps = 80;

%%wait for maths 
%pause(90)

for rep = 1:reps
    
    pause(2)
    %% PREPARE & RUN TRAIN
    %Npulses = 5;
    Npulses = Shuffle(Npulses);
    %isi = 0.55;
    isi = Shuffle(isi);
    iti = Shuffle(iti);
    
    for i = 1:Npulses(1)        
        s.queueOutputData(current/5 * stimWave); % Transfom mA in Volt for the NI box
        s.startForeground(); %send pulse
        WaitSecs(isi(1));
    end
    WaitSecs(iti(1));
    
end

stop(s);

% to kill script: ctrl + c, then type stop(s)