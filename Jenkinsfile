pipeline {
  agent any 
  parameters {
    password (name: 'AWS_ACCESS_KEY_ID')
    password (name: 'AWS_SECRET_ACCESS_KEY')
    string defaultValue: '2', description: '', name: 'count', trim: false
  }
  environment {
   TF_WORKSPACE = 'terraform' //Sets the Terraform Workspace
   
    TF_IN_AUTOMATION = 'true'
    AWS_ACCESS_KEY_ID = "${params.AWS_ACCESS_KEY_ID}"
    AWS_SECRET_ACCESS_KEY = "${params.AWS_SECRET_ACCESS_KEY}"
    count = "${params.instance_count}"
  }
  stages {
    stage('Terraform Init') {
      steps {
        sh "terraform init -input=false"
      }
    }
    stage('Terraform Plan') {
      steps {
        sh "terraform plan -out=tfplan -input=false -var-file='terraform.tfvars'"
      }
    }
    stage('Terraform Apply') {
      steps {
        sh "terraform apply -input=false tfplan"
      }
    }
  }
}
