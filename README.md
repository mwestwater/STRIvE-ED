# STRIvE-ED
# 1. Overview
This repository includes stimulus presentation code (MATLAB v2017B, The Mathworks) for a computerized, acute stress induction and a control task that were used in the following experiment:

Westwater, ML, Mancini F, Shapleske, J, Serfontein, J, Ziauddeen, H & Fletcher, PC (2019). Dissociable hormonal responses to stress and symptoms in anorexia nervosa and bulimia nervosa. bioRxiv.

# 2. Getting started
## Requirements
These tasks require the following software:

 * Matlab

Required Matlab packages:
* [Psychophysics Toolbox (v3)](http://psychtoolbox.org "Psychophysics Toolbox (v3)")

## Installation
You can either download the code as a ZIP file, or you can clone the stress induction code:

1. Go to the [STRIvE-ED repository on GitHub](https://github.com/mwestwater/STRIvE-ED/master/ "STRIvE-ED repository on GitHub").
2. Select 'Download ZIP' from the green 'Clone or download' button.
3. Unpack the ZIP file. 

To clone the code, run this command on the command line (Git must be installed):

git clone https://github.com/mwestwater/STRIvE-ED.git

## Usage
This repository includes code for a practices maths task, a stress induction and a control task. For continuity, usage of the practice task is explained first.

### Practice task
1. Launch MATLAB, and add the STRIvE-ED directory to your path.

2. Open the PracticeMaths.m file.

3. On line 3, enter the desired condition number from the 'maths_practice_final.xlsx' file.

4. One line 15, enter the desired output information for variables: output, subid, subage, group, practice_condition.

5. Save any changes.

6. Press the green 'Run' button.

7. Output files will be stored in the STRIvE-ED directory.

### Practice task output files
Output files created by the practice task contain 11 columns that are coded as follows: 

Column name  | Description
------------- | -------------
subid  | subject ID
subage  | subject age
group | participant group
practice_condition | practice condition corresponding to maths problem set (important for counterbalancing)
trial | trial number
Eqn | maths equation to be solved
difficulty | maths problem difficulty level (easy, medium, hard)
response | accuracy (correct, incorrect; non-responses are coded as incorrect)
response_ID | accuracy numeric (0 = incorrect, 1 = correct)
RT | response time (in s from trial onset, i.e., when equation appears on the screen)
maxTime | maximum alotted time per trial (set to 30s)

### Experiment 
This repository contains two experimental scripts, one for a stress induction and one for a control task. Researchers are strongly encouraged to counterbalance the order of these experiments across participants. 

These MATLAB functions also call a script (Questions.m), which asks the participant to provide baseline ratings of stress and hunger (0 = not at all, 100 = extremely) before presenting the task instructions. 

1. Launch MATLAB, and add the STRIvE-ED directory to your path.

2. Open the correct experiment file per counterbalancing: either STRIvEMathsTaskNeutral.m or STRIvEMathsTask.m

3. Enter the desired output information for variables: output, subid, subage, group, scan_condition. The variable 'scan_condition' will correspond to maths set and order selected from math_files_final_151017.xlsx. 
  
4. **For the stress induction only** The variable 'averageTime' must be set to 10% less than the average response time from the participant's practice performance. 

5. Save changes.

6. In the terminal, type either STRIvEMathsTask(condition) or STRIvEMathsTaskNeutral(condition), where 'condition' corresponds to the the maths set from math_files_final_151017.xlsx. It will be a numeric value (1 - 6).

7. The task will begin by asking the participant to record their subjective stress and hunger ratings.

8. Next, the participant will use their index finger (button 1 on a Current Designs MRI button box) to advance through the instructions and begin the maths problems. 

9. At the end of the task, the participant will be asked to record additional subjective state ratings. 

### Experiment output files
The stress induction and control tasks generate three output files each: baseline ratings, maths performance and post-task ratings. 

The baseline ratings output (first_QuestXXXXmaths_X_.xls) contains 5 columns: 

Column name  | Question
------------- | -------------
subid  | subject ID
stress_1  | How stressed do you feel right now?
alert_1 | How alert do you feel right now?
hunger_1 | How hungry do you feel right now?
control_1 | How in control do you feel right now?

The post-task ratings output (last_QuestXXXXmaths_X_.xls) contains 8 columns: 

Column name  | Question
------------- | -------------
subid  | subject ID
stress_2  | How stressed do you feel right now?
alert_2 | How alert do you feel right now?
hunger_2 | How hungry do you feel right now?
control_2 | How hungry do you feel right now?
intensity | How intense was the stimulation?
pain | How painful was the stimulation?
unpleasant | How unpleasant was the stimulation?

The maths output file contain 11 columns that are coded as follows:  

Column name  | Description
------------- | -------------
subid  | subject ID
subage  | subject age
group | participant group
scan_condition | scan condition corresponding to maths problem set (important for counterbalancing)
trial | trial number
Eqn | maths equation to be solved
difficulty | maths problem difficulty level (easy, easy2, medium, medium4, hard)
response | accuracy (correct, incorrect, c; 'c' indicates a non-response)
response_ID | accuracy numeric (0 = incorrect, 1 = correct; non-responses are coded as incorrect)
RT | response time (in s from trial onset, i.e., when equation appears on the screen)
maxTime | maximum alotted time per trial

### Maths files
The practice task includes 25 problems, whereas both experimental tasks include 48 maths problems of varying difficulty (n = 14 easy, n = 22 medium, n = 12 hard). On each trial, the maths problem is presented with three possible solutions. Maths problems were generated by MLW, where difficulty levels aligned with those employd by the Montreal Imaging Stress Task [(Dedovic et al., 2005)](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC1197276/ "Dedovic et al., 2005").  

Both the practice (maths_practice_final.xlsx) and the experimental (math_files_final_151017.xlsx) maths files include 6 sheets of maths problems of varying difficulty. Each file includes two sets (A and B) of maths problems with three different trial orders each. Sheets 1 - 3 correspond with set "A", and sheets 4 - 6 correspond with set "B". Each set includes the same proportion of easy, medium and hard problems. When determining counterbalancing, ensure that participants complete maths problems from both sets (i.e., do not repeat items from set A during the second testing session).

## Procedure
In the study referenced here, each participant completed the stress induction and control task on back-to-back days, where order was counterbalanced across participants within each group. Participants completed the practice task on each day before the experiment. Each participant only completed the practice task once per day. 

Participants were instructed with both verbal and written instructions, as detailed here:

### Practice task instructions
Participants were informed that they would complete a mental maths task in the scanner, and they would have the opportunity to practice some mental maths problems of varying difficulty prior to the experiment. 

Read the following instructions that appear when PracticeMaths.m is run: 

> "This task will require you to solve maths problems. Try to answer as accurately as you can without taking too much time to make your response."

Press the space bar to advance, and read the next instruction:

> "On each trial, you will see a maths problem and three possible answers. Select the correct answer using the corresponding button on the keyboard. 1 = Left, 2 = Centre and 3 = Right. Press space to continue."

Read the following instruction:

> "'Get ready! Press space to start."

### Neutral task instructions
First, inform the participant that they will be asked to answer a couple of questions before and after the maths task.

> "This task will ask you to make ratings in response to some questions. To rate your reponse, use buttons 1 and 2 to move the slider left and right, and button 3 to select your response. So, you will use your index finger to move the slider left, your middle finger to move it right and your ring finger to select."

Ask the participant to pause upon completing baseline ratings (i.e., do not yet advance to the maths task). If collecting tissue samples (e.g., blood, saliva), acquire them before reading the following instructions to the participant:

> "The next task you will perform involves solving maths problems. For this task, you will be using three fingers – your index, middle and ring fingers – to make your responses. You will solve the problems in your head and then pick the correct answer. We will deliver the electrical stimulation at the low intensity that you chose. To answer, press the button that corresponds with the answer you choose.

> We will not judge your performance during this task because it is the control condition.  

> We will have the audio turned on, so we will be able to hear you from the console room. If the stimulation becomes uncomfortable, please say so, and we will lower the intensity." 

The participant will see additional written instructions, which recapitulate the verbal instructions, as they begin the task.

### Stress induction instructions
First, inform the participant that they will be asked to answer a couple of questions before and after the maths task.

> "This task will ask you to make ratings in response to some questions. To rate your reponse, use buttons 1 and 2 to move the slider left and right, and button 3 to select your response. So, you will use your index finger to move the slider left, your middle finger to move it right and your ring finger to select."

Ask the participant to pause upon completing baseline ratings (i.e., do not yet advance to the maths task). If collecting tissue samples (e.g., blood, saliva), acquire them before reading the following instructions to the participant:

>"The next task you will perform involves solving maths problems. For this task, you will be using three fingers – your index, middle and ring fingers – to make your responses. You will solve the problems in your head and then pick the correct answer. You may experience physical distractors during this task. 

>It is important that you pay attention and choose the correct answer because we will be judging your performance against the group. If you do not meet the group average - about 80 to 90% accuracy - we will not be able to use your data from today. To answer, press the button that corresponds with the answer you choose. 

>We will be watching you on the video camera to make sure you pay attention. We will have the audio turned on, so we will be able to hear you from the console room. If the distractors become too intense or painful, please say so, and we will lower the intensity. The distractors will never exceed the intensity that we set together."

The participant will see additional written instructions, which recapitulate the verbal instructions, as they begin the task.

### Debrief
At the end of the study, debrief the participant to inform them of the manipulation. Read the following instructions, which can be amended to align with the aims of your study: 

>"Thank you for taking part in our study. For this project, we are interested in examining the effects of acute stress on X in Y. Our study involved some deception in the maths, and I am sorry for any distress that this may have caused you. The task was rigged to make you and all other participants fail. Your data will not be excluded from our study, and we greatly appreciate your time and dedication to this project."

## Citation
If you use the above STRIvE-ED code, you must cite the software, and the original publication describing the task: 

Westwater, ML, Mancini F, Shapleske, J, Serfontein, J, Ziauddeen, H & Fletcher, PC (2019). Dissociable hormonal responses to stress and symptoms in anorexia nervosa and bulimia nervosa. bioRxiv.

## Colophon
### Version 

Version 0.1 - November 2019

### Contact

E-mail: mw658@cam.ac.uk

### Acknowledgement 

Thank you to Dr. Kelly Diederen for assistance with coding the maths tasks.
