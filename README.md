Boilerplate BASH operations
===========================

My toolbox of Bash boilerplate code.

### assert_number_of_arguments()

Asserts the right number of command line arguments, or exit with error.

Example (`test1.sh`): 

```bash
#!/bin/bash
source boilerplate.sh
assert_number_of_arguments 1
```

```bash
$ ./test1.sh
Usage: test1.sh
Expected 1 arguments (got 0)
```



