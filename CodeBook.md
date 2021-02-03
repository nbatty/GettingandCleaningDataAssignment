##Code Book - Finaldata.txt For Getting and Cleaning Data Assignment

Column Variables:
 [1] "subjectID"
      ID number assigned to each subject, ranging from 1 to 30
      
 [2] "DataType"  
      Specifies if the data collected from the subject in question was used as part of the training data or the testing data
      
 [3] "Activity"
      Each subject has all measures calculated per activity, resulting in 6 rows per subject as denoted in the "Activity" column. Activities are as follows:
          "WALKING"
          "WALKING_UPSTAIRS"   
          "WALKING_DOWNSTAIRS" 
          "SITTING"            
          "STANDING"          
          "LAYING" 
          
          
###Each column variable from columns 4 onward are the calculated mean of the listed variable per activity (as denoted by the "Mean of_" before each variable), for each subject.

###Names of the measures are constructed based on what is being measured by the device, descriptors making up variable names are:

  t: denoting time domain signals, the raw data output by the recording device. Captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise.
  f: frequency domain signal, this data has been fast fourier transformed (FFT). 
  --------------------------------------------------------------------------
  Accelerometer: Data collected from the phone's accelerometer, representing linear acceleration. This signal is broken down into Body and Gravity acceleration signals
      Body: denotes Body acceleration signal
      Gravity: denotes Gravity acceleration signal
  Gyroscope: Data collected from the phone's accelerometer, representing angular acceleration
  Jerking motion: the body linear acceleration and angular velocity were derived in time to obtain Jerk signals
  Magnitude: The magnitude of these three-dimensional signals were calculated using the Euclidean norm
  --------------------------------------------------------------------------
  mean: denotes that the data used to calculate the mean values listed in this column was mean data  
  standard deviation: denotes that the data used to calculate the mean values listed in this column was standard deviation data 
  --------------------------------------------------------------------------
  X direction: denotes that the data was recorded in X axial direction
  Y direction: denotes that the data was recorded in Y axial direction
  Z direction: denotes that the data was recorded in Z axial direction

Measures included are:
 [4] "Mean of_t: Body Accelerometer: mean - X direction"   
 
 [5] "Mean of_t: Body Accelerometer: mean - Y direction"      
 
 [6] "Mean of_t: Body Accelerometer: mean - Z direction"        
 
 [7] "Mean of_t: Body Accelerometer: standard deviation - X direction" 
 
 [8] "Mean of_t: Body Accelerometer: standard deviation - Y direction"       
 
 [9] "Mean of_t: Body Accelerometer: standard deviation - Z direction"         
 
[10] "Mean of_t: Gravity Accelerometer: mean - X direction"                        

[11] "Mean of_t: Gravity Accelerometer: mean - Y direction"                           

[12] "Mean of_t: Gravity Accelerometer: mean - Z direction"                           

[13] "Mean of_t: Gravity Accelerometer: standard deviation - X direction"             

[14] "Mean of_t: Gravity Accelerometer: standard deviation - Y direction"             

[15] "Mean of_t: Gravity Accelerometer: standard deviation - Z direction"             

[16] "Mean of_t: Body Accelerometer Jerking motion: mean - X direction"               

[17] "Mean of_t: Body Accelerometer Jerking motion: mean - Y direction"               

[18] "Mean of_t: Body Accelerometer Jerking motion: mean - Z direction"               

[19] "Mean of_t: Body Accelerometer Jerking motion: standard deviation - X direction" 

[20] "Mean of_t: Body Accelerometer Jerking motion: standard deviation - Y direction" 

[21] "Mean of_t: Body Accelerometer Jerking motion: standard deviation - Z direction" 

[22] "Mean of_t: Body Gyroscope: mean - X direction"                                  

[23] "Mean of_t: Body Gyroscope: mean - Y direction"                                  

[24] "Mean of_t: Body Gyroscope: mean - Z direction"                                  

