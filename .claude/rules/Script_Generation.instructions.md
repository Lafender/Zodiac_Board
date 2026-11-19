# Guidelines for Script Generation

---
description: Referenced when generating code.
---


<rule tag="text_casing">


<heading tag="text_casing">

## Namespace casing

</heading>


<heading tag="class">

### Class Names

</heading>


<prompt type="instruction" tag="class">

For all class and file names, every first letter of every word is capitalized, the rest are lowercase, and all words are separated by underscores.

</prompt>


<heading tag="variable">

### Variable Names

</heading>


<prompt type="instruction" tag="variable">

All variable names use snake_case. As in all letters are lowercase (or for short names that come in sets such as enums, then all uppercase), with words seperated by underscores.

</prompt>


<heading tag="markdown">

### Markdown 

</heading>


<prompt type="instruction" tag="markdown">

- For Markdown Documentation for the project, File Names use Title Case, with words seperated by spaces.
- For Headings within the Markdown files, They are structured like a sentence fragment, with the first letter capitalized and the rest lowercase, with the exception of important words or key words to the topic.

</prompt>


<heading tag="resources">

### Resources

</heading>


<prompt type="instruction" tag="resources">

Mutable .tres Data all have the filename "DATA.tres", and therefore are All Caps.

</prompt>


</rule>


<rule tag="code_bits">


<heading tag="code_bits">

## Code bits

</heading>


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


<rule tag="file_variety">


<heading tag="file_variety">

## File Type usage

</heading>


<prompt type="instruction">

Pack as many things into resources or references as possible for data and in-game mutable data. All scripts should be short, but nodes should connect to other resources and references for any script not required to be in a node.

</prompt>


<prompt type="context">

Do this with the intent to make node scripts short and to keep all scripts as modular and small as possible.

</prompt>


</rule>


<rule tag="tree-paths">


<heading tag="tree-paths">

## Scene Tree paths handling

</heading>


<prompt type="instruction">

When hooking up Nodes to each other on a tree or any king of filepath, node-path, or Resource accessing please export the variable to the editor.

</prompt>


<prompt type="context">

I want to select the file/resource or node with the editors file-picker or tree display.

</prompt>


</rule>



<rule tag="project_file_dir_guidelines_">


<heading tag="project_file_dir-guidelines">

## Project File-Directory structure guidelines

</heading>


<prompt tag="general_file_organization">

The main top-level folders in the projects directory are:


<directory_list>

<directory_instructions resource_path="res://.claude/rules/Script_Generation/general_file_organization/Special_Directories/Documentation.instructions.md">

</durectory_instructions>


<directory_instructions resource_path="res://.claude/rules/Script_Generation/general_file_organization/Runtime_Directories/Character.instructions.md">

</directory_instructions>


<directory_instructions resource_path="res//.claude/rules/Script_Generation/general_file_organization/Runtime_Directories_Instructions/Field.instructions.md">

</directory_instructions>


<directory_instructions resource_path="res://.claude/rules/Script_Generation/general_file_organization/Database_Directories/Chemistry.instructions.md">

</directory_instructions>


<directory>

</directory>


<directory>

</directory>


<directory>

</directory>


</directory_list>


</prompt>


<prompt type="instruction">

The scripts and data should be placed in the following directories:

<list>

- A folder named "schema" for scripts representing Resource and Node class definitions.
- A folder named "data" for scripts representing Resource class instances.
- A folder named "tools" for References that only contain functions and little or no data.
- A folder named "database" for long lists of data in Resource classes, References, or other Objects or variables.
- A folder named "sprites" or "spriteframes" for images and SpriteFrame resources.


</list>

</prompt>


</rule>