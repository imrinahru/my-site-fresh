---
title: Be a Part of p5.js community
date: 2025-11-09
tags:
location:
draft: true
summary: Key takeaway in 20 words.
---
Below contents almost entirely comes from the information session held by p5.js editor, Rachel Lim. It was inspiring and beginner-friendly to say the least.
## Overview  

### About Open-Source

A comprehensive definition that most people might not be aware of: https://opensource.org/osd

**1. Free Redistribution**  
Anyone can give away or sell the software freely, without paying fees.

**2. Source Code**  
The actual code must be available, so people can read, modify, and share it easily.

**3. Derived Works**  
People are allowed to change the software and share their modified versions.

**4. Integrity of the Author’s Source Code**  
Authors can require that modified versions be labeled differently, but they can’t stop people from sharing changes.

**5. No Discrimination Against Persons or Groups**  
The license must treat everyone equally—no one can be excluded.

**6. No Discrimination Against Fields of Endeavor**  
The software can be used for any purpose (business, research, etc.).

**7. Distribution of License**  
Everyone who gets the software automatically gets the same rights.

**8. License Must Not Be Specific to a Product**  
The rights don’t depend on how or where the software is packaged.

**9. License Must Not Restrict Other Software**  
It can’t force other software distributed with it to be open source too.

**10. License Must Be Technology-Neutral**  
The rules can’t depend on any specific technology or interface type.

![[Pasted image 20251109095157.png]]
Copyleft licenses require that any modified version of an open source project also be released under the
same license as the original project.
A strong copyleft license requires that any software
that uses a project licensed under it must also be
licensed in the same way.
Weak licenses have no requirements for software that only use the licensed project.
Permissive licenses do not put restrictions on people
modifying or redistributing a project, as long as it's credited properly

![[Pasted image 20251109091503.png]]
![[Pasted image 20251109094033.png]]
From p5.js slideshow

![[Pasted image 20251109093655.png]]
![[Pasted image 20251109093731.png]]
From https://www.flickr.com/photos/fidelman/4523518468/in/photostream/, an argument frozen at 16 years ago 

### FLOSS: Free, Libre, and Open Source Software

A must read: https://medium.com/processing-foundation/processing-and-floss-d35aa4607f4c


### Processing and p5.js
Processing is a flexible software sketchbook and a
language for learning how to code.

>  How could they make programming more accessible to designers and artists? And what would it look like for code to become both a creative medium and part of the creative process itself? "

p5.js is a JavaScript library for creative coding with a
focus on making coding accessible and inclusive.

>  “What would Processing look like if it were reinvented today?”

Another must read: https://eyeondesign.aiga.org/processing-the-software-that-shaped-creative-coding/

>  One of the things I felt early on with p5 is that it wasn’t just about having a diverse community of users; it was really about asking who’s making the tool, who’s contributing to it, because any tool is going to be embedded with the biases and the perspectives of the people making it.


### Contributions Over the Years

