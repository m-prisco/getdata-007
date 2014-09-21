Features 
=================

This is the list of all variables. The "subject" variable goes from 1 to 30, indicating the identifier. The "activity" variable consists of six different possibilities: "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING" and "LAYING". 

The features come from the "accelerometer" and "gyroscope" 3-axial raw signals. These time domain signals (variables starting with "time") were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into "body" and "gravity" acceleration signals using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain "jerk" signals. Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm ("magnitude").

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing variables starting with "frequency".

These signals were used to estimate mean and standard deviation in the X, Y and Z directions.

The list of variables:

1. subject
2. activity  
3. time body accelerometer x mean          
4. time body accelerometer y mean           
5. time body accelerometer z mean           
6. time body accelerometer x standard deviation   
7. time body accelerometer y standard deviation            
8. time body accelerometer z standard deviation            
9. time gravity accelerometer x mean       
10. time gravity accelerometer y mean        
11. time gravity accelerometer z mean        
12. time gravity accelerometer x standard deviation        
13. time gravity accelerometer y standard deviation         
14. time gravity accelerometer z standard deviation         
15. time body accelerometer jerk x mean      
16. time body accelerometer jerk y mean       
17. time body accelerometer jerk z mean       
18. time body accelerometer jerk x standard deviation       
19. time body accelerometer jerk y standard deviation        
20. time body accelerometer jerk z standard deviation        
21. time body gyroscope x mean         
22. time body gyroscope y mean          
23. time body gyroscope z mean          
24. time body gyroscope x standard deviation          
25. time body gyroscope y standard deviation           
26. time body gyroscope z standard deviation           
27. time body gyroscope jerk x mean     
28. time body gyroscope jerk y mean      
29. time body gyroscope jerk z mean      
30. time body gyroscope jerk x standard deviation      
31. time body gyroscope jerk y standard deviation       
32. time body gyroscope jerk z standard deviation       
33. time body accelerometer magnitude mean         
34. time body accelerometer magnitude standard deviation           
35. time gravity accelerometer magnitude mean       
36. time gravity accelerometer magnitude standard deviation       
37. time body accelerometer jerk  magnitude mean      
38. time body accelerometer jerk  magnitude standard deviation       
39. time body gyroscope magnitude mean        
40. time body gyroscope magnitude standard deviation          
41. time body gyroscope jerk  magnitude mean     
42. time body gyroscope jerk  magnitude standard deviation     
43. frequency body accelerometer x mean           
44. frequency body accelerometer y mean           
45. frequency body accelerometer z mean          
46. frequency body accelerometer x standard deviation            
47. frequency body accelerometer y standard deviation            
48. frequency body accelerometer z standard deviation           
49. frequency body accelerometer jerk x mean       
50. frequency body accelerometer jerk y mean       
51. frequency body accelerometer jerk z mean      
52. frequency body accelerometer jerk x standard deviation        
53. frequency body accelerometer jerk y standard deviation        
54. frequency body accelerometer jerk z standard deviation       
55. frequency body gyroscope x mean          
56. frequency body gyroscope y mean          
57. frequency body gyroscope z mean         
58. frequency body gyroscope x standard deviation           
59. frequency body gyroscope y standard deviation           
60. frequency body gyroscope z standard deviation  
51. frequency body accelerometer magnitude mean          
62. frequency body accelerometer magnitude standard deviation           
63. frequency bodybody accelerometer jerk magnitude mean 
64. frequency bodybody accelerometer jerk magnitude standard deviation   
65. frequency bodybody gyroscope magnitude mean     
66. frequency bodybody gyroscope magnitude standard deviation     
67. frequency bodybody gyroscope jerk magnitude mean 
68. frequency bodybody gyroscope jerk magnitude standard deviation 
