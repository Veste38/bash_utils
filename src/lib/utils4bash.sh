#!/bin/bash

# === Utilities Bash library ===
# author: Steve Leroy
# ====================================
# Usage:
# utils_sudo_prompt message

utils_sudo_prompt() {
	sudo -l > /dev/null
}

