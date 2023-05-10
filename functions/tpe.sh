vimdiffr () {
    IFS=$'\n'
    for line in `/usr/bin/diff -rq --exclude=.git $1 $2 | grep differ`
    do
            diff=(${(ps: :)${line}})
            nvim -d ${diff[2]} ${diff[4]}
    done
}

function build_app() {
    if [ -z "$1" ]
    then
        echo "Usage: build_app tpe-dev"
    else
        env=$1
        branch=$(gb | grep '*' | awk '{print $2 }'| tr '/' '_')
        if [ "$2" ]
        then
            apps=(find * -type d -depth 0 -name $2)
        else
            apps=(find * -type d -depth 0)
        fi
    fi
    for app in $($apps)
    do
        echo "checking $app"
        appdir=$app/envs/$env
        test -d $appdir && \
            echo "building $appdir" && \
            kustomize build $appdir > $app-$branch.yaml
    done
}

function build_app_tag() {
    if [ -z "$1" ]
    then
        echo "Usage: build_app tpe-dev"
    else
        env=$1
        if [ "$2" ]
        then
            apps=(find * -type d -depth 0 -name $2)
        else
            apps=(find * -type d -depth 0)
        fi
    fi
    for app in $($apps)
    do
        echo "checking $app"
        appdir=$app/envs/$env
        if [ $env = "tpe-cde" ]
        then
            tag="$app-prod"
        else
            tag="$app-${env/tpe-}"
        fi

        git checkout $tag
        test -d $appdir && \
            echo "building $appdir" && \
            kustomize build $appdir > $tag.yaml
    done
}

function compare_app() {
    if [ "$1" ]
    then
        apps=(find * -type d -depth 0 -name $1)
    else
        apps=(find * -type d -depth 0)
    fi

    for app in $($apps)
    do
        echo "Checking $app"
        diff -q $app-*.yaml || vimdiff $app-*.yaml
    done
}
