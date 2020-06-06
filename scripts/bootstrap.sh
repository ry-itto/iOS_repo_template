#! /bin/bash

check_depends() {
    if ! type "brew" > /dev/null; then
        echo '`brew` not found. Please install Homebrew'
        exit 1
    fi

    if ! type "rbenv" > /dev/null; then
        echo '`rbenv` not found. Please install rbenv'
        exit 1
    fi

    RUBY_VERSION="$(rbenv local)"
    if [ "$(rbenv versions --bare | grep ${RUBY_VERSION})" = '' ]; then
        echo "Ruby version $RUBY_VERSION is not found. Please install Ruby version $RUBY_VERSION"
        exit 1
    fi
}

dependencies() {
    # Install Brew dependencies
    brew bundle -v

    # Install Mint dependencies
    mint bootstrap -v

    # Install Mint dependencies
    bundle install
}

replace_project_name() {
    REPLACEMENT_TARGET_FILES='
    project.yml
    swiftgen.yml
    .swiftlint.yml
    '
    REPLACEMENT_TARGET={Template}

    project_name=$1
    for file in $REPLACEMENT_TARGET_FILES; do
        sed -i "" "s/$REPLACEMENT_TARGET/$project_name/g" $file
    done
    mv $REPLACEMENT_TARGET $project_name
}

replace_bundle_identifier() {
    REPLACEMENT_TARGET_FILES='
    project.yml
    fastlane/Appfile
    '
    REPLACEMENT_TARGET={BUNDLE_IDENTIFIER}
    
    bundle_identifier=$1
    for file in $REPLACEMENT_TARGET_FILES; do
        sed -i "" "s/$REPLACEMENT_TARGET/$bundle_identifier/g" $file
    done
}

main() {
    check_depends
    dependencies
    replace_project_name $1
    replace_bundle_identifier $2
}

main $1 $2
