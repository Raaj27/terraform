pipeline {
  agent any 
  parameters {
    password (name: 'AWS_ACCESS_KEY_ID')
    password (name: 'AWS_SECRET_ACCESS_KEY')
    string defaultValue: '0', description: '', name: 'COUNT', trim: false
  }
  environment {
   
    AWS_ACCESS_KEY_ID = "${params.AWS_ACCESS_KEY_ID}"
    AWS_SECRET_ACCESS_KEY = "${params.AWS_SECRET_ACCESS_KEY}"
    COUNT = "${params.COUNT}.toInteger()"
    
  }
  stages {
    stage('Create Instance') {
      steps {
        sh "terraform init" 
        sh "terraform plan -var=instance_count=${params.COUNT}"
        sh  "terraform apply --auto-approve"
      }
    
    }
    
  }
}
