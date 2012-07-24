Boilerplate BASH operations
===========================

My toolbox of Bash boilerplate code.

Just copy `boilerplate.sh` to your script directory, include it:

```bash
source boilerplate.sh
```

and get going.

### In short

```bash
assert_number_of_arguments EXPECTED_NUMBER
exit_on_error "COMMAND"
to_lower "String in quotes" RESULT_VARIABLE_NAME
to_upper "String in quotes" RESULT_VARIABLE_NAME
decho "message"
```

## Functions

### assert_num_args(NUM)

Asserts the right number of command line arguments, or exit with error.

Example (`test1.sh`): 

```bash
#!/bin/bash
source boilerplate.sh
assert_num_args 1
```

Output:

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

Output:

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


### to_lower("String in quotes", RESULT_VARIABLE_NAME)

Converts the string to lowercase, and stores it in the new variable name.

Example (from `test3.sh`):
```bash
#!/bin/bash
source ../boilerplate.sh
s="And Now for Something Completely Different"
to_lower "$s" l
echo $l
```

Output:

```bash
AND NOW FOR SOMETHING COMPLETELY DIFFERENT
```

### to_upper("String in quotes", RESULT_VARIABLE_NAME)

Converts the string to UPPERCASE, and stores it in the new variable name.

Example (from `test3.sh`):
```bash
#!/bin/bash
source ../boilerplate.sh
s="And Now for Something Completely Different"
to_lower "$s" l
echo $l
```

Output:

```bash
and now for something completely different
```


### decho(MESSAGE)

`decho` stands for `debug echo`: Prints and echos MESSAGE according to debug flags.

  * echos $MESSAGE if $DEBUG_SHELL is either "true", "yes", "on" or "1".
  * appends $MESSAGE to the filename $DEBUG_LOG_FILE, if $DEBUG_LOG_FILE is not empty.

Example (from `test4.sh`):
```bash
#!/bin/bash
# Write to stdout and log file.
DEBUG_LOG_FILE="test_log_file"
DEBUG_SHELL="Yes"
decho "Screen and file."

# Write to stdout only.
DEBUG_LOG_FILE=""
DEBUG_SHELL="1"
decho "Screen only."
```

Output - stdout:

```bash
Screen only.
```

Output - `test_log_file`:
```bash
$ echo test_log_file
File only.
```



