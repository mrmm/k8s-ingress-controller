#!/bin/bash
BASEDIR=$(dirname "$0")
source $BASEDIR/helpers.sh

target="manifests-all.yaml"
manifest_dir="manifests"

function create-manifest-all(){
	target=$1
	manifest_dir=$2	

	rm "$target"
	printf -- "# Derived from ./$manifest_dir/*.yaml\n---\n" >> "$target"
	for file in ./$manifest_dir/*.yaml ; do
	  if [ -e "$file" ] ; then
	  	info "Adding $file"
	  	echo "# File : $file" >> "$target"
		cat "$file" >> "$target"
		printf -- "\n---\n" >> "$target"
	  fi
	done
}

if [ -d "$manifest_dir" ]; then
	warning "THE FILE $target WILL BE REPLACED AND ALL ITS CONTENT WILL BE REMOVED"

  	read -r -p "Do you want to generate the new manifest-all file ? [y/N] " response
	if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]
	then
		create-manifest-all $target $manifest_dir
		info "Generation done !"
	else
		error "Aborting generation !"
	fi
else
	error "Manifest directory does not exists !"
	error " make sure you have [$manifest_dir] in the current directory before running the command"
fi
