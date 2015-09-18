function init -a path --on-event init_golang
  for arch in 386 amd64 arm;
    for os in windows linux darwin android nacl;
      function go-$os-$arch
        env GOOS=$os GOARCH=$arch go $argv
      end
    end
  end

  # Add the GOPATH/bin paths to the local PATH.
  for go_path in $GOPATH;
    if test -d $go_path
      set PATH $PATH $go_path/bin
    end
  end
end