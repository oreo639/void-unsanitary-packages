# void-unsanitary-packages
Just a collection of unoffical templates that are usefull for me, but not really for the main void repo.

### Note
The `devkitpro-pacman` package avaliable here is deprecated and will not recieve updates. It is recommended to move to the offical `pacman` package avaliable in the Void repos.

Please read [this](https://devkitpro.org/viewtopic.php?f=25&t=8847) for more information on how to properly migrate to the `pacman` package.

# Usage
Run `./unsanitary.sh` and then cd into void-packages. Templates are copied from the templates directory into the `void-packages/srcpkgs` directory, so you will need to rerun `unsanitary.sh` after editing the packages in the `templates` directory.

If you need to update void-packages, just simply rerun `unsanitary.sh`. (WARNING: Any files in the `void-packages/srcpkgs` directory will be deleted.)

## Templates
```
devkitpro-pacman
```
