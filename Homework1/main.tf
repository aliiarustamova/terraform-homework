#Creating users

resource "aws_iam_user" "jenny" {
  name = "jenny"
}

resource "aws_iam_user" "rose" {
  name = "rose"
}

resource "aws_iam_user" "lisa" {
  name = "lisa"
}

resource "aws_iam_user" "jisoo" {
  name = "jisoo"
}

resource "aws_iam_user" "jihyo" {
  name = "jihyo"
}

resource "aws_iam_user" "sana" {
  name = "sana"
}

resource "aws_iam_user" "momo" {
  name = "momo"
}

resource "aws_iam_user" "dahyun" {
  name = "dahyun"
}

#Creating groups

resource "aws_iam_group" "group1" {
  name = "blackpink"
}

resource "aws_iam_group" "group2" {
  name = "twice"
}

#Adding members to groups

resource "aws_iam_group_membership" "blackpink_members" {
  name = "blackpink_group"

  users = [
    aws_iam_user.jenny.name,
    aws_iam_user.rose.name,
    aws_iam_user.lisa.name,
    aws_iam_user.jisoo.name,
    aws_iam_user.miyeon.name #added lastly
  ]
  group = aws_iam_group.group1.name
}

resource "aws_iam_group_membership" "twice_members" {
  name = "twice_group"

  users = [
    aws_iam_user.jihyo.name,
    aws_iam_user.sana.name,
    aws_iam_user.momo.name,
    aws_iam_user.dahyun.name,
    aws_iam_user.mina.name #added lastly
  ]
  group = aws_iam_group.group2.name
}

#Created these users manually, will just need to import them

resource "aws_iam_user" "miyeon" {
  name = "miyeon"
}

resource "aws_iam_user" "mina" {
  name = "mina"
}

#Running the commands below to import manually created users

#terraform import aws_iam_user.miyeon miyeon 
#terraform import aws_iam_user.mina mina

#then adding mina and miyeon to their groups