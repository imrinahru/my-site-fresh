---
title: First Bug Fix
date: 2025-11-16
tags:
  - project
summary: |
  Elevator-pitch description (appears on the card).
status: idea
cover:
draft: false
---



A first contribution/bug fix can feel intimidating. Here is a sample routine of debugging using p5.js, GitHub and command lines (Windows Powershell). 

Issue: [[p5.js 2.0 Bug Report]: Switching from 1.x to 2.x, pixelDensity() only applies to canvas, not p5.Graphics #8289](https://github.com/processing/p5.js/issues/8289#event-23004513635)
Fix: [fix: createGraphics inherits pixelDensity from parent sketch.#8558](https://github.com/processing/p5.js/pull/8558)


## A Mental Model

You have 3 copies of the repo

| Name         | Where it lives                | What it is                                             |
| ------------ | ----------------------------- | ------------------------------------------------------ |
| **upstream** | `github.com/processing/p5.js` | The original p5.js repo (owned by the Processing team) |
| **origin**   | `github.com/imrinahru/p5.js`  | Your fork on GitHub (your copy)                        |
| **local**    | `C:\path\to\p5.js`            | The folder on your computer                            |

Helpful commands:
1. `cd` to go to the folder of the local repo
2. `ls` list the last write time of files in the directory
3. `git remote -v` to check the upstream remote (the original p5.js repo) set up
4.  `git fetch upstream` to download latest refs from upstream (the original repository)

> [!NOTE] git fetch
> **downloads** all the latest commits, branches, and tags from the remote — but **leaves your working files exactly as they are**

5. `gif pull origin <branch name>` **downloads AND merge into my current branch**

> [!NOTE] git fetch vs. git pull
> When to use which?
> 
> | Situation                                                                 | Use         | Why                                          |
| ------------------------------------------------------------------------- | ----------- | -------------------------------------------- |
| You want to **check** what changed before touching anything               | `git fetch` | Safe — doesn't modify your files             |
| You're **ready to update** your branch with the latest code               | `git pull`  | Convenient — does everything in one step     |
| You're in the **middle of coding** and don't want to risk breaking things | `git fetch` | You can review first, merge later when ready |
| You **just started** and want to get up to date quickly                   | `git pull`  | Fastest way to sync up                       |

6. `git branch` to check which branch you are currently on
7. `git checkout <branch name>` to switch to a specific local branch
8. `git log -1` check your last commit

The command line example 

```
PowerShell 7.5.4
PS ... ls
...
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
...
```

```
PS ... git branch
* develop
```

```
PS ... git remote -v
origin  https://github.com/imrinahru/p5.js-web-editor.git (fetch)
origin  https://github.com/imrinahru/p5.js-web-editor.git (push)
```

```
PS ... git pull origin develop
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
```

```
PS ... npm install

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
...
cached modules 17 MiB (javascript) 63.3 KiB (asset) 87.1 KiB (runtime) [cached] 2128 modules
webpack 5.94.0 compiled successfully in 1937 ms
```

```

PS ... git checkout -b documentation-updates
Switched to a new branch 'documentation-updates'
```

```
PS ... git branch
  develop
* documentation-updates
```

```
PS ... git log -1
commit bf616998b0bb34f7d9eb97369ba8c792eac4c33a (HEAD -> documentation-updates)
Author: imrinahru <120927437+imrinahru@users.noreply.github.com>
Date:   Fri Nov 14 15:35:35 2025 -0500

    Adding in a title for manual installation for windows

```




## Debugging

1. Add debugger in front of the code you want to see, it will stop the operation there in the developer's console
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


## Setting up

Context:
- I created a branch from the p5.js v1 codebase (`main` branch) a few months ago..
- No changes were made on that branch
- Now realizing the bug exists in **v2** (`dev-2.0` branch, currently at **v2.2.2**)
- Need to start fresh from the latest upstream state on `dev-2.0`

**A1. Install right version Node.js**

Downloaded `node-v22.22.0-x64.msi` from [nodejs.org](https://nodejs.org/en/download).

- Double-click the `.msi` file and follow the wizard (keep defaults, ensure **"Add to PATH"** is checked)
- **Close and reopen PowerShell** after installation

Verify it worked:

```
node -v
```

> Expected: `v22.22.0`  (p5.js requires at least v18)

```
npm -v
```

> Should print a version number (npm is bundled with the Node.js installer)

---

**Part B: Get Local Repo Ready on `dev-2.0`**

B1. Navigate to local repo

```
cd C:\path\to\p5.js
```

B2. Verify the upstream remote

```
git remote -v
```

> If `upstream` is missing, add it:
> 
> ```
> git remote add upstream https://github.com/processing/p5.js
> ```
 
B3. Fetch the latest from upstream

```
git fetch upstream
```

B4. Switch to the `dev-2.0` branch

```
git checkout -b dev-2.0 upstream/dev-2.0
```

> If the branch already exists locally, use instead:
> 
> ```
> git checkout dev-2.0
> git pull upstream dev-2.0
> ```

B5. Deleted old v1 bug-fix branch (no changes were made, safe to remove)

```
git branch -d old-bugfix-branch-name
```

B6. Create a new bug-fix branch from the latest `dev-2.0`

```
git checkout -b fix-your-bug-description
```

> Other operations:
> Check what branch my previous bug fix was based on
> 
> ```
> git log --oneline pixelDensity-bug-fix-2x -5
> ```
> 
> This shows the last 5 commits on your branch. Compare them with:
> 
> ```
> git log --oneline dev-2.0 -5
> ```



B7. Install dependencies

```
npm install
```

> This does a full install based on `package.json`. This needs to be **re-run every time `package.json` changes** (e.g., after pulling new upstream changes).

B8. Check what scripts are available

```
npm run
```

> This lists all scripts from `package.json`. On the `dev-2.0` branch (v2.2.2), the key scripts are:
> 
> |Script|Command|What it does|
> |---|---|---|
> |`dev`|`vite preview/`|Starts a local dev server with hot reload for browser testing|
> |`dev:global`|`concurrently rollup + vite`|Builds the global-mode library and serves it|
> |`build`|`rollup -c`|One-time production build|
> |`test`|`vitest`|Runs the full test suite|
> |`lint`|`eslint .`|Checks code style|
> |`lint:fix`|`eslint --fix .`|Auto-fixes code style issues|


## Now, bug fix

General idea: 
1. **See the bug happen** → confirms you understand the problem
2. **Write the fix** → change the code
3. **See the bug disappear** → confirms your fix works
4. **Run the tests** → confirms you didn't break anything else
5. **Push & open a PR** → share your fix

Detailed operation:

6. `npm install`, it needs to be run every time package.json is updated
7. Check the script available in package.json, or run `npm run`
8. Use available script `npm run dev` to develop and test in the browser
9. Recreate and check the bug first

![[Pasted image 20260222172208.png]]

Hypothesis:
_"When `createGraphics()` creates a new graphics buffer, **something** is setting its `pixelDensity`. That something is probably using `window.devicePixelRatio` (the screen's density) instead of the parent sketch's `pixelDensity()`."_

10. Write fix

![[Pasted image 20260222172926.png]]

![[Pasted image 20260222181404.png]]

![[Pasted image 20260222174138.png]]

![[Pasted image 20260222180234.png]]

11. Repeat until bug is fixed!

![[Pasted image 20260222180247.png]]

The difficult part in this case, where I was working on making graphics object inheriting its canvas pixerlDensity: 
pInst                = g (the Graphics object)
pInst._pInst         = p (the sketch! because g remembers who created it)
pInst._pInst._renderer = the main canvas renderer (which HAS pixelDensity = 1)


12. Write a unit test

![[Pasted image 20260223001019.png]]

How to add a unit test

In my case, open `test/unit/core/rendering.js` and add your test inside the appropriate existing `suite(...)`, or create a new one.

**Option A: Add a test to an existing suite**

Find the suite that matches the feature area of your bug. For example, if your bug is about `pixelDensity`, add inside the `p5.prototype.createGraphics.pixelDensity` suite:

**Option B: Create a new suite (if your bug doesn't fit an existing group)**

Add it inside the top-level `suite('Rendering', ...)` block, **before the final closing `})

**Assertion cheat sheet**

The existing tests use both **Chai `assert`** (globally available) and **Vitest `expect`** (imported at the top). You can use either:

|What you want to check|`assert` style|`expect` style|
|---|---|---|
|Equality|`assert.equal(actual, expected)`|`expect(actual).toEqual(expected)`|
|Deep equality (arrays/objects)|`assert.deepEqual(actual, expected)`|`expect(actual).toEqual(expected)`|
|Truthy|`assert.ok(value)`|`expect(value).toBeTruthy()`|
|Type check|`assert.typeOf(val, 'function')`|`expect(typeof val).toBe('function')`|
|Throws error|—|`expect(() => fn()).toThrow()`|

#### Suites that need their own p5 instance

Some test groups (like `set() with p5.Graphics`) create their **own `myp5`** with `beforeEach`/`afterEach` instead of sharing the top-level one. Do this if your test needs a **fresh p5 instance per test** (e.g., specific canvas size or pixel density):

```
  suite('your bug fix area', function() {
    let myp5;

    beforeEach(function() {
      myp5 = new p5(function(p) {
        p.setup = function() {
```



13.  Run the tests (all, make sure nothing is broken due to my fix)

Stop the dev server (`Ctrl+C`) and run:

```
npm test
```


![[Pasted image 20260223000944.png]]

There were 4 fails, check if these are caused by my bug fix or it existed beforehand.

![[Pasted image 20260223002026.png]]


14. Commit changes with a good message

Check your changes to ensure only intended changes were made:

```
git status
git diff
```

Stage and commit:

```
git add .
git commit -m "Fix: description of what you fixed"
```


15. Push to your fork on GitHub

```
git push -u origin fix-your-bug-description
```

16. Open a Pull Request

Open a **Pull Request** on GitHub targeting the **`dev-2.0`** branch on `processing/p5.js`. Fill in the PR template:

- **Title:** Brief description of the fix
- **Resolves:** `#issue_number`
- **Changes:** What you changed and why

17. Respond to code review

18. You become a contributor!

![[Pasted image 20260307133257.png]]

---

Special special thanks to Dave who both physically and remotely helped me with the debugging process. I would not have reached the end or even figured out how to start without his support. Being able to meet in person in Toronto through the Creative Coding community made the experience even more meaningful. It was deeply fulfilling.

![[Pasted image 20260307134655.png]]