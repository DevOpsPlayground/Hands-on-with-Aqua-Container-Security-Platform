output "jenkins_master_url" {
  description = "URL of the Jenkins Master instance"
  value       = "${formatlist("http://%s:%s",aws_instance.jenkins_instance.*.public_ip,"8080")}"
}