[25] "Mean of_t: Body Gyroscope: standard deviation - X direction"                    

[26] "Mean of_t: Body Gyroscope: standard deviation - Y direction"                    

[27] "Mean of_t: Body Gyroscope: standard deviation - Z direction"                    

[28] "Mean of_t: Body Gyroscope Jerking motion: mean - X direction"                   

[29] "Mean of_t: Body Gyroscope Jerking motion: mean - Y direction"                   

[30] "Mean of_t: Body Gyroscope Jerking motion: mean - Z direction"                   

[31] "Mean of_t: Body Gyroscope Jerking motion: standard deviation - X direction"     

[32] "Mean of_t: Body Gyroscope Jerking motion: standard deviation - Y direction"     

[33] "Mean of_t: Body Gyroscope Jerking motion: standard deviation - Z direction"     

[34] "Mean of_t: Body Accelerometer Magnitude: mean"                                  

[35] "Mean of_t: Body Accelerometer Magnitude: standard deviation"                    

[36] "Mean of_t: Gravity Accelerometer Magnitude: mean"                               

[37] "Mean of_t: Gravity Accelerometer Magnitude: standard deviation"                 

[38] "Mean of_t: Body Accelerometer Jerking motion Magnitude: mean"                   

[39] "Mean of_t: Body Accelerometer Jerking motion Magnitude: standard deviation"     

[40] "Mean of_t: Body Gyroscope Magnitude: mean"    

[41] "Mean of_t: Body Gyroscope Magnitude: standard deviation"                        

[42] "Mean of_t: Body Gyroscope Jerking motion Magnitude: mean"                       

[43] "Mean of_t: Body Gyroscope Jerking motion Magnitude: standard deviation"         

[44] "Mean of_f: Body Accelerometer: mean - X direction"                              

[45] "Mean of_f: Body Accelerometer: mean - Y direction"                              

[46] "Mean of_f: Body Accelerometer: mean - Z direction"                              

[47] "Mean of_f: Body Accelerometer: standard deviation - X direction"                

[48] "Mean of_f: Body Accelerometer: standard deviation - Y direction"                

[49] "Mean of_f: Body Accelerometer: standard deviation - Z direction"                

[50] "Mean of_f: Body Accelerometer Jerking motion: mean - X direction"               

[51] "Mean of_f: Body Accelerometer Jerking motion: mean - Y direction"               

[52] "Mean of_f: Body Accelerometer Jerking motion: mean - Z direction"               

[53] "Mean of_f: Body Accelerometer Jerking motion: standard deviation - X direction" 

[54] "Mean of_f: Body Accelerometer Jerking motion: standard deviation - Y direction" 

[55] "Mean of_f: Body Accelerometer Jerking motion: standard deviation - Z direction" 

[56] "Mean of_f: Body Gyroscope: mean - X direction"                                  

[57] "Mean of_f: Body Gyroscope: mean - Y direction"                                  

[58] "Mean of_f: Body Gyroscope: mean - Z direction"                                  

[59] "Mean of_f: Body Gyroscope: standard deviation - X direction"                    

[60] "Mean of_f: Body Gyroscope: standard deviation - Y direction"     

[61] "Mean of_f: Body Gyroscope: standard deviation - Z direction"                    

[62] "Mean of_f: Body Accelerometer Magnitude: mean"                                  

[63] "Mean of_f: Body Accelerometer Magnitude: standard deviation"                    

[64] "Mean of_f: Body Body Accelerometer Jerking motion Magnitude: mean"              

[65] "Mean of_f: Body Body Accelerometer Jerking motion Magnitude: standard deviation"

[66] "Mean of_f: Body Body Gyroscope Magnitude: mean"                                 

[67] "Mean of_f: Body Body Gyroscope Magnitude: standard deviation"                   

[68] "Mean of_f: Body Body Gyroscope Jerking motion Magnitude: mean"                  

[69] "Mean of_f: Body Body Gyroscope Jerking motion Magnitude: standard deviation"    
