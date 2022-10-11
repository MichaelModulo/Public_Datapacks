|   Datapack      |   Document       |   Version   |
| --------------- | ---------------- | ----------- |
| util_fake_blocks | DOCUMENTATION.md | 2022-10-10  |

# `util_fake_blocks` Documentation
This document provides an overview of the `util_fake_blocks` datapack's features.

## Table of Contents
1. [Features](#features)
   1. [Items](#items)

# Features
`util_fake_blocks` adds a system for creating and removing fake blocks. These fake blocks look like normal blocks but do not have a hitbox and can be walked through.

## Items
`util_fake_blocks` introduces a few dev items that allow you to easily create and remove fake blocks.
| Loot Table                              | Description                                            |
| --------------------------------------- | ------------------------------------------------------ |
| util_fake_blocks:dev/fake_block_setup   | Command block that creates a fake block in setup mode. |
| util_fake_blocks:dev/fake_block_removal | Command block that removes the nearest fake block.     |