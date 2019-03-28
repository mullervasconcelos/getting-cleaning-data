# Codebook for the course project

This codebook describes the structure of two datasets for the final project of the course Getting and Cleaning Data from the Data Science Specialization at Johns Hopkins University.

There are two datasets in this project: HAR.csv and HAR2.csv



## Dataset HAR.csv

- This dataset contains 10299 observations of 68 variables.

- There are no missing values (NA) in this dataset.

## Dataset HAR2.csv

- This dataset contains 180 observations of 68 variables.

- There are no missing values (NA) in this dataset.


## Codebook

- The variable names indicate:

1. Domain: time (time) or frequency (freq)
2. Sensor: 

- body accelerometer (body_acc)
- body gyroscope (body_gyro)
- body gyroscope jerk (body_gyro_jerk)
- body accelerometer jerk (body_acc_jerk)
- gravity accelerometer (gravity_acc)

3. Statistics: mean (mean), standard deviation (std)
4. Axis (x, y, z)
5. Magnitude (mag)

  - The columns of the dataset HAR.csv and HAR2.csv correspond to the following variables:

 [1] "subject" (integer - {1:30}) 

 [2] "activity" (character - {"standing", "sitting", "laying", "walking", "walking downstairs", "walking upstairs"})

 [3] "time_body_acc_mean_x" (numeric)

 [4] "time_body_acc_mean_y" (numeric)

 [5] "time_body_acc_mean_z" (numeric)

 [6] "time_body_acc_std_x" (numeric)         

 [7] "time_body_acc_std_y" (numeric)        

 [8] "time_body_acc_std_z" (numeric)        

 [9] "time_gravity_acc_mean_x" (numeric)     

[10] "time_gravity_acc_mean_y" (numeric)    

[11] "time_gravity_acc_mean_z" (numeric)     

[12] "time_gravity_acc_std_x" (numeric)     

[13] "time_gravity_acc_std_y" (numeric)     

[14] "time_gravity_acc_std_z" (numeric)    

[15] "time_body_acc_jerk_mean_x" (numeric)   

[16] "time_body_acc_jerk_mean_y" (numeric)  

[17] "time_body_acc_jerk_mean_z" (numeric)  

[18] "time_body_acc_jerk_std_x" (numeric)   

[19] "time_body_acc_jerk_std_y" (numeric)    

[20] "time_body_acc_jerk_std_z" (numeric)   

[21] "time_body_gyro_mean_x" (numeric)

[22] "time_body_gyro_mean_y" (numeric)

[23] "time_body_gyro_mean_z" (numeric)

[24] "time_body_gyro_std_x" (numeric)     

[25] "time_body_gyro_std_y" (numeric)     

[26] "time_body_gyro_std_z" (numeric)

[27] "time_body_gyro_jerk_mean_x" (numeric)

[28] "time_body_gyro_jerk_mean_y" (numeric)

[29] "time_body_gyro_jerk_mean_z" (numeric)  

[30] "time_body_gyro_jerk_std_x" (numeric)  

[31] "time_body_gyro_jerk_std_y" (numeric)   

[32] "time_body_gyro_jerk_std_z" (numeric)  

[33] "time_body_acc_mag_mean" (numeric)      

[34] "time_body_acc_mag_std" (numeric)      

[35] "time_gravity_acc_mag_mean" (numeric)   

[36] "time_gravity_acc_mag_std" (numeric)   

[37] "time_body_acc_jerk_mag_mean" (numeric)  

[38] "time_body_acc_jerk_mag_std" (numeric) 

[39] "time_body_gyro_mag_mean" (numeric)    

[40] "time_body_gyro_mag_std" (numeric)      

[41] "time_body_gyro_jerk_mag_mean" (numeric) 

[42] "time_body_gyro_jerk_mag_std" (numeric) 

[43] "freq_body_acc_mean_x" (numeric)        

[44] "freq_body_acc_mean_y" (numeric)      

[45] "freq_body_acc_mean_z" (numeric)        

[46] "freq_body_acc_std_x" (numeric)       

[47] "freq_body_acc_std_y" (numeric)      

[48] "freq_body_acc_std_z" (numeric)       

[49] "freq_body_acc_jerk_mean_x" (numeric)   

[50] "freq_body_acc_jerk_mean_y" (numeric) 

[51] "freq_body_acc_jerk_mean_z" (numeric)   

[52] "freq_body_acc_jerk_std_x" (numeric)   

[53] "freq_body_acc_jerk_std_y" (numeric)    

[54] "freq_body_acc_jerk_std_z" (numeric)   

[55] "freq_body_gyro_mean_x" (numeric)     

[56] "freq_body_gyro_mean_y" (numeric)     

[57] "freq_body_gyro_mean_z" (numeric)

[58] "freq_body_gyro_std_x" (numeric)    

[59] "freq_body_gyro_std_y" (numeric)    

[60] "freq_body_gyro_std_z" (numeric)      

[61] "freq_body_acc_mag_mean" (numeric)    

[62] "freq_body_acc_mag_std" (numeric)    

[63] "freq_body_acc_jerk_mag_mean" (numeric)

[64] "freq_body_acc_jerk_mag_std" (numeric)

[65] "freq_body_gyro_mag_mean" (numeric)

[66] "freq_body_gyro_mag_std" (numeric)

[67] "freq_body_gyro_jerk_mag_mean" (numeric)

[68] "freq_body_gyro_jerk_mag_std" (numeric)




