
# Photos

## Intro
Google photos keeps the image/video filenames untouched.<br>
Also exiv data is mostly untouched <br>
But the resolution is reduced approximately by 3<br>
(On videos even can be reduced by 5)

## Strategy when dealing with camera and google photos
1. Transfer `Camera` folder from phone/camera to pc into temporary working folder.
2. Make a copy to local album called as `album`.<br>
   Examine the local album with feh and keep good photos/videos
    * While brousing with feh use Delete button to remove image from the filelist
    * Press `L` in order to save the current filelist
    * Now run `cleanup_feh_list.sh` from inside directory to remove all files that are not part of filelist
3. Upload the local album to google photos album
4. Ask friends to upload their photos to same album
5. Download the whole google photos album
6. Merge photos new photos from google album to local album
    * ` rsync -avh --ignore-existing google_album/ album`
7. Optionally execute step 2 again
8. Copy the album in main photos folder. Delete temporary working folder

## Strategy when dealing with whatsup images

## Feh

### Modes

* Slideshow mode
    * the images can be deleted either from filelist or from the disk
* Montage mode
* Index mode - mage thumbnails are shown along with the filename, size and dimensions
* Thumbnail mode
* Multiwindow mode
* List mode

### Options
* `-A`  action to perform on image. Example: `feh -A "mv ~/images/%N" *`
  * The action will run when action_0 key is pressed
* `-G` draw the defined actions and what they do at the top left of the image
* `-d` draw the filename
* `--edit` enable basic editing (rotation/mirroring) on the file (and not on display only).
* `-f file` use `file` as filelist
* `-F` fullscreen
* `-g width x height + x + y` Use fixed window size (and offsets)
* `-i` index mode
* `--info [flag]command_line` execute command_line and display it's output in the bottom left corner. Supports FORMAT specifiers
* `-m` montage mode
* `-t` thumbnails mode

### Format specifiers
* `%f` Image path/filename
* `%F` Escaped image path/filename
* `%n` image name
* `%N` escaped image name

### Configuration
* The confiiguration files are in `~/.config/feh/ `. Three config files supported: `themes`, `keys`, `buttons`

### Default keys
* `a` toggle actions display
* `c` toggle caption entry mode
* `d` toggle filename display
* `g` toggle automatic window resize
* `i` toggle info display
* `k` keep zoom and viewport
* `L` save current filelist
* `m` show menu
* `s` save image
* `w` change window size to fit current image size
* `x` close current window
* `<,>` rotate the image 90 degrees
* `0 .. 9` execute corresponding action
* `*` zoom 100%
