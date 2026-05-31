#!/bin/bash

echo "Please specify path to file to be signed:"
read to_be_signed

gpg --sign --armor -u "mbkozdroj@gmail.com" $to_be_signed

echo "Specified file has been signed."
