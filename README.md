Codeforces Automation
=====================
http://codeforces.com conducts programming contests. While participating in the contest, it would be better if we could check all the sample test cases by running a single command. These scripts help exactly there.

Currently these scripts are only for programming in c++. (If you want to extend to others, modifying the scripts should be easy)

Installation and Configuring
----------------------------
* Download this repo.
* Update the template.cpp file as needed.

Usage
-----
Suppose you want to participate in http://codeforces.com/contest/479.

Note the number at the end, which we shall be using in the following commands.
* Run './generate.sh 479'. This creates a folder named 479, with a cpp file for each problem whose contents are the same as the template file which you have configured.
* cd 479
* Write the code for a problem (say D)
* Run './verify_tests.sh d' or './verify_tests.sh D' to verify Problem:D with sample test cases provided in the website.

