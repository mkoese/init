# Home `bin` folder

## Create `~` directories

```shell
while IFS= read -r directory; do mkdir -vp "$(eval echo $directory)"; done < .homecreate

```

## Create links

```shell
mkdir -vp ~/bin && ln -vs ~/Repos/github.com/mkoese/bin/* ~/bin
```