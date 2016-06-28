alias l='ls -al'
alias gst='git status'
alias gac='git commit -a -m'
alias dev='cd ~/development'

set -x PATH $PATH $HOME/bin

# Add path to RubyGems executables
if which ruby >/dev/null; and which gem >/dev/null; then
   set -x PATH (ruby -rubygems -e 'puts Gem.user_dir')/bin $PATH
end

function update-repo --description 'Update a single APT repository'
   for source in $argv
      sudo apt-get update -o Dir::Etc::sourcelist="sources.list.d/$source" \
         -o Dir::Etc::sourceparts="-" -o APT::Get::List-Cleanup="0"
   end
end
