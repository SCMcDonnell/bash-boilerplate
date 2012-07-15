Boilerplate BASH operations
===========================

My toolbox of Bash boilerplate code.

Just copy `boilerplate.sh` to your script directory, include it:

```bash
source boilerplate.sh
```

and get going.

### assert_num_args(NUM)

Asserts the right number of command line arguments, or exit with error.

Example (`test1.sh`): 

```bash
#!/bin/bash
source boilerplate.sh
assert_num_args 1
```

Running `test1.sh`:

```bash
$ ./test1.sh
Usage: test1.sh
Expected 1 arguments (got 0)
```

### exit_on_error(COMMAND) 

Runs `COMMAND`. If the return value is different than 0, exits with that return value.

Example (`test2.sh`): 

```bash
#!/bin/bash
source ../boilerplate.sh
exit_on_error 'echo "1+2" | bc'
exit_on_error 'asdasdsa asa sgfh jyh' 2>&1
echo "You should never see this line"
```
Running `test2.sh`:

```bash
$ ./test2.sh
3
../boilerplate.sh: line 33: asdasdsa: command not found
```
Verify the return value of `test2.sh`:
```
$ echo $?
127
```




