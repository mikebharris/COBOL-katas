# A solution to the Number Chains kata problem in COBOL

Here's an attempt at a solution in COBOL to the Number Chains kata problem, which is:

```
Given a number, we can form a number chain by

1) arranging its digits in descending order
2) arranging its digits in ascending order
3) subtracting the number obtained in (2) from the number
   obtained (1) to form a new number
4) and repeat these steps unless the new number has already
   appeared in the chain

Note that 0 is a permitted digit. The number of distinct
numbers in the chain is the length of the chain. You are to
write a program that reads numbers and outputs the number
chain and the length of that chain for each number read.

Input and Output
----------------
The input consists of a positive number, less than 10^9.
The output consists of the number chain generated by the
input number, followed by its lengths exactly in the format
indicated below.

Example-1
---------
Input
123456789

Output
Original number was 123456789
987654321 - 123456789 = 864197532
987654321 - 123456789 = 864197532
Chain length 2

Example-2
---------
Input
1234

Output
Original number was 1234
4321 - 1234 = 3087
8730 - 378 = 8352
8532 - 2358 = 6174
7641 - 1467 = 6174
Chain length 4

Example-3
---------
Input
444

Output
Original number was 444
444 - 444 = 0
0 - 0 = 0
Chain length 2
```

The most original example of this problem that I can find on the net is at http://www.karrels.org/Ed/ACM/ec93/prob_b.html - the 1993 East-Central Regionals of the ACM International Collegiate Programming Contest "Problem B:- Number Chains"

## Compile and run under GNU COBOL

You should be using GNU COBOL 2.2 and compile this with COBOL Test Suite to run tests:

```
$ cobc -x -free TestNumberChains.cbl computeNumberChain.cbl orderNumberByAscendingDigits.cbl orderNumberByDescendingDigits.cbl ../../COBOL-Test-Suite/AssertEquals.cbl 
```

Then:

```
$ ./TestNumberChains 
987654321 - 123456789 = 864197532
987654321 - 123456789 = 864197532
Passed: 123456789 returns chain count of 2
000004321 - 000001234 = 000003087
000008730 - 000000378 = 000008352
000008532 - 000002358 = 000006174
000007641 - 000001467 = 000006174
Passed: 1234 returns chain count of 4
000000444 - 000000444 = 000000000
000000000 - 000000000 = 000000000
Passed: 444 returns chain count of 2
```

## Compile and run under MicroFocus Visual COBOL

Set format to Free and Entry Point to Main and compile, when run displays:

```
Solution to Number Chains Kata
------------------------------
Computing number chains for 123456789
987654321 - 123456789 = 864197532
987654321 - 123456789 = 864197532
Number of chains this took was 002
------------------------------
Computing number chains for 000001234
000004321 - 000001234 = 000003087
000008730 - 000000378 = 000008352
000008532 - 000002358 = 000006174
000007641 - 000001467 = 000006174
Number of chains this took was 004
------------------------------
Computing number chains for 000000444
000000444 - 000000444 = 000000000
000000000 - 000000000 = 000000000
Number of chains this took was 002
```