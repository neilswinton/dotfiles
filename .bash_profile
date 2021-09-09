export USER="${USER:-developer}"
export PATH="$HOME/.local/bin:$HOME/bin:$PATH"
export TZ="America/New_York"
export DOCKER_HOST=host.docker.internal:2375
export LC_ALL=C.UTF-8
export LANG=C.UTF-8

for dir in ~/git/*;do
    test -d $dir && test -r $dir/.bash_profile && source $dir/.bash_profile
done

for gitdir in ~/git/*;do test -d "$gitdir" && (cd "$gitdir";echo;pwd;echo;git status);done
export LOCALE=en_US
