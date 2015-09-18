for arch in 386 amd64 arm;
  for os in windows linux darwin android nacl;
    function go-$os-$arch
      env GOOS=$os GOARCH=$arch go $argv
    end
    
    function wgo-$os-$arch
      env GOOS=$os GOARCH=$arch wgo $argv
    end
  end
end

# Add the GOPATH/bin paths to the local PATH.
function init -a path --on-event init_amanda-golang
  for go_path in $GOPATH;
    if test -d $go_path
      set PATH $PATH $go_path/bin
    end
  end
end