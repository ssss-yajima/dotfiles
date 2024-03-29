#!/usr/bin/env fish

if not test $INIT_LOADED

    set DOT_PATH $HOME/.dotfiles
    set CACHE_PATH $DOT_PATH/.cache

    function link-file
        for f in $argv
            if not test $DOT_PATH/$f
                continue
            end
            if not test -d $HOME/(dirname $f)
                mkdir -p $HOME/(dirname $f)
            end
            ln -snfv $DOT_PATH/$f $HOME/$f
        end
    end


    function source-config
        source $HOME/.config/fish/config.fish
    end


    function is-mac
        return (test (uname -s) = "Darwin")
    end

    if is-mac && type -q brew
        brew upgrade
    end

    function brew-install
        if is-mac && type -q brew
            brew install $argv
        end
    end

    set INIT_LOADED 1
end
