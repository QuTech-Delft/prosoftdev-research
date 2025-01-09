---
title: "Python Virtual Environments"
teaching: 30
exercises: 20
---

::::::::::::::::::::::::::::::::::::::: objectives

- "Set up a Python virtual environment for our software project using `venv` and `pip`."
- "Run our software from the command line."

::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::: questions

- "What are virtual environments in software development and why you should use them?"
- "How can we manage Python virtual environments and external (third-party) libraries?"

::::::::::::::::::::::::::::::::::::::::::::::::::



## Introduction
Python applications often use external libraries that don’t come as part of the standard Python distribution.
This means that you will have to use a *package manager* tool to install them on your system.
Applications will also sometimes need a
specific version of an external library
(e.g. because they were written to work with feature, class,
or function that may have been updated in more recent versions),
or a specific version of Python interpreter.
This means that each Python application you work with may require a different setup
and a set of dependencies so it is useful to be able to keep these configurations
separate to avoid confusion between projects.
The solution for this problem is to create a self-contained
**virtual environment** per project,
which contains a particular version of Python installation
plus a number of additional external libraries.

Virtual environments are not just a feature of Python -
most modern programming languages use a similar mechanism to isolate libraries or dependencies
for a specific project, making it easier to develop, run, test and share code with others.
Some examples include Bundler for Ruby, Conan for C++, or Maven with classpath for Java.
This can also be achieved with more generic package managers like Spack,
which is used extensively in HPC settings to resolve complex dependencies.
In this episode, we learn how to set up a virtual environment to develop our code
and manage our external dependencies.

## Python Virtual Environments

So what exactly are virtual environments, and why use them?

A Python virtual environment helps us create an **isolated working copy** of a software project
that uses a specific version of Python interpreter
together with specific versions of a number of external libraries
installed into that virtual environment.
Python virtual environments are implemented as
directories with a particular structure within software projects,
containing links to specified dependencies
allowing isolation from other software projects on your machine that may require
different versions of Python or external libraries.

As more external libraries are added to your Python project over time,
you can add them to its specific virtual environment
and avoid a great deal of confusion by having
separate (smaller) virtual environments for each project
rather than one huge global environment with potential package version clashes.
Another big motivator for using virtual environments is
that they make sharing your code with others much easier
(as we will see shortly).
Here are some typical scenarios where
the use of virtual environments is highly recommended (almost unavoidable):

- You have an older project that only works under Python 2.
  You do not have the time to migrate the project to Python 3
  or it may not even be possible as some of the third party dependencies
  are not available under Python 3.
  You have to start another project under Python 3.
  The best way to do this on a single machine is
  to set up two separate Python virtual environments.
- One of your Python 3 projects is locked to use
  a particular older version of a third party dependency.
  You cannot use the latest version of the dependency as it breaks things in your project.
  In a separate branch of your project,
  you want to try and fix problems introduced by the new version of the dependency
  without affecting the working version of your project.
  You need to set up a separate virtual environment for your branch to
  'isolate' your code while testing the new feature.

You do not have to worry too much about specific versions of external libraries
that your project depends on most of the time.
Virtual environments also enable you to always use
the latest available version without specifying it explicitly.
They also enable you to use a specific older version of a package for your project, should you need to.

::: callout
### A Specific Python or Package Version is Only Ever Installed Once
Note that you will not have a separate Python or package installations for each of your projects -
they will only ever be installed once on your system but will be referenced
from different virtual environments.
:::

## Tools for Managing Python Virtual Environments and External Packages

There are several commonly used command line tools for managing Python virtual environments:

- `venv`, available by default from the standard `Python` distribution from `Python 3.3+`
- `virtualenv`, needs to be installed separately but supports both `Python 2.7+` and `Python 3.3+`versions
- `pipenv`, created to fix certain shortcomings of `virtualenv`
- `conda`, package and environment management system
  (also included as part of the Anaconda Python distribution often used by the scientific community)
- `poetry`, a modern Python packaging tool which handles virtual environments automatically

