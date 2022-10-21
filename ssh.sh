#!/bin/bash
export scriptsRegister+=("ssh")

ssh-extract-pubkey(){
 ssh-keygen -y -f $1
}

