#!/usr/bin/python3

import argparse
import glob
import os
import subprocess


recipes_dir = os.path.join(
    os.path.dirname(os.path.realpath(__file__)),
    "recipes"
)


def search(name: str):
    recipe_files = glob.glob(os.path.join(recipes_dir, "*.md"))
    recipe_files = [os.path.basename(file) for file in recipe_files]
    recipe_names = {file.split(".")[0] for file in recipe_files}

    if name not in recipe_names:
        raise Exception("recipe not found")

    recipe_file = os.path.join(recipes_dir, name + ".md")
    with open(recipe_file) as f:
        print(f.read())

def edit(name: str):
    recipe_path = os.path.join(recipes_dir, name + ".md")
    subprocess.run(["nvim", recipe_path])


if __name__ == "__main__":
    subcommands = {
        "search": search,
        "edit": edit,
    }
    parser = argparse.ArgumentParser(description='Process some integers.')
    parser.add_argument('cmd', type=str, choices=subcommands.keys())
    parser.add_argument('name', type=str)
    args = parser.parse_args()

    subcommands[args.cmd](args.name)
