resource "random_password" "vm_password" {
    length           = 16
    override_special = "_%@"
    special          = true
}

resource "tls_private_key" "vm_key" {
    algorithm = "RSA"
    rsa_bits  = 4096
}

resource "local_file" "private_key_file" {
    content          = tls_private_key.vm_key.private_key_pem
    filename         = "${path.module}/../../.secrets/id_rsa_${var.primary_key}"
    file_permission  = "0600"
}

resource "local_file" "public_key_file" {
    content          = tls_private_key.vm_key.public_key_openssh
    filename         = "${path.module}/../../.secrets/id_rsa_${var.primary_key}.pub"
    file_permission  = "0644"
}

resource "random_string" "short" {
    length    = 4
    special   = false
    upper     = false
    lower     = false
    numeric   = true
    // random_string.short.result
}