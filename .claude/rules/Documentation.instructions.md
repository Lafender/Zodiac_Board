# Documentation Instructions

---
description: After generating or editing code, please generate documentation for the project. 
paths:
  - "/Documentation/"
---

## Presenting Responses

<rule tag="presenting_responses_general">

<prompt type="instruction">

Please include all instructions nessessaring for installing the code. Generate sample and template files that I can easily edit into my own assets and will run out of the box.

</prompt>

<prompt type="limit_extenstion" tag="file_paths">

- Include a list of all files that have a file path in them so that I can update them with the correct path to where ever I want to place them in the directory tree.
- Include a list of all files than need changing if I edit the sample files and how they need to be changed. Give each variable it's own H4 in the Template file's markdown file.

</prompt>

</rule>


## Documentation Organization

<rule tag="documentation_file_paths">

<prompt type="instruction">

Save all documentation in the project's "Documentation" folder.

</prompt>

<prompt type="limit_extension">

- Create folders within the "Documentation" folder to organize the files so that examples and demo files are stored with the same folder as themarkdown files that explain them. 
- Create main MOCs in the top level Documentation folder and for the rest mirror the folder structure of the project as much as possible.

</prompt>

</rule>