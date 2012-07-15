Boilerplate BASH operations
===========================

My toolbox of Bash boilerplate code.

Just copy `boilerplate.sh` to your script directory, include it:

```bash
source boilerplate.sh
```

and get going.

### assert_num_args()

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



