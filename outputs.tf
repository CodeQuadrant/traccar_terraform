output "instance_public_ip" {
  value = oci_core_instance.traccar_server.public_ip
}
