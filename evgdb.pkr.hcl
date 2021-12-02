source "docker" "postgres" {
    image = "postgres:10-bullseye"
    commit = true
    changes = [
        "CMD [\"postgres\"]",
        "ENTRYPOINT [\"docker-entrypoint.sh\"]"
    ]
}
build {
    sources = [
        "source.docker.postgres"
    ]

    provisioner "shell" {
        inline = [
            "apt update",
            "apt install -y python3"
        ]
    }
    provisioner "ansible" {
        playbook_file = "./playbook.yml"
    }

    post-processor "docker-tag" {
        repository = "ghcr.io/aadl/evgdb"
        tags = ["latest"]
    }

    post-processor "docker-push" {}
}
