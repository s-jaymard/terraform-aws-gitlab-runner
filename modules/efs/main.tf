resource "aws_efs_file_system" "efs" {
   creation_token = "efs-token"
   performance_mode = "generalPurpose"
   throughput_mode = "bursting"
   encrypted = "true"
   tags = {
     Name = var.environment
   }
 }

 resource "aws_efs_mount_target" "efs-mount" {
   file_system_id  = "${aws_efs_file_system.efs.id}"
   subnet_id = var.subnet_id
   security_groups = [var.security_group]
 }

 data "aws_efs_mount_target" "efs_by_id" {
   mount_target_id  = "${aws_efs_mount_target.efs-mount.id}"
 }