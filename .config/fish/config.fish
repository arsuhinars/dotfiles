set -g fish_greeting

set -x PATH $HOME/Android/Sdk/platform-tools $PATH
set -x PATH $HOME/Android/Sdk/cmdline-tools $PATH
set -x PATH $HOME/.flutter/flutter/bin $PATH
set -x PATH $HOME/.cargo/bin $PATH
set -x PATH $HOME/go/bin $PATH
set -x JAVA_HOME "/usr/lib/jvm/java-23-openjdk/"
set -x ANDROID_HOME "$HOME/Android/Sdk"
set -x EDITOR "/bin/nvim"
set -x ROCM_PATH /opt/rocm/
set -x HSA_OVERRIDE_GFX_VERSION 11.0.0
set -x WINEPATH "/usr/x86_64-w64-mingw32/bin;/usr/lib/gcc/x86_64-w64-mingw32/13.1.0"

set -x PYENV_ROOT "$HOME/.pyenv"
set -x PATH $PYENV_ROOT/bin $PATH
pyenv rehash

if status is-interactive
    # Commands to run in interactive sessions can go here
end
