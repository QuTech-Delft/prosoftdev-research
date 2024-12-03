---
title: 'Clean Code'
---
## Introduction

Imagine you are reading a well-organized book or following a simple recipe.
Each step is clear, easy to understand, and there's no unnecessary clutter.
Now imagine the opposite—a messy, confusing set of instructions where you’re
constantly backtracking to figure out what’s going on.
**This is the difference between "clean code" and messy code in programming.**

Here are the key ideas behind **Clean Code**:

- Readable and Understandable
- Well-Organized
- Minimal but Effective
- Easy to Test
- Follows Good Practices

Why Clean Code Matters:

- **For Teamwork**: Most software projects involve multiple developers. Clean code ensures everyone can collaborate without getting stuck deciphering messy work.
- **For Longevity**: Code often lives longer than you think. Writing clean code saves you time in the future when making updates.
- **For Quality**: Clean code reduces bugs and improves the user experience of the software.


::: callout

Clean Code is code that's easy to read, maintain, understand for developers and other teams while improving the quality
of their software through structure and consistency with performance demands. It lets you get the most value and purpose
out of your software.

*https://www.sonarsource.com/solutions/clean-code/*

:::

::: callout

 What is clean code, anyway? Here are some of its features:

- Clean code is obvious for other programmers.
- Clean code does not contain duplication.
- Clean code contains a minimal number of classes and other moving parts.
- Clean code passes all tests.
- Clean code is easier and cheaper to maintain!

*https://refactoring.guru/refactoring*

:::

In this episode we will cover the basics of clean code, introduce some tools that facilitate writing clean code,
and end with a refactoring exercise that will allow you to put these concepts into practice.

## Clean Code Rules

In this section, we will cover some basic rules that, when followed, lead to cleaner code. It's important to recognize
that these rules are just the "tip of the iceberg," as there is much more to explore on this topic. However, adhering to
these simple guidelines can significantly improve the quality of your code. As you grow into a more experienced developer
and adopt advanced software techniques, it remains valuable to stay aligned with "clean code" principles relevant to
these practices. Clean Code: A Handbook of Agile Software Craftsmanship by Robert C. Martin is often regarded as the
definitive guide for the clean code movement and is highly recommended reading.

### General Rules

- Follow standard conventions.
- Keep it simple stupid. Simpler is always better. Reduce complexity as much as possible.
- Boy scout rule. Leave the campground cleaner than you found it.

### Source code structure

- Separate concepts vertically.
- Related code should appear vertically dense.
- Declare variables close to their usage.
- Dependent functions should be close.
- Similar functions should be close.
- Place functions in the downward direction.
- Keep lines short.

### Names rules

- Choose descriptive and unambiguous names.
- Use pronounceable names.
- Use searchable names.
- Replace magic numbers with named constants.

### Functions rules

- Small
- Do one thing.
- Use descriptive names.
- Prefer fewer arguments.
- Have no side effects.

### Comments rules

- Always try to explain yourself in code.
- Don't be redundant.
- Don't add obvious noise.
- Use as explanation of intent.
- Use as clarification of code.
- Use as warning of consequences.

### Unit Test Rules

- Should follow the **F.I.R.S.T** principles:
    - **F**ast
    - **I**ndependent
    - **R**epeatable
    - **S**elf-validating
    - **T**imely
- Should be as "clean" as the rest of the code!
- Should be easy to run
- should be used in conjunction with a test coverage tool


## Clean Code Tools

### Python Coding Conventions

- Introduce https://peps.python.org/pep-0008/
- Advice: select a few rules, and start applying them consistently to your code:
    - Indentation
    - Maximum line length
    - Whitespaces in Expressions and statements
    - Naming conventions
- Expand your rule selection


### Linters - PyLint

- Introduce PyLint, explain what it does
- Installing and running PyLint
- Run PyLint on a code sample

### Modern Development Environments - PyCharm

- Introduce PyCharm, show how to setup a Python interpreter for a project
- Show how PyCharm is highlighting parts of the code that do not follow coding conventions
- Show how PyCharm can help with re-factoring - e.g. changing a variable/function name

### Unit Tests and Test Coverage

- Introduce PyTest
- Introduce the concept of test coverage
- Introduce the *coverage.py* tool
    - how to install it
    - how to run it
    - how to visualize test coverage


## Clean Code/Refactoring Exercise

Interactive coding exercise which can be done individually or in small groups:

- Introduce a small to medium size Python program specifically crafted to break all clean code rules outlined in this episode.
- Participants are instructed to run PyLint on this program - the score will be extremely low!
- Goal of this exercise is to refactor the code to bring the score above 8
- Before starting this process, unit tests should be added.
- Participants should run the *coverage.py* tool on their tests and ensure the critical paths in the code are covered
- Once test coverage is achieved, start re-factoring, applying the clean code techniques learned in this episode
- After each refactoring, the unit tests should pass, which ensures functionality has not been broken.
- After each refactoring, participants should re-run the linter, and see how the code score improves.





