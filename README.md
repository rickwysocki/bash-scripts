# Bash Scripts

Simple bash scripts I've written to automate simple tasks.

## rename.sh

A simple renaming script to batch rename files in the current directory. Currently, it has two functions:

- It replaces white space with hyphens for all files and folders in the current directory.
- It takes an optional argument to prepend a string to all files and folders in the current directory.

Before renaming the files, the program will show you a preview and ask you to type `yes` to confirm the changes. **Please be careful where you run this script, as it will rename ALL files and folders in the directory.**

### Replacing White Space with Hyphens

The default feature replaces all white space with hyphens in your files. Navigate to the relevant directory and use the following command:

```
rename.sh
```

You'll see a preview:

```
Important! The following files will be renamed.
--------
File 1.pdf --> File-1.pdf
File 2.odt --> File-2.odt
Are you sure you want to rename these files?
```

Enter `yes` to confirm the changes, or enter anything else to stop the process.

### Prepend a String to the File Name and Replace White Space with Hyphens

You may also want to prepend a string to the beginning of each file name (e.g., a year). For this the script takes an optional -p argument, followed by the prepended text. For example:

```
rename.sh -p 2025_
```

You'll see the following response:

```
Important! The following files will be renamed.
--------
File 1.pdf --> 2025_File-1.pdf
File 2.odt --> 2025_File-2.odt
Are you sure you want to rename these files?
```

As with the previous example, enter `yes` to confirm the changes, or enter anything else to stop the process.
