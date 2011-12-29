function smack {
  if [[ -z $1 ]]; then
    SMACK_FOLDER=.;
  else
    SMACK_FOLDER=$1;
  fi

  mkdir -p $SMACK_FOLDER/base;
  mkdir -p $SMACK_FOLDER/layout;
  mkdir -p $SMACK_FOLDER/modules;

  touch $SMACK_FOLDER/_base.sass;
  touch $SMACK_FOLDER/_layout.sass;
  touch $SMACK_FOLDER/_modules.sass;
}
