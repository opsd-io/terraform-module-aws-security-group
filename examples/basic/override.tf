# Make sure we're using working version (from local directory, not git).

module "sg_test1" {
  source = "./../.."
}

module "sg_test2" {
  source = "./../.."
}
