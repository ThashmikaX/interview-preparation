# config

Configures Git settings globally or locally.

Usage:

git config --global user.name "Your Name"
git config --global user.email "your@email.com"
Set global username and email.

git config --list
View current Git configuration.

# init

Initializes a new Git repository in the current directory.
Creates a .git directory for tracking changes.

git init

# git clone

Usage:
git clone <repository-url>
git clone <repository-url> <dir-name>

# add

Stages (or tracks) changes to be included in the next commit.

Usage:

git add <file>
Stage a specific file.

git add .
Stage all changes in the current directory.

# commit

Saves the staged changes to the local repository with a descriptive message.

Usage:

git commit -m "Your commit message"
Create a new commit with a message.

git commit -am "Message"
Stage and commit all tracked files in one step (skips git add for modified files).

# git remote

Manages remote repository references.

Usage:

git remote -v
View remote repositories.

git remote add origin <repository-url>
Add a new remote.

# push

Uploads (or syncs) your local commits to a remote repository.

Usage:

git push origin <branch-name>
Push the changes to a specific branch on the remote (commonly origin).

# pull

Fetches and integrates changes from a remote repository to your local branch.

Usage:

git pull origin <branch-name>
Pull changes from the specified branch.

# status

Shows the current status of your working directory, including staged, unstaged, and untracked files.

Usage:

git status

# git branch

Manages branches in your repository.

Usage:

git branch
List all branches.

git branch <branch-name>
Create a new branch.

# git checkout

Switches between branches or restores files.

Usage:

git checkout <branch-name>
Switch to an existing branch.

git checkout -b <new-branch-name>
Create and switch to a new branch.

# git merge

Combines changes from different branches.

Usage:
git merge <branch-name>
Merge the specified branch into your current branch.

# git log

Displays the commit history.

Usage:

git log
View the commit history.

git log --oneline
Compact view of commit history.

# git stash

Temporarily saves changes without committing them.

Usage:

git stash
Stash your current work.

git stash pop
Apply the stashed changes.

# git reset

Unstage or reset changes.

Usage:

git reset <file>
Unstage a file.

git reset --hard <commit>
Reset everything to a specific commit.

# git rebase

    Reapplies commits on top of another base tip.

Usage:

git rebase <branch>
Rebase current branch onto another branch.
