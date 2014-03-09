class repository {
  case $::osfamily {
    redhat  : { include redhat_repository }
    default : { notice("Unsupported OS family '${::osfamily}'") }
  }
}