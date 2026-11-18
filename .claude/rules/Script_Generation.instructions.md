# Guidelines for Script Generation

---
description: Referenced when generating code.
---


## Namespace casing


<rule tag="text_casing">

### Class Names

<prompt type="instruction" tag="class">

For all class and file names, every first letter of every word is capitalized, the rest are lowercase, and all words are separated by underscores.

</prompt>


### Variable Names

<prompt type="instruction" tag="variable">

All variable names use snake_case. As in all letters are lowercase (or for short names that come in sets such as enums, then all uppercase), with words seperated by underscores.

</prompt>


### Markdown 

<prompt type="instruction" tag="markdown">

- For Markdown Documentation for the project, File Names use Title Case, with words seperated by spaces.
- For Headings within the Markdown files, They are structured like a sentence fragment, with the first letter capitalized and the rest lowercase, with the exception of important words or key words to the topic.

</prompt>



<prompt type="instruction" tag="resources">

Mutable .tres Data all have the filename "DATA.tres", and therefore are All Caps.

</prompt>


</rule>


## Code bits


<rule tag="code_bits">


<prompt type="instruction">

Please split all code into as small as sub-components as possible and then give them their own distinct scripts/files. 

</prompt>


<prompt type="limit_extension">

Do this even when it slows down the program at runtime or requires extra wiring from me. 

</prompt>


<prompt type="context">

I will use the time spent putting the final touches to learn more about Godot and refine the game so that it is ready for public play-testing and it is ready to be edited thoroughly when needed to accommodate expansion.

</prompt>


</rule>


## File Type usage


<rule tag="file_variety">


<prompt type="instruction">

Pack as many things into resources or references as possible for data and in-game mutable data. All scripts should be short, but nodes should connect to other resources and references for any script not required to be in a node.

</prompt>


<prompt type="context">

Do this with the intent to make node scripts short and to keep all scripts as modular and small as possible.

</prompt>


</rule>


## Scene Tree paths handling


<rule tag="tree-paths">


<prompt type="instruction">

When hooking up Nodes to each other on a tree or any king of filepath, node-path, or Resource accessing please export the variable to the editor.

</prompt>


<prompt type="context">

I want to select the file/resource or node with the editors file-picker or tree display.

</prompt>


</rule>
