---
title: Untitled
date: 2025-11-16
tags:
  - project
summary: |
  Elevator-pitch description (appears on the card).
status: idea
cover: ./img/<image>.png
draft: false
---
##### Sample contribution routine in a command line


1. Open windows PowerShell
2. `cd` to go to the folder of the local repo
3. `ls` list the last write time of files in the directory
4. `git branch` to check which branch you are currently on
5. Rebase the the bug fix branch to the latest `main` if it were created a while ago
6. `git remote -v` to check the upstream remote (the original p5.js repo) set up




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

npm run test
npm run dev






Debugging

1. Add debugger in front of the code you want to see
![[Pasted image 20251120125549.png]]

2. ctl+shift+i to bring up developer's tool
3. run the sketch again now that the dev tools are open, it should stop at the debugger statement and show you a copy of the source code in the console
4. Click on downward arrow step in to enter the halftoneImage call
![[Pasted image 20251120130021.png]]

5. once it enters it, you should see the p5.riso source code
6. you can step over each statement (the arc arrow just to the left of the "step in" arrow) which just goes to the next line
7. you could switch from the sources tab to the Console tab (or I think hitting escape also brings up the console while in the Sources tab) and you can write and run some code if you want to print the current state of something

8. the debugger, when you run code, it's like read only
    
9. I don't think it lets you actually change the state of the running code
    
10. so to test out a change you end up updating the source code and rerunnin

![[Pasted image 20251120125504.png]]

![[Pasted image 20251120131620.png]]

![[Pasted image 20251120141413.png]]



Now, the actual bug fix process is:
1. **See the bug happen** → confirms you understand the problem
2. **Write the fix** → change the code
3. **See the bug disappear** → confirms your fix works
4. **Run the tests** → confirms you didn't break anything else
5. **Push & open a PR** → share your fix

Detailed operation:

1. `npm install`, it needs to be run every time package.json is updated
2. Check the script available in package.json, or run `npm run`
3. Use available script `npm run dev` to develop and test in the browser
4. Recreate and check the bug first

![[Pasted image 20260222172208.png]]

Hypothesis:
_"When `createGraphics()` creates a new graphics buffer, **something** is setting its `pixelDensity`. That something is probably using `window.devicePixelRatio` (the screen's density) instead of the parent sketch's `pixelDensity()`."_



![[Pasted image 20260222172926.png]]

![[Pasted image 20260222181404.png]]

![[Pasted image 20260222174138.png]]

![[Pasted image 20260222180234.png]]
Bug fixed!
![[Pasted image 20260222180247.png]]

The difficult part: 
pInst                = g (the Graphics object)
pInst._pInst         = p (the sketch! because g remembers who created it)
pInst._pInst._renderer = the main canvas renderer (which HAS pixelDensity = 1)


1. ✅ Fix the bug
2. Write a unit test
3. Run existing tests (make sure you didn't break anything)
4. Commit your changes with a good message
5. Push to your fork on GitHub
6. Open a Pull Request
7. Respond to code review


Unit test
![[Pasted image 20260223001019.png]]

![[Pasted image 20260223000944.png]]
npm test

![[Pasted image 20260223002026.png]]


x. ctl+c to end the server






Other operations:

### Check what branch your bug fix was based on

PowerShell

```
git log --oneline pixelDensity-bug-fix-2x -5
```

This shows the last 5 commits on your branch. Compare them with:

PowerShell

```
git log --oneline dev-2.0 -5
```

Compare the 2


