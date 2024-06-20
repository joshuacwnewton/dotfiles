This repo started out by using Atlassian's [git-managed dotfiles](https://www.atlassian.com/git/tutorials/dotfiles) workflow.

### The problem with bare `.cfg/` repos for dotfiles

The above tutorial has you create a bare git repository in the `~/.cfg` directory. You manually check dotfiles into this git repo using a separate `config` alias, which works identically to the `git` command. `config status` will only list files that are manually checked in (so that the majority of your home directory won't accidentally be tracked by the dotfiles repo).

 However, I found this manual process to be a bit cumbersome and unintuitive. I had to repeatedly context-switch between the `git` and `config` commands, while also remembering to manually check in new config files. Which new config files should I check in? When I install a new software package, how do I know where its config files are generated, and whether it's feasible or worthwhile to check them in? Are they in `~/.config`, or directly in my home directory? Are the contents of the config directories human-readable and editable, or are they a garbled mess of XML and DB files?

### The nuclear approach: Track everything

To address these concerns, I did something a little crazy: I turned my entire `$HOME` directory into a git repository. This has an immediate downside: It requires me to manually exclude every single file and folder in my home directory that I don't want to track. But, if you're willing to put in that effort, then this approach has a number of benefits:

- You can use `git` commands directly, without the need for a `config` alias.
- You can also use whichever GUI-based git tool you're most familiar with. (I personally use PyCharm in my day-to-day work, and I'm very familiar with its git and file management interfaces. But, it turns out it's easy to point PyCharm _at your home directory git repo_, too. This grants you a competent interface for managing your home directory, neatly displaying folder contents, a file editor, and changed/new files all in one window)
  <img
    src="https://i.ibb.co/C6bjyRj/Screenshot-from-2024-06-20-15-34-31.png"
    alt="Screenshot of PyCharm window with 'Project', 'Commit', and 'Terminal' tabs open."
  />
- Accounting for every file and folder gives you a much deeper understanding of what actually happens inside your home directory. You will intimately know what config files are typical for a fresh installation of your distro, desktop environment, and window manager of choice. Dotfiles and folders go from a messy annoyance to a familiar part of your digital home.
- Once you're up-to-date with the current state of your home directory, you can incrementally track changes caused by new software installations (which is surprisingly manageable!). This will allow you to better customize the software you use most frequently, when possible.

It's a bit of work, but I think embarking on path has made me feel much more comfortable as a developer and Linux enthusiast. :)

> [!NOTE]
> Many of the settings in this repo are tailored to my work with [**Spinal Cord Toolbox**](https://github.com/spinalcordtoolbox/spinalcordtoolbox) and the broader medical image processing ecosystem.
