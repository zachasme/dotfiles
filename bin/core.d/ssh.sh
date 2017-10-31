# clean up
rm -rf $HOME/.ssh/config

# configure
mkdir -p $HOME/.ssh/config.d
ln -s $LIB_DIR/ssh/config $HOME/.ssh/config
