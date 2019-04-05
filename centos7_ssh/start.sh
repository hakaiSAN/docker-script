#!/bin/bash


__create_user() {
  # Create a user to SSH into as.
  USER_ID=$(id -u)
  GROUP_ID=$(id -g)
  USER_NAME=user
  echo -e "$GROUP_ID\n$USER_ID"
  if [ x"$GROUP_ID" != x"0"  ]; then
    groupadd -g $GROUP_ID $USER_NAME
  fi
 # create user 
  if [ x"$USER_ID" != x"0"  ]; then
     useradd -d /home/$USER_NAME -m -s /bin/bash -u $USER_ID -g $GROUP_ID $USER_NAME
  fi

  #useradd user
  SSH_USERPASS=newpass
  echo -e "$SSH_USERPASS\n$SSH_USERPASS" | (passwd --stdin ${USER_NAME})
  echo ssh user password: $SSH_USERPASS

}

# Call all functions
__create_user
