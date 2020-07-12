# Mirror Manager
The Mirror Manager is designed to manage mirroring based on
the week of the year on the following sources:

1. `git`
2. `wget`
3. `pip`
4. Debian

The following directory structure is designed be maintained:

```
mirror/
├── debian
│   └── stretch
│       └── w27_2020
├── git
│   └── stretch
│       └── w28_2020
├── pip
│   └── stretch
│       └── w27_2020
└── wget
    └── stretch
        └── w27_2020
```
In this case, the actually directory entry will be in the form `week of year _ year`, and in this case,
we are shown Week 27 of the year 2020.

The Mirror Manager, `mirror_manager`, has the following features:

```
./mirror_manager -h

./mirror_manager: Peform all mirroring operations:
   -p file           # PIP Filelist.
   -w file           # wget Filelist.
   -g file           # git Filelist for bare clones.
   -d release_name   # Debian release name, default [stretch].
   -o                # Do Debian Mirror.
   -r root_path      # Root Path, default </var/www/html/mirror>.
   -l log_path       # Logfile Path, default <./>.
   -s                # Show settings and exit.
   -a mirror_index   # Override automatich mirror index <wxx_yyyy.
   -h                # Help.

  Actions are only taken on flags specified.
```
## Input Files
Input files are generated through wrappers around `git` and `wget`, as well as
`/etc/pip.conf` updates to generate logs.

In the SONIC-2 builds, we have two types of logfiles created:

1. Those created during build of <sonic-slave-stretch> in Docker.
2. Those created during normal build of system, such as building `~/target/sonic-broadcom.bin`

The logs created during build time are raw, in that they must be parsed so that clean
lists are generated.  This is done through the `<~/logging_utilities`, which discuss
this parsing in detail.
