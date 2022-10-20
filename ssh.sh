#!/bin/bash

ssh-extract-pubkey(){
 ssh-keygen -y -f $1
}

