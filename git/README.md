![alt text](https://github.com/Singularity-Coder/Git-Commands/blob/main/assets/banner_git.png)
# Git-Commands
Common Git Commands!

## Basic Git 1
* First create a repository in Github

* Create a new directory using terminal or manually anywhere you want
``mkdir [folder name]**``

* Initialise or start git in MyCode directory. Initialising git in a folder makes the folder a git repository where git starts tracking changes made in that directory or repository 
``git init``

* Then add ur project files into the repository

* Check for modified/added files
``git status``

* Add files to the staging area. Staging area I like an unfinished manuscript of your next version. - 3 ways of adding:
```
git add [file name]
git add [folder name]/
```
* Add all of them
``git add *``
Or
``git add -A``

* To commit files - commit means record the changes in version history - the changes are snapshots meaning the current state at any given moment 
``git commit -m “commit message”``
* Alternate way - Add and commit simultaneously
``git commit -a``

* Connects the local repo to the remote server
``git remote add origin [remote server URL]``

* Check for existing changes first in remote and pull the changes into local repo.
``git pull origin master``

* Then push changes of ur local repo to remote. “origin” is the default name of the remote git repo. “master” is the main branch.
 ``git push -u origin master``


## Basic Git 2
* First create a repository in Github

* Clone a remote repo into your local hard disk through a url or get the remote folder on your local hard disk through a url. 
``git clone [remote server URL]``

* Paste your project files into that repo

* Check for modified/added files
``git status``

* Add them to staging area. Staging area I like an unfinished manuscript of your next version. 
* Add all of them
``git add -A``
* Or add individual file or folder
``git add [file name]``
``git add [folder name]/``

* Commit files
``git commit -m “commit message”``
* Alternate way - Add and commit simultaneously
``git commit -a``

* Pull remote changes first
* If you are directly pulling from master branch
``git pull``

* Then Push your changes to remote repo
* If you are directly pushing to the master branch
``git push``


## Check Status
* Check for modified/added files
``git status``

* To see stuff that must be staged - this is similar to “git status” but is limited to just showing what needs to be staged while “git status” compares with the origin of the branch.
``git diff``

* To see differences in staging area version and current version
``git diff -staged``

* To see differences between any 2 branches
``git diff [branch one] [branch two]``

* To see the history of the current branch
``git log``

* To see the history of a file in the current branch 
``git log –follow[file]``

* To see the actual changes made in the content 
``git show [sha1-commit-id]``


## Create Branches 
* Create new branch
``git branch [branch name]``

* Delete existing branch
``git branch -d [branch name]``

* Delete branch on remote repo
``git push [remote repo name] : [branch name]``

* List all local branches in the current repository 
``git branch``

* List all remote branches 
* https://stackoverflow.com/questions/3471827/how-do-i-list-all-remote-branches-in-git-1-7
```
git fetch --all
git branch -r
```
Or
``git ls-remote --heads``
Or
``git ls-remote``

* Switch between Branches 
``git checkout [branch name]``

* Create and switch to the new Branch in one command
``git checkout -b [branch name]``

* Merge x branch into the current branch you are working on
``git merge [branch name]``


## Add Commit Signature
* Set author name and email to your commits
```
git config --global user.name “user name”
git config --global user.email “user@email.com”
```


## Undo Commits
* To remove file from staging area but preserves the file data 
``git reset [file]``

* To undo all commits until a specified commit - still preserves the commit data
``git reset [sha1-commit-id]``

* To undo all commits until a specified commit and delete all commit data
``git reset –hard [sha1-commit-id]``

* To remove the commit from remote server:
* First remove the previous commit 
``git reset --hard HEAD~1``
Or 
``git reset --hard [sha1-commit-id]``
* Then use this command to force the branch to accept the current state of ur commit 
``git push origin HEAD --force``

* Another way to undo changes to remote branch
``git push -f origin HEAD^:master``

* To remove local commits - Where N is number of commits
``git rebase -i HEAD~N``

* If u have committed with a different email and u want to change the User details for that commit
```
git config --global user.name “UserName”
git config --global user.email “user@email.com”
git rebase -i
git commit --amend --reset-author
```

* Delete file from current version and from the staged version
``git rm [file]``


## Set and Get data from Servers
* Connect local repo to remote repo
``git remote add [remote repo name] [remote server URL]``

* Send committed changes of master branch to remote server
``git push [remote repo name] master``

* Send committed changes of branch to remote server 
``git push [remote repo name] [branch name]``

* Send committed changes of all branches to remote server 
``git push -all [remote repo name] [branch name]``

* Get data from remote server and merge those changes with local version
``git pull [remote repo name] master``


## Cache Git History
* Store all tracked modifications temporarily = stash
``git stash save``

* Restore recent stash
``git stash pop``

* List all stashes
``git stash list``

* Delete recent stash
``git stash drop``


## Custom Commit IDs
* Assign tags to a specified commit for remembering it easily
``git tag [tag name]``

* List all tags
``git tag``

* Push particular tag
``git push origin [tag name]``

* Push all tags
``git push --tags``
