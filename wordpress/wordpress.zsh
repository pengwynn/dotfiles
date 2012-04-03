function wp-clone() {
  DEST=$1
  mkdir -p $DEST
  curl http://wordpress.org/latest.tar.gz | tar xvz -C $DEST
  mv $DEST/wordpress/* $DEST
  rm -rf $DEST/wordpress
}
