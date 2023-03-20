resource "aws_subnet" "private-us-east-1a" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = var.private-us-east-1a-cidr
  availability_zone = "us-east-1a"

  tags = {
    "Name"                            = "private-us-east-1a"
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/project"      = "owned"
  }
}

resource "aws_subnet" "private-us-east-1b" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = var.private-us-east-1b-cidr
  availability_zone = "us-east-1b"

  tags = {
    "Name"                            = "private-us-east-1b"
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/project"      = "owned"
  }
}

resource "aws_subnet" "public-us-east-1a" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = var.public-us-east-1a-cidr
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    "Name"                       = "public-us-east-1a"
    "kubernetes.io/role/elb"     = "1"
    "kubernetes.io/cluster/project" = "owned"
  }
}

resource "aws_subnet" "public-us-east-1b" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = var.public-us-east-1b-cidr
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    "Name"                       = "public-us-east-1b"
    "kubernetes.io/role/elb"     = "1"
    "kubernetes.io/cluster/project" = "owned"
  }
}

# The first kubernetes attribute (kubernetes.io/role/elb or kubernetes.io/role/internal-elb) is to indicate whether the cluster would create a public or an internal load balancer in each subnet
# The second kubernetes attribute must have the Cluster's name (here project) after the / and the value would be either owned or shared (If it is to be shared with other clusters)
# These tags are important if u are to create a K8s cluster