While there are pros and cons for using each of the above,
all will do the job of managing Python virtual environments for you
and it may be a matter of personal preference which one you go for.
In this course, we will use `venv` to create and manage our virtual environment
(which is the preferred way for Python 3.3+).
The upside is that `venv` virtual environments created from the command line are
also recognised and picked up automatically by PyCharm IDE,
as we will see in the next episode.

Part of managing your (virtual) working environment involves
installing, updating and removing external packages on your system.
The Python package manager tool `pip` is most commonly used for this -
it interacts and obtains the packages from the central repository called
[Python Package Index (PyPI)](https://pypi.org/).
`pip` can now be used with all Python distributions (including Anaconda).

::: callout
### A Note on `Anaconda` and `conda`
Anaconda is an open source Python distribution commonly used for scientific programming -
it conveniently installs Python, package and environment management `conda`,
and a  number of commonly used scientific computing packages
so you do not have to obtain them separately.
`conda` is an independent command line tool
(available separately from the Anaconda distribution too) with dual functionality:
(1) it is a package manager that helps you find Python packages
from remote package repositories and install them on your system, and
(2) it is also a virtual environment manager.
So, you can use `conda` for both tasks instead of using `venv` and `pip`.
:::

### Many Tools for the Job

Installing and managing Python distributions,
external libraries and virtual environments is, well, complex.
There is an abundance of tools for each task,
each with its advantages and disadvantages,
and there are different ways to achieve the same effect
(and even different ways to install the same tool!).
Note that each Python distribution comes with its own version of `pip` -
and if you have several Python versions installed you have to be extra careful to
use the correct `pip` to manage external packages for that Python version.

`venv` and `pip` are considered the *de facto* standards for virtual environment
and package management for Python 3.
However, the advantages of using Anaconda and `conda` are that
you get (most of the) packages needed for scientific code development included with the distribution.
If you are only collaborating with others who are also using Anaconda,
you may find that `conda` satisfies all your needs.
It is good, however, to be aware of all these tools, and use them accordingly.
As you become more familiar with them you will realise that
equivalent tools work in a similar way even though the command syntax may be different
(and that there are equivalent tools for other programming languages too
to which your knowledge can be ported).

![](../fig/python-environment-hell.png)
<p style="text-align: center;"> Python Environment Hell <br>
From <a href="https://xkcd.com/1987/" target="_blank">XKCD</a> (Creative Commons Attribution-NonCommercial 2.5 License)</p>

In the next sections we will look at how to manage virtual environments from the command line
using `venv` and manage packages using `pip`.

::: callout
### Making Sure You Can Invoke Python
You can test your Python installation from the command line with:

```bash
$ python3 --version # on Mac/Linux
$ python --version # on Windows — Windows installation comes with a python.exe file rather than a python3.exe file
```

If you are using Windows and invoking `python` command causes your Git Bash terminal to hang with no error message or output, you may
need to create an alias for the python executable `python.exe`, as explained in the [troubleshooting section](../common-issues/index.html#python-hangs-in-git-bash).
:::

## A Motivating Example
For the rest of this episode, we will use the following (simple) Python program as a motivation on where virtual
environments may be useful:

```python
import numpy as np
import matplotlib.pyplot as plt
from dateutil import parser
from datetime import timedelta

# Generate time data using python-dateutil and timedelta
start_time = parser.parse("2025-01-01T00:00:00")
time_steps = [start_time + timedelta(minutes=10 * i) for i in range(100)]
time_values = [t.strftime("%Y-%m-%d %H:%M:%S") for t in time_steps]

print(f"Plotting a sine wave starting at {start_time} in 100 steps of 10 minutes")

# Create the sine wave data using numpy
x_values = np.linspace(0, 10 * np.pi, 100)  # 100 points from 0 to 10*pi
y_values = np.sin(x_values)

# Plot the data
plt.figure(figsize=(10, 6))
plt.plot(time_values, y_values, label="Sine Wave")
tick_step = 10
plt.xticks(range(0, len(time_values), tick_step), time_values[::tick_step], rotation=45)

plt.xlabel("Time")
plt.ylabel("Sine Value")
plt.title("Sine Wave Over Time")
plt.grid(True)
plt.tight_layout()
plt.legend()
plt.show()
```

On your system, create a new directory *sine_wave*, and copy the above code in a file *plot_sine_wave.py*.
We want to see what happens if we try to run this program on a system where Python has just been installed,
and for this, we will create a new Python virtual environment.


## Creating Virtual Environments Using `venv`

Creating a virtual environment with `venv` is done by executing the following command:

```bash
$ python3 -m venv /path/to/new/virtual/environment
```

In Windows (GitBash), you can do the same with the following command:

```bash
$  py -3 -m venv /path/to/new/virtual/environment
```


where `/path/to/new/virtual/environment` is a path to a directory where you want to place it - conventionally within
your software project so they are co-located. This will create the target directory for the virtual environment
(and any parent directories that don’t exist already).

::: callout
### What is `-m` Flag in `python3` Command?
The Python `-m` flag means "module" and tells the Python interpreter to treat what follows `-m`
as the name of a module and not as a single, executable program with the same name.
Some modules (such as `venv` or `pip`) have main entry points
and the `-m` flag can be used to invoke them on the command line via the `python` command.
The main difference between running such modules as standalone programs
(e.g. executing "venv" by running the `venv` command directly)
versus using `python3 -m` command seems to be that
with latter you are in full control of which Python module will be invoked
(the one that came with your environment's Python interpreter vs.
some other version you may have on your system).
This makes it a more reliable way to set things up correctly
and avoid issues that could prove difficult to trace and debug.
:::

For our project let us create a virtual environment called "venv".
First, ensure you are within the project root directory (*sine_wave*), then:

```bash
$ python3 -m venv venv
```

If you list the contents of the newly created directory "venv", on a Mac or Linux system
(slightly different on Windows as explained below) you should see something like:

```bash
$ ls -l venv
```

```output
total 8
drwxr-xr-x  12 alex  staff  384  5 Oct 11:47 bin
drwxr-xr-x   2 alex  staff   64  5 Oct 11:47 include
drwxr-xr-x   3 alex  staff   96  5 Oct 11:47 lib
-rw-r--r--   1 alex  staff   90  5 Oct 11:47 pyvenv.cfg
```

So, running the `python3 -m venv venv` command created the target directory called "venv"
containing:

- `pyvenv.cfg` configuration file
  with a home key pointing to the Python installation from which the command was run,
- `bin` subdirectory (called `Scripts` on Windows)
  containing a symlink of the Python interpreter binary used to create the environment
  and the standard Python library,
- `lib/pythonX.Y/site-packages` subdirectory (called `Lib\site-packages` on Windows)
  to contain its own independent set of installed Python packages isolated from other projects, and
- various other configuration and supporting files and subdirectories.

::: callout
### Naming Virtual Environments
What is a good name to use for a virtual environment?

Using "venv" or ".venv" as the name for an environment
and storing it within the project's directory seems to be the recommended way -
this way when you come across such a subdirectory within a software project,
by convention you know it contains its virtual environment details.

A slight downside is that all different virtual environments on your machine
then use the same name
and the current one is determined by the context of the path you are currently located in.
A (non-conventional) alternative is
to use your project name for the name of the virtual environment,
with the downside that there is nothing to indicate that such a directory contains a virtual environment.

In our case, we have settled to use the name "venv" instead of ".venv"
since it is not a hidden directory and we want it to be displayed by the command line
when listing directory contents
(the "." in its name that would, by convention, make it hidden).
In the future, you will decide what naming convention works best for you.
Here are some references for each of the naming conventions:

- [The Hitchhiker's Guide to Python](https://docs.python-guide.org/dev/virtualenvs/)
  notes that "venv" is the general convention used globally
- [The Python Documentation](https://docs.python.org/3/library/venv.html)
  indicates that ".venv" is common
- ["venv" vs ".venv" discussion](https://discuss.python.org/t/trying-to-come-up-with-a-default-directory-name-for-virtual-environments/3750)
:::

Once you’ve created a virtual environment, you will need to activate it.

On Mac or Linux, it is done as:

```bash
$ source venv/bin/activate
(venv) $
```

On Windows, recall that we have `Scripts` directory instead of `bin`
and activating a virtual environment is done as:

```bash
$ source venv/Scripts/activate
(venv) $
```

Activating the virtual environment will change your command line’s prompt
to show what virtual environment you are currently using
(indicated by its name in round brackets at the start of the prompt),
and modify the environment so that running Python will get you
the particular version of Python configured in your virtual environment.

You can now verify you are using your virtual environment's version of Python:

```bash
(venv) $  python --version
```

```output
Python 3.12.0
```

When you’re done working on your project, you can exit the environment with:

```bash
(venv) $ deactivate
```

If you have just done the `deactivate`,
ensure you reactivate the environment ready for the next part:

```bash
$ source venv/bin/activate
(venv) $
```

::: callout
### Python Within A Virtual Environment

Within an active virtual environment,
commands `python3` and `python` should both refer to the version of Python 3
you created the environment with (note you may have multiple Python 3 versions installed).

However, on some machines with Python 2 installed,
`python` command may still be hardwired to the copy of Python 2
installed outside of the virtual environment - this can cause errors and confusion.

You can always check which version of Python you are using in your virtual environment
with the command `which python` to be absolutely sure.
We continue using `python3` in this material to avoid mistakes,
but the command `python` may work for you as expected.
:::


## Installing External Packages Using `pip`

Now that we have a virtual environment, let us try to run the *plot_sine_wave.py* program:

```bash
python plot_sine_wave.py
```
```output
Traceback (most recent call last):
  File "C:\projects\programming_course\sine_wave\plot_sine_wave.py", line 1, in <module>
    import numpy as np
ModuleNotFoundError: No module named 'numpy'
```

As we can see in the code ('includes'), our code depends on a number of external libraries -
`numpy`, `matplotlib`, and `python-dateutil`.
In order for the code to run on your machine, you need to install these two dependencies into your virtual environment.

To install the latest version of a package with `pip` you use pip's `install` command and specify the package’s name, e.g.:

```bash
(venv) $ python3 -m pip install numpy
(venv) $ python3 -m pip install matplotlib
(venv) $ python3 -m pip install python-dateutil
```

or like this to install multiple packages at once for short:

```bash
(venv) $ python3 -m pip install numpy matplotlib python-dateutil
```

::: callout
#### How About `pip3 install <package-name>` Command?
You may have seen or used the `pip3 install <package-name>` command in the past, which is shorter
and perhaps more intuitive than `python3 -m pip install`. However, the
[official Pip documentation](https://pip.pypa.io/en/stable/user_guide/#running-pip) recommends
`python3 -m pip install` and core Python developer Brett Cannon offers a
[more detailed explanation](https://snarky.ca/why-you-should-use-python-m-pip/)
of edge cases when the two commands may produce different results and why `python3 -m pip install`
is recommended. In this material, we will use `python3 -m` whenever we have to invoke a Python
module from command line.
:::

If you run the `python3 -m pip install` command on a package that is already installed,
`pip` will notice this and do nothing.

To install a specific version of a Python package give the package name followed by `==` and the version number,
e.g. `python3 -m pip install numpy==1.21.1`.

To specify a minimum version of a Python package, you can do `python3 -m pip install numpy>=1.20`.

To upgrade a package to the latest version, e.g. `python3 -m pip install --upgrade numpy`.

To display information about a particular installed package do:

```bash
(venv) $ python3 -m pip show numpy
```

```output
Name: numpy
Version: 2.2.1
Summary: Fundamental package for array computing in Python
Home-page:
Author: Travis E. Oliphant et al.
Author-email:
License: Copyright (c) 2005-2024, NumPy Developers.
 All rights reserved.
...
```

To list all packages installed with `pip` (in your current virtual environment):

```bash
(venv) $ python3 -m pip list
```

```output
Package         Version
--------------- -----------
contourpy       1.3.1
cycler          0.12.1
fonttools       4.55.3
kiwisolver      1.4.8
matplotlib      3.10.0
numpy           2.2.1
packaging       24.2
pillow          11.1.0
pip             23.2.1
pyparsing       3.2.1
python-dateutil 2.9.0.post0
six             1.17.0
```

To uninstall a package installed in the virtual environment do: `python3 -m pip uninstall <package-name>`.
You can also supply a list of packages to uninstall at the same time.

### Exporting/Importing Virtual Environments Using `pip`

You are collaborating on a project with a team so, naturally, you will want to share your environment with your collaborators
so they can easily 'clone' your software project with all of its dependencies and everyone can replicate equivalent virtual environments on their machines.
`pip` has a handy way of exporting, saving and sharing virtual environments.

To export your active environment -
use `python3 -m pip freeze` command to produce a list of packages installed in the virtual environment.
A common convention is to put this list in a `requirements.txt` file:

```bash
(venv) $ python3 -m pip freeze > requirements.txt
(venv) $ cat requirements.txt
```

```output
contourpy==1.3.1
cycler==0.12.1
fonttools==4.55.3
kiwisolver==1.4.8
matplotlib==3.10.0
numpy==2.2.1
packaging==24.2
pillow==11.1.0
pyparsing==3.2.1
python-dateutil==2.9.0.post0
six==1.17.0
```

The first of the above commands will create a `requirements.txt` file in your current directory.
Yours may look a little different, depending on the version of the packages you have installed,
as well as any differences in the packages that they themselves use.

The `requirements.txt` file can then be committed to a version control system
(we will see how to do this using Git in one of the following episodes)
and get shipped as part of your software and shared with collaborators and/or users.
They can then replicate your environment
and install all the necessary packages from the project root as follows:

```bash
(venv) $ python3 -m pip install -r requirements.txt
```

As your project grows - you may need to update your environment for a variety of reasons.
For example, one of your project's dependencies has just released a new version
(dependency version number update),
you need an additional package for data analysis (adding a new dependency)
or you have found a better package and no longer need the older package
(adding a new and removing an old dependency).
What you need to do in this case
(apart from installing the new and removing the packages that are no longer needed
from your virtual environment)
is update the contents of the `requirements.txt` file accordingly
by re-issuing `pip freeze` command
and propagate the updated `requirements.txt` file to your collaborators
via your code sharing platform (e.g. GitHub).

::: callout
#### Official Documentation
For a full list of options and commands,
consult the [official `venv` documentation](https://docs.python.org/3/library/venv.html)
and the [Installing Python Modules with `pip` guide](https://docs.python.org/3/installing/index.html#installing-index).
Also check out the guide
["Installing packages using `pip` and virtual environments"](https://packaging.python.org/guides/installing-using-pip-and-virtual-environments/#installing-packages-using-pip-and-virtual-environments).
:::

## Running Python Scripts From Command Line
Congratulations! Your environment is now activated and set up to run our `plot_sine_wave.py` program from the command line.

You should already be located in the root of the `sine_wave` directory (if not, please navigate to it from the command line now).
To run the program, type the following command:

```bash
(venv) $ python plot_sine_wave.py
```

You should now see the following plot:

![](fig/sine_wave.jpg){alt="Sine Wave Plot" .image-with-shadow width="600px"}


:::::::::::::::::::::::::::::::::::::::  challenge

### Multiple Python versions on the same machine

Using virtual environments it is very easy to manage multiple Python versions on the same machine.
As a challenge, install Python 3.5 on your system, and create a virtual environment specifically for it.
Then try to run *plot_sine_wave.py* in this new environment. Does it work? Modify the program so it does.


::::::::::::::::::::::::::::::::::::::::::::::::::


&nbsp;
&nbsp;
&nbsp;

:::::::::::::::::::::::::::::::::::::::: keypoints
- "Virtual environments keep Python versions and dependencies required by different projects separate."
- "A virtual environment is itself a directory structure."
- "Use `venv` to create and manage Python virtual environments."
- "Use `pip` to install and manage Python external (third-party) libraries."
- "`pip` allows you to declare all dependencies for a project in a separate
file (by convention called `requirements.txt`) which can be shared with collaborators/users and used to replicate a virtual environment."
- "Use `python3 -m pip freeze > requirements.txt` to take snapshot of your project's dependencies."
- "Use `python3 -m pip install -r requirements.txt` to replicate someone else's virtual environment on your machine from
the `requirements.txt` file."
::::::::::::::::::::::::::::::::::::::::::::::::::


