provider "oci" {
  config_file_profile = "DEFAULT"
}

resource "oci_core_instance" "traccar_server" {
  compartment_id      = var.compartment_ocid
  availability_domain = var.availability_domain
  shape               = "VM.Standard.E2.1.Micro"
  subnet_id           = var.subnet_ocid
  display_name        = "TraccarUbuntu2204"

  metadata = {
    ssh_authorized_keys = file(var.ssh_public_key_file)
    user_data           = base64encode(data.template_file.traccar_user_data.rendered)
  }

  source_details {
    source_type = "image"
    source_id   = var.instance_image_ocid # Ubuntu 22.04 OCID for your region
  }
}

data "template_file" "traccar_user_data" {
  template = <<-EOT
    #!/bin/bash
    sudo apt-get update && sudo apt-get install -y wget unzip default-jre
    wget https://github.com/traccar/traccar/releases/download/v5.5/traccar-linux-64-5.5.zip
    unzip traccar-linux-64-5.5.zip -d /opt/traccar
    sudo /opt/traccar/bin/installDaemon.sh
    sudo systemctl enable traccar
    sudo systemctl start traccar
  EOT
}