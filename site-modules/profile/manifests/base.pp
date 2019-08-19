class profile::base {

  #the base profile should include component modules that will be on all nodes

  accounts::user { 'monitoring':
    managehome => false,
  }

}
