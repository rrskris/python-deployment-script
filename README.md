This bash script automates the following tasks: 

* Setsup Virtual environment to run the Python source code by downloading the dependencies reading requirements.txt, and runs in the backgounds. The logs are collected to nohup.out

* Stops the current process with PID based on the port number.
* And restarts the same project, in stop start sequence.

* It takes 2 arguments at a given time, first argument being either one of <deploy|stop|restart> and second argument is the Python project code

Usage ./python-deploy.sh <deploy|stop|restart> git-directory
