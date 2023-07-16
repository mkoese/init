# Home `bin` folder

## Create directories in `~`

```shell
while IFS= read -r directory; do mkdir -vp "$(eval echo $directory)"; done < .homecreate
```

## Create links to initial scripts

```shell
mkdir -vp ~/bin && ln -vs ~/Repos/github.com/mkoese/bin/* ~/bin
```

## Create backups or restore backups

Create backups to the cloud:
```shell
# Don't forget the space
 export RCLONE_CONFIG_PASS='changeit'
sync-home-to-cloud.sh
```


Restore backups from the cloud:
```shell
# Don't forget the space
 export RCLONE_CONFIG_PASS='changeit'
sync-cloud-to-home.sh
``````