[Processing Contributions Repository](https://github.com/processing/processing-contributions)
[p5.js Github Repository](https://github.com/processing/p5.js)
[PF Fellowships](https://processingfoundation.org/fellowships)

### How to Contribute?

#### An Open-Source Project

Example: https://github.com/processing/p5.js-web-editor

Platform
	Like Github
LICENSE
	[[#About Open-Source]]
README
	a title, description, list of features, instructions on how to use a project, ancillary technologies, and collaborators.
Code of Conduct
	A Code of Conduct is a written set of rules and standards for those who interact with a project
Documentation
	Documentation for a project entails more in-depth information on how to use or contribute to it, and are mostly written in Markdown: 
	- How to setup a local environment
	- Diagrams of the project's infrastructures
	- Guidelines for providing translations
	Refer to: https://github.com/variar/klogg/blob/master/DOCUMENTATION.md

#### Activities

##### Forms of Contribution
https://allcontributors.org/docs/en/emoji-key

##### Creating an Issue
A good issue should be as descriptive as possible.
Include information like:
- Version Number
- Browser
- Expected vs. Real Behavior
- Steps to Reproduce
- Supplementary Media (images, videos, links)
[Example](https://github.com/processing/p5.js-web-editor/issues/3332)


##### Reviewing Contributions
You can review contributions by "triaging issues",
or adding labels and deleting duplicates.
An important label to add is a "Good First Issue",
which indicates issues that newcomers could easily
work on.
![[Pasted image 20251109101133.png]]

##### Writing a Pull Request
Pull Requests are a feature that allows a
repository's collaborators to review and give
feedback on proposed code changes before they
are accepted and merged into another branch.

##### Workflow for Contributing Code

![[Pasted image 20251109110438.png]]
![[Pasted image 20251109101654.png]]

1. Browsing through issues on Github to find an issue or open an issue.
2. Forking the Repository.
3. Creating a local copy of your forked project. For today's workshop, you can use Github Desktop for this!
4. Planning any relevant material.
5. Adding your changes using a Text Editor (i.e. VS Code, Brackets, Sublime).
6. Committing and pushing the changes to your forked repository
7. Creating a pull request to the original repository
8. Revising your pull request based on feedback
9. Rejection


- Should I use forking, cloning, adding brunch together all the time? They sound like duplicating, duplicating, then duplicating
- What is "adding upstream remote"?
- Can we always use Github desktop for creating a local copy? or is there a better way to do this?
- What is mongoDB, when I'll use it?

##### Access localhost 8000
1. Go to the folder where your cloned code lives
```
cd C:\Users\rinac\Documents\p5.js\00_Community\p5.js-web-editor\p5.js-web-editor>
```
2. make sure npm is installed
```
 npm install
```
3. Start npm
```
npm start
```
4. Access http://localhost:8000/ when you see the dialogue below
```
webpack 5.94.0 compiled successfully in 100320 ms
```
5. To end, enter ctl+c in console


##### Things you can do

###### Community Management
What information should be communicated to new
contributors? What improvements could be made to
public messaging?
How to handle Github discussions or the Wiki? Better areas of discussion?
**Mock response to different scenarios**
Create new issue documentation
**How to handle [translations](https://github.com/processing/p5.js-web-editor/issues/1427)?**

###### Code/design Contribution
**Open an Issue for Missing Translations for [About Page](https://editor.p5js.org/about)**
Investigate improvements for File Management / Structure
**Creating a Pull Request for a [Good First Issue](https://github.com/processing/p5.js-web-editor/labels/Good%20First%20Issue)**
**Convert Components to use 'styled-components'**
**Accessibility Testing**
**Open New Issues for Styling Bug Fixes**


Rachel Lim

2:08 PM

[https://www.munusshih.com/about/](https://www.munusshih.com/about/)

[https://github.com/munusshih/p5.genzine](https://github.com/munusshih/p5.genzine)

![](https://lh3.googleusercontent.com/a/ACg8ocLoRTTjfJcIjXbsfqBrV3htgfOtZXeFxPRqbjyMysZC1yDkrg=s88-c-k-no-mo)

Rachel Lim

2:11 PM

kit kuksenok

[https://github.com/processing/p5.js](https://github.com/processing/p5.js)

2:15 PM

[https://antiboredom.github.io/p5.riso/](https://antiboredom.github.io/p5.riso/)

Hover over a message to pin it_keep_

![](https://lh3.googleusercontent.com/a/ACg8ocLoRTTjfJcIjXbsfqBrV3htgfOtZXeFxPRqbjyMysZC1yDkrg=s88-c-k-no-mo)

Rachel Lim

2:40 PM

[https://github.com/processing/p5.js-web-editor/issues/3079](https://github.com/processing/p5.js-web-editor/issues/3079)

[https://github.com/processing/p5.js-web-editor/pull/3497](https://github.com/processing/p5.js-web-editor/pull/3497)

![](https://lh3.googleusercontent.com/a/ACg8ocLoRTTjfJcIjXbsfqBrV3htgfOtZXeFxPRqbjyMysZC1yDkrg=s88-c-k-no-mo)

Rachel Lim

2:54 PM

[https://github.com/processing/p5.js-web-editor/blob/develop/contributor_docs/installation.md](https://github.com/processing/p5.js-web-editor/blob/develop/contributor_docs/installation.md)

```
PowerShell 7.5.4
PS C:\Users\rinac> cd C:\Users\rinac\Documents\p5.js\00_Community\p5.js-web-editor\p5.js-web-editor
PS C:\Users\rinac\Documents\p5.js\00_Community\p5.js-web-editor\p5.js-web-editor> ls

    Directory: C:\Users\rinac\Documents\p5.js\00_Community\p5.js-web-editor\p5.js-web-editor

Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d----          2025-11-10  6:51 AM                .github
d----          2025-11-10  6:51 AM                .storybook
d----          2025-11-10  6:51 AM                client
d----          2025-11-10  6:51 AM                common
d----          2025-11-10  6:51 AM                contributor_docs
d----          2025-11-10  6:51 AM                infrastructure
d----          2025-11-10  9:02 AM                node_modules
d----          2025-11-10  6:51 AM                public
d----          2025-11-10  6:51 AM                server
d----          2025-11-10  6:51 AM                translations
d----          2025-11-10  6:51 AM                webpack
-a---          2025-11-10  6:51 AM           3233 .babelrc
-a---          2025-11-10  6:51 AM           1184 .env
-a---          2025-11-10  6:51 AM           1184 .env.example
-a---          2025-11-10  6:51 AM             18 .eslintignore
-a---          2025-11-10  6:51 AM           4351 .eslintrc
-a---          2025-11-10  6:51 AM            351 .gitignore
-a---          2025-11-10  6:51 AM              8 .nvmrc
-a---          2025-11-10  6:51 AM            400 .prettierrc
-a---          2025-11-10  6:51 AM           1155 .travis.yml
-a---          2025-11-10  6:51 AM           2706 app.json
-a---          2025-11-10  6:51 AM           1055 deploy_staging.sh
-a---          2025-11-10  6:51 AM           1009 deploy.sh
-a---          2025-11-10  6:51 AM            411 docker-compose-development.yml
-a---          2025-11-10  6:51 AM           1623 docker-compose.yml
-a---          2025-11-10  6:51 AM            723 Dockerfile
-a---          2025-11-10  6:51 AM            845 index.js
-a---          2025-11-10  6:51 AM           5617 kubernetes_app.yml
-a---          2025-11-10  6:51 AM          24479 LICENSE
-a---          2025-11-10  6:51 AM            211 nodemon.json
-a---          2025-11-10  9:02 AM        2858876 package-lock.json
-a---          2025-11-10  6:51 AM          11329 package.json
-a---          2025-11-10  6:51 AM             74 Procfile
-a---          2025-11-10  6:51 AM           4934 README.md
-a---          2025-11-10  6:51 AM            718 tsconfig.base.json
-a---          2025-11-10  6:51 AM             96 tsconfig.json

PS C:\Users\rinac\Documents\p5.js\00_Community\p5.js-web-editor\p5.js-web-editor> git branch
* develop
PS C:\Users\rinac\Documents\p5.js\00_Community\p5.js-web-editor\p5.js-web-editor> git remote -v
origin  https://github.com/imrinahru/p5.js-web-editor.git (fetch)
origin  https://github.com/imrinahru/p5.js-web-editor.git (push)
PS C:\Users\rinac\Documents\p5.js\00_Community\p5.js-web-editor\p5.js-web-editor> git pull origin develop
remote: Enumerating objects: 15, done.
remote: Counting objects: 100% (2/2), done.
remote: Compressing objects: 100% (2/2), done.
remote: Total 15 (delta 0), reused 0 (delta 0), pack-reused 13 (from 1)
Unpacking objects: 100% (15/15), 11.06 KiB | 166.00 KiB/s, done.
From https://github.com/imrinahru/p5.js-web-editor
 * branch              develop    -> FETCH_HEAD
   b332a992..dbe35040  develop    -> origin/develop
Updating b332a992..dbe35040
Fast-forward
 client/modules/IDE/hooks/useP5Version.jsx | 6 +++---
 common/p5Versions.js                      | 1 +
 2 files changed, 4 insertions(+), 3 deletions(-)
PS C:\Users\rinac\Documents\p5.js\00_Community\p5.js-web-editor\p5.js-web-editor> npm install

up to date, audited 3229 packages in 1m

444 packages are looking for funding
  run `npm fund` for details

130 vulnerabilities (9 low, 77 moderate, 41 high, 3 critical)

To address issues that do not require attention, run:
  npm audit fix

To address all issues possible (including breaking changes), run:
  npm audit fix --force

Some issues need review, and may require choosing
a different dependency.

Run `npm audit` for details.
PS C:\Users\rinac\Documents\p5.js\00_Community\p5.js-web-editor\p5.js-web-editor> npm start

> p5.js-web-editor@2.19.0 start
> cross-env BABEL_DISABLE_CACHE=1 NODE_ENV=development nodemon index.js

[nodemon] 2.0.22
[nodemon] reading config .\nodemon.json
[nodemon] to restart at any time, enter `rs`
[nodemon] or send SIGHUP to 10348 to restart
[nodemon] ignoring: .\.git/**/* node_modules/**/node_modules
[nodemon] watching path(s): server\**\*
[nodemon] watching extensions: js,ts,json
[nodemon] starting `node index.js`
[nodemon] forking
[nodemon] child pid: 2776
[nodemon] watching 109 files
(node:2776) [MONGOOSE] Warning: Duplicate schema index on {"username":1} found. This is often due to declaring an index using both "index: true" and "schema.index()". Please remove the duplicate index definition.
(Use `node --trace-warnings ...` to show where the warning was created)
(node:2776) [MONGOOSE] Warning: Duplicate schema index on {"email":1} found. This is often due to declaring an index using both "index: true" and "schema.index()". Please remove the duplicate index definition.
p5.js Web Editor is running on port: 8000!
p5.js Preview Server is running on port: 8002
=============

WARNING: You are currently running a version of TypeScript which is not officially supported by @typescript-eslint/typescript-estree.

You may find that it works just fine, or you may not.

SUPPORTED TYPESCRIPT VERSIONS: >=3.3.1 <5.2.0

YOUR TYPESCRIPT VERSION: 5.9.2

Please only submit bug reports when using the officially supported version.

=============
assets by chunk 62.4 KiB (auxiliary name: app)
  assets by path *.svg 27.6 KiB 21 assets
  asset 2e95a3ff3baf95b44e86.mp3 21.4 KiB [emitted] [immutable] [from: client/sounds/audioAlert.mp3] (auxiliary name: app)
  asset images/p5js-square-logo..png 13.4 KiB [emitted] [from: client/images/p5js-square-logo.png] (auxiliary name: app)
assets by path locales/ 427 KiB
  asset locales/hi/translations.json 42.7 KiB [emitted] [from: translations/locales/hi/translations.json] [copied]
  asset locales/bn/translations.json 37.6 KiB [emitted] [from: translations/locales/bn/translations.json] [copied]
  asset locales/uk-UA/translations.json 36.4 KiB [emitted] [from: translations/locales/uk-UA/translations.json] [copied]
  asset locales/ur/translations.json 28.6 KiB [emitted] [from: translations/locales/ur/translations.json] [copied]
  + 12 assets
assets by path *.js 54.4 MiB
  asset app.js 43.2 MiB [emitted] (name: app)
  asset previewApp.js 8.39 MiB [emitted] (name: previewApp)
  asset previewScripts.js 2.83 MiB [emitted] (name: previewScripts)
orphan modules 815 KiB [orphan] 443 modules
runtime modules 87.1 KiB 46 modules
modules by path ./node_modules/ 14 MiB
  javascript modules 13.9 MiB 1338 modules
  json modules 46.6 KiB 5 modules
modules by path ./client/ 2.19 MiB (javascript) 63.3 KiB (asset) 281 modules
modules by path ./server/ 12.1 KiB 6 modules
modules by mime type image/png 1.59 KiB
  data:image/png;base64,iVBORw0KGgoAAAAN.. 324 bytes [built] [code generated]
  data:image/png;base64,iVBORw0KGgoAAAAN.. 295 bytes [built] [code generated]
  + 4 modules
modules by path ./common/ 3.91 KiB
  ./common/p5Versions.js 2.63 KiB [built] [code generated]
  ./common/types/index.ts 1.28 KiB [built] [code generated]
./package.json 9.12 KiB [built] [code generated]
webpack 5.94.0 compiled successfully in 219884 ms
assets by chunk 62.4 KiB (auxiliary name: app)
  assets by path *.svg 27.6 KiB 21 assets
  asset 2e95a3ff3baf95b44e86.mp3 21.4 KiB [emitted] [immutable] [from: client/sounds/audioAlert.mp3] (auxiliary name: app)
  asset images/p5js-square-logo..png 13.4 KiB [emitted] [from: client/images/p5js-square-logo.png] (auxiliary name: app)
assets by path locales/ 427 KiB
  asset locales/hi/translations.json 42.7 KiB [emitted] [from: translations/locales/hi/translations.json] [copied]
  asset locales/bn/translations.json 37.6 KiB [emitted] [from: translations/locales/bn/translations.json] [copied]
  asset locales/uk-UA/translations.json 36.4 KiB [emitted] [from: translations/locales/uk-UA/translations.json] [copied]
  asset locales/ur/translations.json 28.6 KiB [emitted] [from: translations/locales/ur/translations.json] [copied]
  + 12 assets
assets by path *.js 54.4 MiB
  asset app.js 43.2 MiB [emitted] (name: app)
  asset previewApp.js 8.39 MiB [emitted] (name: previewApp)
  asset previewScripts.js 2.83 MiB [emitted] (name: previewScripts)
orphan modules 815 KiB [orphan] 443 modules
runtime modules 87.1 KiB 46 modules
modules by path ./node_modules/ 14 MiB
  javascript modules 13.9 MiB 1338 modules
  json modules 46.6 KiB 5 modules
modules by path ./client/ 2.19 MiB (javascript) 63.3 KiB (asset) 281 modules
modules by path ./server/ 12.1 KiB 6 modules
modules by mime type image/png 1.59 KiB
  data:image/png;base64,iVBORw0KGgoAAAAN.. 324 bytes [built] [code generated]
  data:image/png;base64,iVBORw0KGgoAAAAN.. 295 bytes [built] [code generated]
  + 4 modules
modules by path ./common/ 3.91 KiB
  ./common/p5Versions.js 2.63 KiB [built] [code generated]
  ./common/types/index.ts 1.28 KiB [built] [code generated]
./package.json 9.12 KiB [built] [code generated]
webpack 5.94.0 compiled successfully in 223588 ms
assets by status 54.8 MiB [cached] 42 assets
cached modules 17 MiB (javascript) 63.3 KiB (asset) 87.1 KiB (runtime) [cached] 2128 modules
webpack 5.94.0 compiled successfully in 2582 ms
assets by status 54.8 MiB [cached] 42 assets
cached modules 17 MiB (javascript) 63.3 KiB (asset) 87.1 KiB (runtime) [cached] 2128 modules
webpack 5.94.0 compiled successfully in 1937 ms
```

```
Windows PowerShell
Copyright (C) Microsoft Corporation. All rights reserved.

Install the latest PowerShell for new features and improvements! https://aka.ms/PSWindows

PS C:\Users\rinac>  cd C:\Users\rinac\Documents\p5.js\00_Community\p5.js-web-editor\p5.js-web-editor
PS C:\Users\rinac\Documents\p5.js\00_Community\p5.js-web-editor\p5.js-web-editor> git checkout -b documentation-updates
Switched to a new branch 'documentation-updates'
PS C:\Users\rinac\Documents\p5.js\00_Community\p5.js-web-editor\p5.js-web-editor> git branch
  develop
* documentation-updates
PS C:\Users\rinac\Documents\p5.js\00_Community\p5.js-web-editor\p5.js-web-editor> git commit -1
error: unknown switch `1'
usage: git commit [-a | --interactive | --patch] [-s] [-v] [-u[<mode>]] [--amend]
                  [--dry-run] [(-c | -C | --squash) <commit> | --fixup [(amend|reword):]<commit>]
                  [-F <file> | -m <msg>] [--reset-author] [--allow-empty]
                  [--allow-empty-message] [--no-verify] [-e] [--author=<author>]
                  [--date=<date>] [--cleanup=<mode>] [--[no-]status]
                  [-i | -o] [--pathspec-from-file=<file> [--pathspec-file-nul]]
                  [(--trailer <token>[(=|:)<value>])...] [-S[<keyid>]]
                  [--] [<pathspec>...]

    -q, --[no-]quiet      suppress summary after successful commit
    -v, --[no-]verbose    show diff in commit message template

Commit message options
    -F, --[no-]file <file>
                          read message from file
    --[no-]author <author>
                          override author for commit
    --[no-]date <date>    override date for commit
    -m, --[no-]message <message>
                          commit message
    -c, --[no-]reedit-message <commit>
                          reuse and edit message from specified commit
    -C, --[no-]reuse-message <commit>
                          reuse message from specified commit
    --[no-]fixup [(amend|reword):]commit
                          use autosquash formatted message to fixup or amend/reword specified commit
    --[no-]squash <commit>
                          use autosquash formatted message to squash specified commit
    --[no-]reset-author   the commit is authored by me now (used with -C/-c/--amend)
    --trailer <trailer>   add custom trailer(s)
    -s, --[no-]signoff    add a Signed-off-by trailer
    -t, --[no-]template <file>
                          use specified template file
    -e, --[no-]edit       force edit of commit
    --[no-]cleanup <mode> how to strip spaces and #comments from message
    --[no-]status         include status in commit message template
    -S, --[no-]gpg-sign[=<key-id>]
                          GPG sign commit

Commit contents options
    -a, --[no-]all        commit all changed files
    -i, --[no-]include    add specified files to index for commit
    --[no-]interactive    interactively add files
    -p, --[no-]patch      interactively add changes
    -o, --[no-]only       commit only specified files
    -n, --no-verify       bypass pre-commit and commit-msg hooks
    --verify              opposite of --no-verify
    --[no-]dry-run        show what would be committed
    --[no-]short          show status concisely
    --[no-]branch         show branch information
    --[no-]ahead-behind   compute full ahead/behind values
    --[no-]porcelain      machine-readable output
    --[no-]long           show status in long format (default)
    -z, --[no-]null       terminate entries with NUL
    --[no-]amend          amend previous commit
    --no-post-rewrite     bypass post-rewrite hook
    --post-rewrite        opposite of --no-post-rewrite
    -u, --[no-]untracked-files[=<mode>]
                          show untracked files, optional modes: all, normal, no. (Default: all)
    --[no-]pathspec-from-file <file>
                          read pathspec from file
    --[no-]pathspec-file-nul
                          with --pathspec-from-file, pathspec elements are separated with NUL character

PS C:\Users\rinac\Documents\p5.js\00_Community\p5.js-web-editor\p5.js-web-editor> git log -1
commit bf616998b0bb34f7d9eb97369ba8c792eac4c33a (HEAD -> documentation-updates)
Author: imrinahru <120927437+imrinahru@users.noreply.github.com>
Date:   Fri Nov 14 15:35:35 2025 -0500

    Adding in a title for manual installation for windows
PS C:\Users\rinac\Documents\p5.js\00_Community\p5.js-web-editor\p5.js-web-editor>
```


## Slides & media  
-   ![[introduction-to-open-source.pdf]]

## Links

- https://docs.github.com/en/get-started/learning-about-github/github-glossary Github glossary
- https://www.ashedryden.com/blog/the-ethics-of-unpaid-labor-and-the-oss-community On fee labor
- https://discourse.processing.org/ PF discourse
- https://github.com/processing/p5.js-web-editor/wiki wiki
- http://github.com/processing/p5.js-web-editor/discussions discussions
- 