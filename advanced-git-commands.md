---
title: 'Advanced Git Commands'
teaching: 30
exercises: 80
---

:::::::::::::::::::::::::::::::::::::: questions 

- How can I use version control to collaborate with other people?
- What do I do when my changes conflict with someone else's?

::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::: objectives

- Clone a remote repository.
- Collaborate by pushing to a common repository.
- Describe the basic collaborative workflow.
- Explain what conflicts are and when they can occur.
- Resolve conflicts resulting from a merge.

::::::::::::::::::::::::::::::::::::::::::::::::

## Collaborating

- Clone a remote repository setup in GitLab for this course
- Make changes to a file, commit, and push back to GitLab
- Introduce the basic collaborative workflow:
    - git pull
    - make changes
    - git add/commit
    - git push
- Reviewing and commenting changes in GitLab

## Solving Conflicts
- Explain when and why conflicts occur
- Explain how conflicts can be solved through a merge cycle
- Techniques to minimize conflicts:
    - Pull from upstream more frequently, especially before starting new work
    - Make smaller more atomic commits
    - Where logically appropriate, break large files into smaller ones so that it is less likely that two authors will alter the same file simultaneously
    - Clarify who is responsible for what areas with your collaborators
    - Discuss what order tasks should be carried out in with your collaborators so that tasks expected to change the same lines won’t be worked on simultaneously


## Hands-on Project

- Work in groups of two
- Create a GitLab project on the TUD GitLab server
- Assign project roles to each team member
- Create a shared (text) document representing a joint research paper.
- Each member works independently on different sections of the document in separate branches.
- Show how merging can be done without conflicts
- Start working on the same section creating a conflict
- show how it can be solved using GitLab merge requests and Git conflict resolution

&nbsp;
&nbsp;

::::::::::::::::::::::::::::::::::::: keypoints 

- `git clone` copies a remote repository to create a local repository with a remote called `origin` automatically set up.
- Conflicts occur when two or more people change the same lines of the same file.
- The version control system does not allow people to overwrite each other's changes blindly, but highlights conflicts so that they can be resolved.

::::::::::::::::::::::::::::::::::::::::::::::::

