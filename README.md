# asc-key-to-qr-code-gif

A script that converts ASCII-armored PGP keys (or any texts) to a series of QR codes.  

This allows to transfer texts from a PC to other devices that can scan and
decode QR codes. The script was originally made for transfering keys into [Pass for iOS](https://github.com/mssun/passforios).

## Dependencies

1. [libqrencode](http://fukuchi.org/works/qrencode/): Generate QR codes.
2. [imagemagick](https://www.imagemagick.org/script/index.php): Convert PNGs to GIF.
3. (Optional) [zbar](http://zbar.sourceforge.net): Read and test QR codes.

## Usage

```bash
# find gpg key id
gpg --list-keys
# generate gif's for a given key id
make KEY_ID=xxxxxxxxxxxxxx
# scan gif's in pass for ios app
imgcat public.gif
imgcat private.gif
```
