# clean up
rm -rf $HOME/.ssh/config

# configure
mkdir -p $HOME/.ssh/config.d
ln -s $CONFIG_DIR/ssh/config $HOME/.ssh/config
