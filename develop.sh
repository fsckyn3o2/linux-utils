#!/bin/bash
export scriptsRegister+=("develop")

clion_debug() {
  echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
}

